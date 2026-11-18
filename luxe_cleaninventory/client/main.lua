-- Luxe Clean Inventory (client): gives ox_inventory's page its look, the rarity list and the status column.
-- Uses the player's Luxe Clean HUD settings when that HUD is running, so both always match.

local function started(res) return GetResourceState(res) == 'started' end

RegisterNUICallback('theme', function(_, cb)
    local look = { accent = Config.Accent, background = Config.Background, rarity = Config.Rarity }
    if started('luxe_cleanhud') then
        local ok, s = pcall(function() return exports.luxe_cleanhud:getSettings() end)
        if ok and type(s) == 'table' then
            look.accent = s.accent or look.accent
            look.background = s.background or look.background
        end
    end
    cb(look)
end)

---------------------------------------------------------------- status column (Qbox / QBCore)
local QB
local function needs()
    local s = LocalPlayer.state
    if started('qbx_core') then
        return s.hunger or 100, s.thirst or 100
    end
    if not QB and started('qb-core') then QB = exports['qb-core']:GetCoreObject() end
    if QB then
        local md = (QB.Functions.GetPlayerData() or {}).metadata or {}
        return md.hunger or 100, md.thirst or 100
    end
    return 100, 100
end

RegisterNUICallback('status', function(_, cb)
    if not Config.ShowStatus then return cb(false) end
    local ped = PlayerPedId()
    local maxHp = math.max(1, GetEntityMaxHealth(ped) - 100)
    local hunger, thirst = needs()
    cb({
        health = math.max(0, math.min(100, (GetEntityHealth(ped) - 100) / maxHp * 100)),
        armour = GetPedArmour(ped),
        hunger = hunger,
        thirst = thirst,
    })
end)
