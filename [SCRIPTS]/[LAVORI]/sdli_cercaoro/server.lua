--[[##########################CONFIG#########################]]
Config = {}

Config.PanningLocations = {
    [1] =  {["name"] = "Dakota River", ["x"] = -751.3,["y"] = 594.5,["z"] = 56.3,["radius"] = 5,["waterhash"] = 370072007, ["watertype"] = "river", ["loot"] = 1},
    [2] =  {["name"] = "HawkEye Creek", ["x"] = -1712.1,["y"] = -485.1,["z"] = 37.3,["radius"] = 5,["waterhash"] = -1276586360, ["watertype"] = "river", ["loot"] = 1},
    [3] =  {["name"] = "Upper Montana River", ["x"] = -1546.7,["y"] = -1063.1,["z"] = 65.3,["radius"] = 5,["waterhash"] = -1781130443, ["watertype"] = "river", ["loot"] = 1},
    [4] =  {["name"] = "Dakota River", ["x"] = -1203.7,["y"] = 142.9,["z"] = 41.3,["radius"] = 5,["waterhash"] = 370072007, ["watertype"] = "river", ["loot"] = 1},
    [5] =  {["name"] = "Upper Montana River", ["x"] = -2252.3,["y"] = -470.9,["z"] = 137.8,["radius"] = 5,["waterhash"] = -1781130443, ["watertype"] = "river", ["loot"] = 2},
    [6] =  {["name"] = "Cattail Pond", ["x"] = -1026.0,["y"] = 782.2,["z"] = 116.5,["radius"] = 5,["waterhash"] = -804804953, ["watertype"] = "river", ["loot"] = 2},
    [7] =  {["name"] = "Upper Montana River", ["x"] = -852.1,["y"] = -900.2,["z"] = 41.4,["radius"] = 5,["waterhash"] = -1781130443, ["watertype"] = "river", ["loot"] = 3},
    [8] =  {["name"] = "Owanjila", ["x"] = -2869.1,["y"] = 104.1,["z"] = 183.1,["radius"] = 5,["waterhash"] = -1300497193, ["watertype"] = "river", ["loot"] = 4},
    [9] =  {["name"] = "Roanoke Valley", ["x"] = 2287.0,["y"] = 1624.9,["z"] = 84.8,["radius"] = 5,["waterhash"] = -1229593481, ["watertype"] = "river", ["loot"] = 5},
    [10] =  {["name"] = "Spider Gorge", ["x"] = -1544.4,["y"] = 2240.1,["z"] = 287.2,["radius"] = 5,["waterhash"] = -218679770, ["watertype"] = "river", ["loot"] = 7},
    --[2] =  {["name"] = "San Luis River", ["x"] = -1712.1,["y"] = ,["z"] = ,["radius"] = ,["waterhash"] = -1504425495, ["watertype"] = "river", ["loot"] = 2},
    --[5] =  {["name"] = "Upper Montana River",["x"] =,["y"]=,["z"]=, ["radius"] =, ["waterhash"] = -1781130443, ["watertype"] = "river", ["loot"] = 2},
    --[6] =  {["name"] = "Owanjila", ["x"] =,["y"]=,["z"]=, ["radius"] =, ["waterhash"] = -1300497193, ["watertype"] = "river", ["loot"] = 2},
    --[7] =  {["name"] = "HawkEye Creek",  ["x"] =,["y"]=,["z"]=, ["radius"] =, ["waterhash"] = -1276586360, ["watertype"] = "river", ["loot"] = 2},
    --[8] =  {["name"] = "Little Creek River",["x"] =,["y"]=,["z"]=, ["radius"] =, ["waterhash"] = -1410384421, ["watertype"] = "river", ["loot"] = 2},
    --[9] =  {["name"] = "Dakota River", ["x"] =,["y"]=,["z"]=, ["radius"] =, ["waterhash"] = 370072007, ["watertype"] = "river", ["loot"] = 2},
    --[10] =  {["name"] = "Beartooth Beck", ["x"] =,["y"]=,["z"]=, ["radius"] =, ["waterhash"] = 650214731, ["watertype"] = "river", ["loot"] = 2},
    --[13] =  {["name"] = "Deadboot Creek", ["x"] =,["y"]=,["z"]=, ["radius"] =, ["waterhash"] = 1245451421, ["watertype"] = "river", ["loot"] = 2},
    --[14] =  {["name"] = "Spider Gorge", ["x"] =,["y"]=,["z"]=, ["radius"] =, ["waterhash"] = -218679770, ["watertype"] = "river", ["loot"] = 2},
    --[17] =  {["name"] = "Roanoke Valley", ["x"] =,["y"]=,["z"]=, ["radius"] =, ["waterhash"] = -1229593481, ["watertype"] = "river", ["loot"] = 2},
    --[22] =  {["name"] = "Dakota River", ["x"] =,["y"]=,["z"]=, ["radius"] =, ["waterhash"] = 370072007, ["watertype"] = "river", ["loot"] = 2},
}


Config.AnimDict = "script_re@gold_panner@gold_success"
Config.PanObject = "p_miningpan01x"
Config.Bone = "PH_L_Hand"

Config.StartPan = "Prova a cercare"
Config.PanNotFound = "Hai bisogno di un setaccio per cercare dell'oro!"
Config.GoldNotFound = "Non hai trovato pepite d'oro!"
Config.Found = function(gold) return "Hai trovato "..gold.." pepite d'oro!" end
Config.DiamFound = function(gold) return "Hai trovato "..gold.." diamante!" end
Config.NuggetsNotFound = "Non hai abbastanza pepite da processare!"
Config.TooFar = "Ti sei allontanato troppo!"

Config.PanControl = 0xE8342FF2 --ALT

-- DA 0 A 10000
Config.Probability = 3000 --% of obtaining gold

Config.ProcessText = "Processo oro"
Config.ProcessLocations = { 
	{ name = 'Processo Oro', sprite = 2107754879,  x = 1414.9, y = 279.2, z = 89.5 },
}

Config.NuggetsAmount = 60
--[[##########################CONFIG#########################]]


local panninglocations = Config.PanningLocations

VorpInv = exports.vorp_inventory:vorp_inventoryApi()


TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterServerEvent("cercaoro:requestconfig")
AddEventHandler("cercaoro:requestconfig", function() 
	local _source = source
	TriggerClientEvent("cercaoro:saveconfig", _source, Config)
end)

RegisterServerEvent('vorp_goldpanning:successGiveGold')
AddEventHandler('vorp_goldpanning:successGiveGold', function(currentZone)
	local _source = source
	math.randomseed(os.time())
	if currentZone ~= nil then
		math.randomseed(os.time())
		local tmpProb = math.random()*10000
		if tmpProb < Config.Probability then

			print(_source)
			local User = VorpCore.getUser(_source)
			local Character = User.getUsedCharacter

			local loot = panninglocations[currentZone]["loot"]
			local gold = tonumber(math.abs(math.random(1, loot)))
			VorpInv.addItem(source, "goldnugget", gold)
		--	TriggerClientEvent("redemrp_notification:start", source, Config.Found(gold), 3, "success")
			TriggerClientEvent("vorp:NotifyLeft", _source, "~o~Setaccio", Config.Found(gold), "generic_textures", "stamp_gold", 3000)
			
			
		else
			--TriggerClientEvent("redemrp_notification:start", source, Config.GoldNotFound, 3, "warning")
		--..--	TriggerClientEvent("vorp:NotifyLeft", _source, Config.GoldNotFound, "cross", 3000)
			TriggerClientEvent("vorp:NotifyLeft", _source, "~e~Setaccio", Config.GoldNotFound, "menu_textures", "cross", 3000)
--			TriggerClientEvent("vorp:TipRight", source, Config.GoldNotFound, 3000)
		end
	end
end)

RegisterServerEvent('vorp_goldpanning:checkPan')
AddEventHandler('vorp_goldpanning:checkPan', function()
	local User = VorpCore.getUser(source)
	local Character = User.getUsedCharacter	
	local panAmount = VorpInv.getItemCount(source, "goldpan")	
	if panAmount > 0 then
		TriggerClientEvent("vorp_goldpanning:panPresent", source)
	else
		--TriggerClientEvent("redemrp_notification:start", source, Config.PanNotFound, 3, "warning")
		--TriggerClientEvent("vorp:NotifyLeft", _source, "~e~", Config.PanNotFound, "cross", 3000)
		--TriggerClientEvent(source, "vorp:Tip", Config.PanNotFound, 3000)
	--..--	TriggerClientEvent("vorp:TipRight", source, Config.PanNotFound, 3000)
        TriggerClientEvent("vorp:NotifyLeft", _source, "~e~Setaccio", Config.PanNotFound, "menu_textures", "cross", 3000)
	end
			
	
end)

Citizen.CreateThread(function() 
	Wait(2000)
	VorpInv.RegisterUsableItem("goldpan", function(data) 
		local _source = data.source
		TriggerClientEvent('sdli_cercaoro:checkZone', _source)
	end)
end)
