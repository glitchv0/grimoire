--[[
* Grimoire - Spell Compendium for Ashita v4
* Tracks known/unknown spells with acquisition info and BG-Wiki links.
*
* Commands:
*   /grimoire or /grim  - Toggle the spell compendium window.
*   /grim refresh       - Force refresh spell data.
--]]

addon.name      = 'grimoire';
addon.author    = 'Nybs';
addon.version   = '1.1.1';
addon.desc      = 'Spell compendium - track known/unknown spells with acquisition info.';
addon.link      = 'https://github.com/glitchv0/grimoire';

require('common');
local chat = require('chat');
local ui = require('ui');

--[[
* event: load
--]]
ashita.events.register('load', 'load_cb', function ()
    ui.load();
    print(chat.header(addon.name):append(chat.message('Loaded! Use ')):append(chat.color1(6, '/grimoire')):append(chat.message(' or ')):append(chat.color1(6, '/grim')):append(chat.message(' to toggle.')));
end);

--[[
* event: unload
--]]
ashita.events.register('unload', 'unload_cb', function ()
    print(chat.header(addon.name):append(chat.message('Unloaded.')));
end);

--[[
* event: command
--]]
ashita.events.register('command', 'command_cb', function (e)
    local args = e.command:args();
    if (#args == 0 or not args[1]:any('/grimoire', '/grim')) then
        return;
    end

    e.blocked = true;

    if (#args >= 2 and args[2]:any('refresh', 'reload')) then
        ui.refresh_spells();
        print(chat.header(addon.name):append(chat.success('Spell data refreshed.')));
        return;
    end

    ui.is_open[1] = not ui.is_open[1];
end);

--[[
* event: packet_in
--]]
ashita.events.register('packet_in', 'packet_in_cb', ui.packet_in);

--[[
* event: d3d_present
--]]
ashita.events.register('d3d_present', 'present_cb', ui.render);
