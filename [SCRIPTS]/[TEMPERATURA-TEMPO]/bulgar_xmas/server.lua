local aktualnapogoda = "SNOW"
local minuty = 1 --(25) Time To Change Weather 25 Min

function changeweather()
	local myTable = {"SUNNY", "SNOWLIGHT", "SNOW", "GROUNDBLIZZARD", "WHITEOUT", "SUNNY", "SUNNY", "SUNNY", "SNOW", "SUNNY", "SNOW"}
	local pogoda = myTable[math.random(#myTable)]
	
	TriggerClientEvent('bulgarxmas:sync', -1, pogoda)
	aktualnapogoda = pogoda
	
	SetTimeout(minuty * 60000, changeweather)
end
changeweather()

RegisterServerEvent('bulgarxmas:syncsrv')
AddEventHandler('bulgarxmas:syncsrv', function()
	local _source = source
	TriggerClientEvent('bulgarxmas:sync', _source, aktualnapogoda)
end)