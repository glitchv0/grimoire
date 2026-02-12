# Grimoire

A spell compendium addon for [Ashita v4](https://www.ashitaxi.com/) that tracks known and unknown spells for your character in Final Fantasy XI, with acquisition info and BG-Wiki integration.

![Ashita v4](https://img.shields.io/badge/Ashita-v4-blue)

## Features

- **Spell tracking** - See all learnable spells with known/unknown status at a glance
- **Job filtering** - Filter spells by your current job/sub or any magic-using job
- **Categorized tabs** - Browse by category: All, Missing, White, Black, Songs, Ninjutsu, Summoning, Blue Magic
- **Search** - Quickly find spells by name
- **Spell details** - View MP cost, cast time, recast, element, school, and which jobs can learn each spell
- **Acquisition info** - See where to obtain spells (NPC vendors, quests, drops, AH)
- **BG-Wiki links** - Open any spell's BG-Wiki page directly from the addon
- **Auto-refresh** - Spell data updates automatically on zone change and spell list updates

## Installation

1. Download the latest release from the [Releases](https://github.com/glitchv0/grimoire/releases) page.
2. Extract the `grimoire` folder into your Ashita `addons` directory:
   ```
   Ashita/addons/grimoire/
   ```
3. In-game, load the addon:
   ```
   /addon load grimoire
   ```

## Usage

| Command | Description |
|---|---|
| `/grimoire` or `/grim` | Toggle the spell compendium window |
| `/grim refresh` | Force refresh spell data |

### Window Controls

- **Job dropdown** - Filter by a specific job or "All" for your current main/sub job
- **Show dropdown** - Filter by All / Known / Unknown spells
- **Search box** - Type to filter spells by name
- **Refresh button** - Manually refresh spell data

Click any spell in the list to view its details in the right pane, including how to obtain it and a button to open its BG-Wiki page.

## Project Structure

```
grimoire/
├── grimoire.lua          # Addon entry point and event handlers
├── ui.lua                # ImGui rendering and spell data management
└── data/
    └── acquisition.lua   # Spell acquisition source data (vendors, quests, drops)
```

## License

This project is provided as-is for use with Ashita v4 and Final Fantasy XI.
