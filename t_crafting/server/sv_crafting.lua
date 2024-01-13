ESX = nil
ESX = exports["es_extended"]:getSharedObject()

local kasaus = {
    [1] = {
        pos = { x = 0.0, y = 0.0, z = 0.0 }, --Pisla
    },
    --[[2] = {
        pos = { x = 0.0, y = 0.0, z = 0.0 },
    },]]
}

RegisterNetEvent('clt_crafting:serverista')
AddEventHandler('clt_crafting:serverista', function()
    local _source = source
    TriggerClientEvent('clt_crafting:clienttiin', _source, kasaus)
end)

RegisterServerEvent('clt_crafting:mikaase')
AddEventHandler('clt_crafting:mikaase', function(WEAPON)
    local xPlayer = ESX.GetPlayerFromId(source)
	
    local blueprint_amount = xPlayer.getInventoryItem(Config.CraftingTableRecipes[WEAPON].ingredients.blueprint).count
    local parts_amount = xPlayer.getInventoryItem('aseenosia').count

    if WEAPON then
        if blueprint_amount >= 1 then
            if parts_amount >= Config.CraftingTableRecipes[WEAPON].ingredients.parts then
                xPlayer.removeInventoryItem(Config.CraftingTableRecipes[WEAPON].ingredients.blueprint, 1)
                xPlayer.removeInventoryItem('aseenosia', Config.CraftingTableRecipes[WEAPON].ingredients.parts)
                
                TriggerClientEvent('clt_crafting:valmistaase', source)
                
                SetTimeout(30000, function()
                    xPlayer.addWeapon(WEAPON, Config.CraftingTableRecipes[WEAPON].ammo)
                end)
            else
                TriggerClientEvent('esx:showNotification', source, _U('ei_tarpeeksi_aseenosia'), 'error')
            end
        else
            TriggerClientEvent('esx:showNotification', source, _U('ei_blueprintteja'), 'error')
        end
    end
end)
