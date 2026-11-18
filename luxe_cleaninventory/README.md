# Luxe Clean Inventory

**by Luxe Studios** · free · a clean, neutral interface for **ox_inventory**, made to match **Luxe Clean HUD**

## What it adds
- **Header** with a title and a **segmented weight bar** (turns amber, then red, as you fill up)
- **Status column** next to your inventory: health, armour, hunger and thirst
- **Search bar** under your inventory: everything that doesn't match fades out
- **Rarity colours**: uncommon (green), rare (blue), epic (purple) and legendary (gold), set per item in `config.lua` or with `metadata.rarity`
- **Clean slots**: count + weight badge, slot numbers 1-5, item names in normal case, soft glass panels
- Matching amount box, Use / Give / Close buttons, tooltips, right-click menu, hotbar and item pop-ups
- **Matches each player's `/hud` look** when Luxe Clean HUD runs (accent colour, Glass / Solid / None)

Only the interface changes. Everything ox_inventory does (moving items, shops, stashes, crafting) works exactly the same.

## Installation
1. Put `luxe_cleaninventory` in your `resources` and add `ensure luxe_cleaninventory` to `server.cfg`.
2. Replace `ox_inventory/web/build` with the Luxe Clean build (the `build` folder that comes with this release).
3. In `ox_inventory/fxmanifest.lua`, under `files { ... }`, add this line after `'web/build/assets/*.css',`:
```lua
    'web/build/assets/*.ttf', -- Luxe Clean Inventory font
```
4. Restart the server.

The build is made for **ox_inventory v2.48.1**. Updating ox_inventory replaces `web/build` and `fxmanifest.lua`, so repeat steps 2 and 3 afterwards (with a build for that version).

Without `luxe_cleaninventory` running, the interface still works: it just uses the default colours and doesn't show the status column or rarity.

## Configuration
`config.lua`:
- `Config.Accent`, `Config.Background`: look when Luxe Clean HUD isn't running
- `Config.ShowStatus`: show the health / armour / hunger / thirst column
- `Config.Rarity`: item name = `'uncommon'`, `'rare'`, `'epic'` or `'legendary'`

An item can also carry its own rarity in its metadata, e.g. `exports.ox_inventory:AddItem(source, 'goldbar', 1, { rarity = 'legendary' })`.

## Source & license
The interface is a modified version of [ox_inventory](https://github.com/overextended/ox_inventory)'s web UI (GPL-3.0). The full source changes are in `source/ox_inventory-v2.48.1-clean-ui.patch`: apply it to ox_inventory v2.48.1's `web` folder and run `npm install && npm run build` to rebuild. That interface stays under GPL-3.0.

The `luxe_cleaninventory` resource itself is free to use and edit; see `LICENSE.md`.
