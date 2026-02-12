--[[
* Grimoire UI Module
* Handles all ImGui rendering and spell data management.
--]]

require('common');
local imgui = require('imgui');

----------------------------------------------------------------------------------------------------
-- Constants
----------------------------------------------------------------------------------------------------

local job_names = {
    [0] = 'All', [1] = 'WAR', [2] = 'MNK', [3] = 'WHM', [4] = 'BLM', [5] = 'RDM',
    [6] = 'THF', [7] = 'PLD', [8] = 'DRK', [9] = 'BST', [10] = 'BRD',
    [11] = 'RNG', [12] = 'SAM', [13] = 'NIN', [14] = 'DRG', [15] = 'SMN',
    [16] = 'BLU', [17] = 'COR', [18] = 'PUP', [19] = 'DNC', [20] = 'SCH',
    [21] = 'GEO', [22] = 'RUN',
};

local skill_names = {
    [32] = 'Divine',     [33] = 'Healing',    [34] = 'Enhancing',
    [35] = 'Enfeebling', [36] = 'Elemental',  [37] = 'Dark',
    [38] = 'Summoning',  [39] = 'Ninjutsu',   [40] = 'Singing',
    [41] = 'String',     [42] = 'Wind',       [43] = 'Blue Magic',
    [44] = 'Geomancy',   [45] = 'Handbell',
};

local element_names = {
    [0] = 'Fire', [1] = 'Ice', [2] = 'Wind', [3] = 'Earth',
    [4] = 'Lightning', [5] = 'Water', [6] = 'Light', [7] = 'Dark',
    [15] = 'None',
};

-- Tab definitions
local tabs = {
    { name = 'All',        skills = nil },
    { name = 'Missing',    skills = nil, missing_only = true },
    { name = 'White',      skills = { [32]=true, [33]=true, [34]=true } },
    { name = 'Black',      skills = { [35]=true, [36]=true, [37]=true } },
    { name = 'Songs',      skills = { [40]=true, [41]=true, [42]=true } },
    { name = 'Ninjutsu',   skills = { [39]=true } },
    { name = 'Summoning',  skills = { [38]=true } },
    { name = 'Blue Magic', skills = { [43]=true } },
};

-- Jobs that use magic (for the filter dropdown)
local magic_jobs = { 3, 4, 5, 7, 8, 10, 13, 15, 16, 17, 20, 21, 22 };

----------------------------------------------------------------------------------------------------
-- UI State
----------------------------------------------------------------------------------------------------

local ui = {
    is_open         = { false },
    all_spells      = T{},
    search_buf      = { '' },
    selected_job    = { 0 },
    selected_spell  = { -1 },
    filter_known    = { 0 },
    counts          = { known = 0, total = 0 },
    acquisition     = {},
};

----------------------------------------------------------------------------------------------------
-- Data Loading
----------------------------------------------------------------------------------------------------

function ui.load()
    -- Load acquisition data..
    local ok, data = pcall(require, 'data.acquisition');
    if (ok and data) then
        ui.acquisition = data;
    end

    ui.refresh_spells();
end

function ui.refresh_spells()
    ui.all_spells = T{};
    ui.selected_spell[1] = -1;

    local player = AshitaCore:GetMemoryManager():GetPlayer();
    if (player == nil) then return; end

    for x = 0, 2048 do
        local spell = AshitaCore:GetResourceManager():GetSpellById(x);
        if (spell ~= nil and spell.Name ~= nil and spell.Name[1] ~= nil and spell.Name[1] ~= '' and spell.Name[1] ~= '.' and spell.Name[1] ~= '(Unknown)') then
            local skill = spell.Skill;
            if (skill >= 32 and skill <= 45) then
                -- Collect job level requirements..
                local jobs = {};
                local any_job = false;
                for jobId = 1, 22 do
                    local lvl = spell.LevelRequired[jobId + 1];
                    if (lvl ~= nil and lvl > 0 and lvl < 200) then
                        jobs[jobId] = lvl;
                        any_job = true;
                    end
                end

                if (any_job) then
                    -- Find lowest level for sorting..
                    local min_lvl = 999;
                    for _, v in pairs(jobs) do
                        if (v < min_lvl) then min_lvl = v; end
                    end

                    ui.all_spells:append(T{
                        index    = x,
                        name     = spell.Name[1],
                        skill    = skill,
                        element  = spell.Element,
                        mp       = spell.ManaCost,
                        jobs     = jobs,
                        min_lvl  = min_lvl,
                        known    = player:HasSpell(x),
                    });
                end
            end
        end
    end

    -- Sort by level, then name..
    ui.all_spells:sort(function (a, b)
        if (a.min_lvl ~= b.min_lvl) then return a.min_lvl < b.min_lvl; end
        return a.name < b.name;
    end);

    ui.update_counts();
