Citizen.CreateThread(function()
    WarMenu.CreateMenu('perso', 'Banquero')
	WarMenu.CreateSubMenu('ca', 'perso', 'Cambio')
	WarMenu.CreateSubMenu('ve', 'perso', 'Vender')
	WarMenu.CreateSubMenu('so', 'perso', 'Administrar sociedad')
	WarMenu.CreateSubMenu('as', 'so', 'Agregar sociedad')
	WarMenu.CreateSubMenu('rs', 'so', 'Eliminar sociedad')
	WarMenu.CreateSubMenu('ms', 'so', 'Mostrar sociedad')
	 while true do
        local ped = GetPlayerPed()
        local coords = GetEntityCoords(PlayerPedId())
		--print(Vdist(coords.x, coords.y, coords.z, 2644.1, -1300.0, 167.5))

		if WarMenu.IsMenuOpened('ve') then
			if WarMenu.Button('Pepita') then

				TriggerEvent("vorpinputs:getInput", "Depositar", "Cantidad", function(cb)
				
					TriggerServerEvent('vane_vendi:pepita', tonumber(cb))
				end)

			end	
		
			if WarMenu.Button('Salir') then
				WarMenu.CloseMenu()
			end	
		
			WarMenu.Display()
		elseif (Vdist(coords.x, coords.y, coords.z, 2644.1, -1300.0, 52.3) < 1.0) then 
            TriggerEvent("enter:banca")
            if whenKeyJustPressed(key) then
				TriggerServerEvent('vane_banchiere:checkjob')
            end
		end
		Citizen.Wait(0)
	end	
end)

RegisterNetEvent("enter:banca")
  AddEventHandler("enter:banca", function()
    SetTextScale(0.5, 0.5)
    --SetTextFontForCurrentCommand(1)
    local msg = '[G] Para vender las pepitas'
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())

    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
  end)

  RegisterNetEvent('vane_banchiere:open')
AddEventHandler('vane_banchiere:open', function(cb)
	WarMenu.OpenMenu('ve')
end)
	
function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, 0x760A9C6F) then
        return true
    else
        return false
    end
end