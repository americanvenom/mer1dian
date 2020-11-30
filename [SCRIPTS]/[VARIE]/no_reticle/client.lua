Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local Ped = PlayerId()
        local PlayerPed = PlayerPedId()
        --Citizen.InvokeNative(0x4CC5F2FC1332577F, 1058184710) --aim
        --Citizen.InvokeNative(0x4CC5F2FC1332577F, -66088566) --mp money
        --Citizen.InvokeNative(0x4CC5F2FC1332577F, 474191950) --minimap
        -- DisplayRadar()
        if IsPlayerFreeAiming(Ped) and IsPedWeaponReadyToShoot(PlayerPed) then
            --Citizen.InvokeNative(0x90DA5BA5C2635416)
            --firstperson = Citizen.InvokeNative(0x90DA5BA5C2635416)                
            if firstperson ~= true then
                weapon, weponhash = GetCurrentPedWeapon(PlayerPed, true)
                isBow = GetHashKey("WEAPON_BOW")
                if weponhash ~= isBow then                
                    Citizen.InvokeNative(0x4CC5F2FC1332577F, 0xBB47198C)
                 
                end
            end
        else
            Citizen.InvokeNative(0x1CFB749AD4317BDE) -- camera mode
            --Citizen.InvokeNative(0x90DA5BA5C2635416) -- first person
            --Citizen.InvokeNative(0x8370D34BD2E60B73) -- second furthest 3rd person
            --Citizen.InvokeNative(0x1CFB749AD4317BDE) -- furthest 3rd person
            Citizen.InvokeNative(0x4CC5F2FC1332577F, 0xBB47198C) --reticle
        end
    end
end)