end

function ui.update_counts()
    local known, total = 0, 0;
    ui.all_spells:each(function (v)
        total = total + 1;
        if (v.known) then known = known + 1; end
    end);
    ui.counts = { known = known, total = total };
end

----------------------------------------------------------------------------------------------------
-- Filtering
----------------------------------------------------------------------------------------------------

function ui.get_spell_level(spell)
    local player = AshitaCore:GetMemoryManager():GetPlayer();
    if (player == nil) then return spell.min_lvl; end

    local job_idx = ui.selected_job[1];
    if (job_idx >= 2) then
        local job = magic_jobs[job_idx - 1];
        return spell.jobs[job] or nil;
    end

    -- All mode: show min level..
    if (job_idx == 1) then
        return spell.min_lvl;
    end

    -- Current job mode..
    local main_job = player:GetMainJob();
    local sub_job  = player:GetSubJob();
    if (spell.jobs[main_job]) then return spell.jobs[main_job]; end
    if (spell.jobs[sub_job])  then return spell.jobs[sub_job]; end
    return spell.min_lvl;
end

function ui.get_filtered_spells(tab)
    local player = AshitaCore:GetMemoryManager():GetPlayer();
    if (player == nil) then return T{}; end

    local main_job     = player:GetMainJob();
    local sub_job      = player:GetSubJob();
    local main_job_lvl = player:GetMainJobLevel();
    local sub_job_lvl  = player:GetSubJobLevel();
    local job_idx      = ui.selected_job[1];
    local job_filter   = nil;
    if (job_idx >= 2) then
        job_filter = magic_jobs[job_idx - 1];
    end

    local search = ui.search_buf[1]:lower();
    local result = T{};

    ui.all_spells:each(function (spell)
        -- Tab skill filter..
        if (tab.skills ~= nil and not tab.skills[spell.skill]) then
            return;
        end

        -- Missing only filter..
        if (tab.missing_only and spell.known) then
            return;
        end

        -- Job + level filter..
        if (job_filter ~= nil) then
            local req = spell.jobs[job_filter];
            if (req == nil) then
                return;
            end
        elseif (job_idx == 0) then
            -- Current job mode: spell must be learnable by main or sub at their current level..
            local main_ok = spell.jobs[main_job] and spell.jobs[main_job] <= main_job_lvl;
            local sub_ok  = sub_job > 0 and spell.jobs[sub_job] and spell.jobs[sub_job] <= sub_job_lvl;
            if (not main_ok and not sub_ok) then
                return;
            end
        end

        -- Known/Unknown filter..
        if (ui.filter_known[1] == 1 and not spell.known) then return; end
        if (ui.filter_known[1] == 2 and spell.known) then return; end

        -- Search filter..
        if (search ~= '' and not spell.name:lower():find(search, 1, true)) then
            return;
        end

        result:append(spell);
    end);

    -- Sort filtered results by the level relevant to current context..
    result:sort(function (a, b)
        local a_lvl = ui.get_spell_level(a) or 999;
        local b_lvl = ui.get_spell_level(b) or 999;
        if (a_lvl ~= b_lvl) then return a_lvl < b_lvl; end
        return a.name < b.name;
    end);

    return result;
end

----------------------------------------------------------------------------------------------------
-- Rendering: Spell Detail Pane
----------------------------------------------------------------------------------------------------

