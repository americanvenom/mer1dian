VorpInv = exports.vorp_inventory:vorp_inventoryApi()
VORP = exports.vorp_core:vorpAPI()

local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterServerEvent("vane_banchiere:checkjob")
AddEventHandler("vane_banchiere:checkjob", function()
    local _source = source
	local User = VorpCore.getUser(_source) 
	local Character = User.getUsedCharacter
    if Character.job == 'Banchiere' then
        TriggerClientEvent('vane_banchiere:open', _source)
	else
		TriggerClientEvent("vorp:Tip", _source, 'No tienes las llaves', 4000)
    end
    
end)

-------------- VENDI ----------------
RegisterServerEvent('vane_vendi:pepita')
AddEventHandler('vane_vendi:pepita', function(n)
	local _source = source
	local count = VorpInv.getItemCount(source, "goldnugget")
		if count >= n then 
			VorpInv.subItem(_source, 'goldnugget',n)
			TriggerEvent("vorp:addMoney", _source, 0, n*5);
			TriggerClientEvent("vorp:TipRight", source, "Has vendido " .. tostring(n) .. " pepita(s)!", 4000)
		else
			TriggerClientEvent("vorp:TipRight", source, "No tienes suficientes pepitas", 4000)
		end
end)