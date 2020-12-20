Inventory = exports.vorp_inventory:vorp_inventoryApi()

local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

data = {}
TriggerEvent("vorp_inventory:getData",function(call)
    data = call
end)

RegisterServerEvent("mlpayout")
AddEventHandler("mlpayout", function()
    local _source = source
    local User = VorpCore.getUser(_source) 
    local Character = User.getUsedCharacter         
    
    math.randomseed(os.time())
    local lingotti = math.floor(math.random()*10)    
    local bigiotteria = math.floor(math.random()*50)

    if Inventory.canCarryItems(_source, lingotti+bigiotteria) then 
        Inventory.addItem(_source, "lingottom", lingotti)
        Inventory.addItem(_source, "obbligazioni", bigiotteria)
    end
		
    --TriggerClientEvent("vorp:Tip",source, 'Hai preso 10 lingotti d\'oro!', 5000)

end)


RegisterServerEvent('lockpick')
AddEventHandler('lockpick', function()
    local _source = source
    local User = VorpCore.getUser(_source) 
    local Character = User.getUsedCharacter 
    local count = Inventory.getItemCount(_source, "lockpick")

    if count >= 1 then
        
        TriggerClientEvent("rapine:sendPlayersToserver", _source)
		--TriggerClientEvent("vorp:NotifyLeft", source, "ATTENZIONE","RAPINA IN CORSO","generic_textures","tick", 5000)
		
    else
        TriggerClientEvent("vorp:Tip", _source, 'Cómo crees que robas un banco sin herramientas?', 5000)
    end     
   
end)
 
RegisterNetEvent("policenotify")
AddEventHandler("policenotify", function(players, coords)
    for each, player in ipairs(players) do
        local User = VorpCore.getUser(player) 
        local Character = User.getUsedCharacter             
        if Character ~= nil then
			if Character.job == 'Sceriffo' then
				TriggerClientEvent("policenotification", player, coords)
			end
        end
        
    end
end)

RegisterServerEvent("rapine:countsceriffi")
AddEventHandler("rapine:countsceriffi", function(players)
    local _source = source
    local Sceriffi = 0
    for k,v in pairs(players) do
        local User = VorpCore.getUser(v)
        local Character = User.getUsedCharacter
        if Character.job == "Sceriffo" then 
            Sceriffi = Sceriffi + 1
            
        end

        
    end

    if Sceriffi >= 0 then --3
        Inventory.subItem(_source,"lockpick", 1)
        TriggerClientEvent('StartRobbing', _source)
    else
        TriggerClientEvent("vorp:Tip", _source, 'No hay suficientes agentes de la ley', 5000)
    end

end)