function ui.render_spell_detail()
    if (ui.selected_spell[1] == -1) then
        imgui.TextColored({ 0.6, 0.6, 0.6, 1.0 }, '<< Select a spell for details.');
        return;
    end

    local res = AshitaCore:GetResourceManager():GetSpellById(ui.selected_spell[1]);
    if (res == nil) then
        imgui.TextColored({ 1.0, 0.0, 0.0, 1.0 }, 'Spell data not found.');
        return;
    end

    -- Find our spell data..
    local spell_data = nil;
    ui.all_spells:each(function (v)
        if (v.index == ui.selected_spell[1]) then
            spell_data = v;
        end
    end);

    -- BG-Wiki button..
    if (imgui.Button('Open on BG-Wiki')) then
        local url_name = res.Name[1]:gsub(' ', '_');
        ashita.misc.open_url(('https://www.bg-wiki.com/ffxi/%s'):fmt(url_name));
    end

    imgui.Separator();

    -- Name and description..
    imgui.PushTextWrapPos(imgui.GetFontSize() * 18.0);
    imgui.TextColored({ 1.0, 0.85, 0.4, 1.0 }, res.Name[1]);
    if (res.Description ~= nil and res.Description[1] ~= nil) then
        imgui.TextColored({ 0.75, 0.75, 0.75, 1.0 }, res.Description[1]);
    end
    imgui.PopTextWrapPos();
    imgui.Separator();

    -- Stat helper..
    local function stat(label, value)
        imgui.TextColored({ 1.0, 1.0, 1.0, 1.0 }, label);
        imgui.SameLine();
        imgui.TextColored({ 0.4, 0.8, 1.0, 1.0 }, tostring(value));
    end

    stat('School     :', skill_names[res.Skill] or tostring(res.Skill));
    stat('Element    :', element_names[res.Element] or tostring(res.Element));
    stat('MP Cost    :', res.ManaCost);
    stat('Cast Time  :', ('%.1fs'):fmt(res.CastTime / 4.0));
    stat('Recast     :', ('%.1fs'):fmt(res.RecastDelay / 4.0));

    -- Known status..
    imgui.TextColored({ 1.0, 1.0, 1.0, 1.0 }, 'Known      :');
    imgui.SameLine();
    if (spell_data and spell_data.known) then
        imgui.TextColored({ 0.2, 1.0, 0.2, 1.0 }, 'Yes');
    else
        imgui.TextColored({ 1.0, 0.3, 0.3, 1.0 }, 'No');
    end

    -- Jobs that can learn this spell..
    imgui.Separator();
    imgui.TextColored({ 1.0, 0.85, 0.4, 1.0 }, 'Learnable By:');
    if (spell_data) then
        local job_strs = T{};
        for jobId = 1, 22 do
            if (spell_data.jobs[jobId]) then
                job_strs:append(('%s %d'):fmt(job_names[jobId], spell_data.jobs[jobId]));
            end
        end
        imgui.PushTextWrapPos(imgui.GetFontSize() * 18.0);
        imgui.TextColored({ 0.7, 0.7, 1.0, 1.0 }, job_strs:concat(', '));
        imgui.PopTextWrapPos();
    end

    -- Acquisition info..
    imgui.Separator();
    imgui.TextColored({ 1.0, 0.85, 0.4, 1.0 }, 'How to Obtain:');

    local acq = ui.acquisition[res.Name[1]];
    if (acq) then
        imgui.PushTextWrapPos(imgui.GetFontSize() * 18.0);
        if (acq.vendor) then
            imgui.TextColored({ 0.2, 1.0, 0.6, 1.0 }, 'Buy from NPC:');
            imgui.TextColored({ 1.0, 1.0, 1.0, 1.0 }, '  ' .. acq.vendor);
        end
        if (acq.quest) then
            imgui.TextColored({ 0.2, 0.8, 1.0, 1.0 }, 'Quest:');
            imgui.TextColored({ 1.0, 1.0, 1.0, 1.0 }, '  ' .. acq.quest);
        end
        if (acq.drop) then
            imgui.TextColored({ 1.0, 0.6, 0.2, 1.0 }, 'Drops From:');
            imgui.TextColored({ 1.0, 1.0, 1.0, 1.0 }, '  ' .. acq.drop);
        end
        if (acq.other) then
            imgui.TextColored({ 0.8, 0.6, 1.0, 1.0 }, 'Other:');
            imgui.TextColored({ 1.0, 1.0, 1.0, 1.0 }, '  ' .. acq.other);
        end
        imgui.PopTextWrapPos();
    else
        imgui.TextColored({ 0.5, 0.5, 0.5, 1.0 }, 'Use BG-Wiki button for details.');
    end

    -- Report incorrect data..
    imgui.Separator();
    if (imgui.Button('Report Incorrect Data')) then
        local url_name = res.Name[1]:gsub(' ', '+');
        ashita.misc.open_url(('https://github.com/glitchv0/grimoire/issues/new?title=Incorrect+data:+%s'):fmt(url_name));
    end
    imgui.SameLine();
    imgui.TextColored({ 0.5, 0.5, 0.5, 1.0 }, 'or DM glitchv0 on Discord');
end

----------------------------------------------------------------------------------------------------
-- Rendering: Spell List Tab
----------------------------------------------------------------------------------------------------

