ESX = nil
ESX = exports["es_extended"]:getSharedObject()
local valmistus = false
local kasaus = {}

CreateThread(function()
    while true do
        TriggerServerEvent('clt_crafting:serverista')
        local sleep = 1000
        if not valmistus then
            local pos = GetEntityCoords(PlayerPedId(), true)
            for i, kasausPos in ipairs(kasaus) do
                local distance = #(pos - vector3(kasausPos.pos.x, kasausPos.pos.y, kasausPos.pos.z))
                if distance < 1 then
                    sleep = 5
                    ESX.ShowHelpNotification(_U('valmistaa_aseita'))
                    if IsControlJustPressed(0, 38) then
                        Avaavalmistusmenu()
                    end
                    if IsPedWalking(PlayerPedId()) then
                        ESX.UI.Menu.CloseAll()
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

RegisterNetEvent('clt_crafting:clienttiin')
AddEventHandler('clt_crafting:clienttiin', function(infot)
    kasaus = infot
end)


function Avaavalmistusmenu()
	local elements = {}

	elements = {
		{ label = _U('WEAPON_ASSAULTRIFLE'), value = 'WEAPON_ASSAULTRIFLE' },
		{ label = _U('WEAPON_BULLPUPSHOTGUN'), value = 'WEAPON_BULLPUPSHOTGUN' },
		{ label = _U('WEAPON_COMBATPDW'), value = 'WEAPON_COMBATPDW' },
		{ label = _U('WEAPON_GUSENBERG'), value = 'WEAPON_GUSENBERG' },
		{ label = _U('WEAPON_SAWNOFFSHOTGUN'), value = 'WEAPON_SAWNOFFSHOTGUN' },
		{ label = _U('WEAPON_SMG'), value = 'WEAPON_SMG' },
		{ label = _U('WEAPON_REVOLVER'), value = 'WEAPON_REVOLVER' },
		{ label = _U('WEAPON_PISTOL50'), value = 'WEAPON_PISTOL50' },
		{ label = _U('WEAPON_PISTOL_MK2'), value = 'WEAPON_PISTOL_MK2' },
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'menu_crafting', {
		title = 'Valitse ase',
		align = 'center',
		elements = elements
	}, function(data, menu)
		TriggerServerEvent('clt_crafting:mikaase', data.current.value)
		menu.close()
	end)
end


RegisterNetEvent('clt_crafting:valmistaase')
AddEventHandler('clt_crafting:valmistaase', function()
	valmistus = true
	ESX.ShowNotification(_U('valmistetaan'))
	SetEntityHeading(PlayerPedId(), 350.00)
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_WELDING", 0, true)
	Wait(2500)
	if not IsPedUsingAnyScenario(PlayerPedId()) then
		SetEntityHeading(PlayerPedId(), 350.00)
		TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_WELDING", 0, true)
	end	
	Wait(28500)
	ClearPedTasks(PlayerPedId())
	valmistus = false
end)

RegisterNetEvent('clt_crafting:onkoosia')
AddEventHandler('clt_crafting:onkoosia', function(x)
	items["aseenosia"] = x
end)