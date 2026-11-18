Config = {}

-- Look. If Luxe Clean HUD is running, each player's /hud accent and background are used instead,
-- so the inventory always matches their HUD.
Config.Accent     = '#e8e6e1'   -- slot numbers, weight bar, button hover (any hex colour)
Config.Background = 'glass'     -- 'glass' | 'solid' | 'none'

-- Status column next to the inventory (health, armour, hunger, thirst)
Config.ShowStatus = true

-- Rarity colours: item name = 'uncommon' | 'rare' | 'epic' | 'legendary'.
-- Items not listed are normal. An item's metadata.rarity overrides this.
Config.Rarity = {
    lockpick      = 'uncommon',
    radio         = 'uncommon',
    WEAPON_PISTOL = 'rare',
    armour        = 'rare',
    black_money   = 'epic',
    coke_pack     = 'epic',
    goldbar       = 'legendary',
}