function ui.render_spell_list(tab)
    local spells = ui.get_filtered_spells(tab);

    -- Count for this filtered view..
    local tab_known, tab_total = 0, 0;
    spells:each(function (v)
        tab_total = tab_total + 1;
        if (v.known) then tab_known = tab_known + 1; end
    end);

    -- Progress display..
    if (tab_total > 0) then
        local pct = (tab_known / tab_total) * 100;
        imgui.TextColored({ 0.4, 0.8, 1.0, 1.0 }, ('%d / %d known (%.0f%%)'):fmt(tab_known, tab_total, pct));
    else
        imgui.TextColored({ 0.5, 0.5, 0.5, 1.0 }, 'No spells match filters.');
    end

    -- Left pane: spell list..
    imgui.BeginGroup();
        imgui.BeginChild('spell_list', { 290, -1 }, true);
            spells:each(function (v)
                local lvl = ui.get_spell_level(v);
                local skill_short = skill_names[v.skill] or '??';

                if (v.known) then
                    imgui.PushStyleColor(ImGuiCol_Text, { 0.2, 1.0, 0.2, 1.0 });
                else
                    imgui.PushStyleColor(ImGuiCol_Text, { 1.0, 0.3, 0.3, 1.0 });
                end

                local label = ('[%2s] %s##%d'):fmt(tostring(lvl or '--'), v.name, v.index);
                if (imgui.Selectable(label, ui.selected_spell[1] == v.index)) then
                    ui.selected_spell[1] = v.index;
                end

                -- Tooltip with skill school on hover..
                if (imgui.IsItemHovered()) then
                    imgui.BeginTooltip();
                    imgui.Text(('%s - %s'):fmt(v.name, skill_short));
                    imgui.EndTooltip();
                end

                imgui.PopStyleColor();
            end);
        imgui.EndChild();
    imgui.EndGroup();

    imgui.SameLine();

    -- Right pane: spell detail..
    imgui.BeginGroup();
        imgui.BeginChild('spell_detail', { 0, -1 }, true);
            ui.render_spell_detail();
        imgui.EndChild();
    imgui.EndGroup();
end

----------------------------------------------------------------------------------------------------
-- Rendering: Main Window
----------------------------------------------------------------------------------------------------

function ui.render()
    if (not ui.is_open[1]) then
        return;
    end

    imgui.SetNextWindowSize({ 750, 520 });
    imgui.SetNextWindowSizeConstraints({ 750, 520 }, { FLT_MAX, FLT_MAX });

    if (imgui.Begin('Grimoire - Spell Compendium', ui.is_open, ImGuiWindowFlags_NoResize)) then
        -- Top control bar: build job combo dynamically to show current job name..
        local player_combo = AshitaCore:GetMemoryManager():GetPlayer();
        local cur_job_name = '???';
        if (player_combo ~= nil) then
            cur_job_name = job_names[player_combo:GetMainJob()] or '???';
        end
        local combo_items = T{ cur_job_name, 'All' };
        for i = 1, #magic_jobs do
            combo_items:append(job_names[magic_jobs[i]] or '???');
        end
        local job_combo_str = combo_items:concat('\0') .. '\0';

        imgui.PushItemWidth(120);
        imgui.Combo('Job##job_filter', ui.selected_job, job_combo_str, #magic_jobs + 2);
        imgui.PopItemWidth();

        imgui.SameLine();
        imgui.PushItemWidth(90);
        imgui.Combo('Show##known_filter', ui.filter_known, 'All\0Known\0Unknown\0', 3);
        imgui.PopItemWidth();

        imgui.SameLine();
        imgui.PushItemWidth(150);
        imgui.InputText('Search##spell_search', ui.search_buf, 256);
        imgui.PopItemWidth();

        imgui.SameLine();
        if (imgui.Button('Refresh')) then
            ui.refresh_spells();
        end

        imgui.SameLine();
        imgui.TextColored({ 0.4, 0.8, 1.0, 1.0 },
            ('Overall: %d/%d'):fmt(ui.counts.known, ui.counts.total));

        imgui.Separator();

        -- Tab bar..
        if (imgui.BeginTabBar('##grimoire_tabs', ImGuiTabBarFlags_NoCloseWithMiddleMouseButton)) then
            for _, tab in ipairs(tabs) do
                if (imgui.BeginTabItem(tab.name, nil)) then
                    ui.render_spell_list(tab);
                    imgui.EndTabItem();
                end
            end
            imgui.EndTabBar();
        end
    end
    imgui.End();
end

----------------------------------------------------------------------------------------------------
-- Packet Handling
----------------------------------------------------------------------------------------------------

function ui.packet_in(e)
    -- Packet: Spells Update (0x00AA)..
    if (e.id == 0x00AA) then
        ashita.tasks.oncef(1, function ()
            ui.refresh_spells();
        end);
        return;
    end

    -- Packet: Zone Enter (0x000A)..
    if (e.id == 0x000A) then
        ashita.tasks.oncef(2, function ()
            ui.refresh_spells();
        end);
        return;
    end
end

return ui;
