ESX          = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
    while true do
		local Ped = PlayerPedId()
		local Pos = GetEntityCoords(Ped)
		local mesafe = GetDistanceBetweenCoords(Pos, -620.54, -228.03, 38.06)
		local mesafeicinde = false
		local zaman = 7500
		
		if mesafe < 20 then
            mesafeicinde = true
        end

       if mesafeicinde then
			if GetDistanceBetweenCoords(GetEntityCoords(Ped), -620.54, -228.43, 38.06, true) < 10 then
				zaman = 6
				if GetDistanceBetweenCoords(Pos, -620.54, -228.03, 38.06, true) < 4.0 then
					DrawMarker(27, -620.54, -228.03, 38.06-0.9, 0, 0, 0, 0, 0, 0, 1.301, 1.3001, 0.5001, 255, 156, 65, 200, 0, 0, 0, 0)					
				end 
				
				if GetDistanceBetweenCoords(GetEntityCoords(Ped), -620.54, -228.43, 38.06, true) < 1.5 then
					if IsControlJustReleased(1, 51) then
						brkblnt_menu()
					end
				end
			end
		end
			
			

        Citizen.Wait(zaman)
		
	end
end)

function brkblnt_menu()
	local playerPed = PlayerPedId()
    if not isVisible then
        local dict = "amb@world_human_seat_wall_tablet@female@base"
        RequestAnimDict(dict)
        if tabletObject == nil then
            tabletObject = CreateObject(GetHashKey('prop_cs_tablet'), GetEntityCoords(playerPed), 1, 1, 1)
            AttachEntityToEntity(tabletObject, playerPed, GetPedBoneIndex(playerPed, 28422), 0.0, 0.0, 0.03, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
        end
        while not HasAnimDictLoaded(dict) do Citizen.Wait(100) end
        if not IsEntityPlayingAnim(playerPed, dict, 'base', 3) then
            TaskPlayAnim(playerPed, dict, "base", 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
        end
	end
	
	ESX.TriggerServerCallback('brkblnt_borsa:fiyatsorgulama', function(gramaltinfiyati)
	ESX.TriggerServerCallback('brkblnt_borsa:fiyatsorgulama', function(ceyrekaltinfiyati)
	ESX.TriggerServerCallback('brkblnt_borsa:fiyatsorgulama', function(yarimaltinfiyati)
	ESX.TriggerServerCallback('brkblnt_borsa:fiyatsorgulama', function(tamaltinfiyati)
	ESX.TriggerServerCallback('brkblnt_borsa:fiyatsorgulama', function(tlfiyati)
	ESX.TriggerServerCallback('brkblnt_borsa:fiyatsorgulama', function(eurofiyati)
	ESX.TriggerServerCallback('brkblnt_borsa:fiyatsorgulama', function(sterlinfiyati)
	ESX.TriggerServerCallback('brkblnt_borsa:fiyatsorgulama', function(tektasyuzukfiyati)
	exports['progressBars']:startUI(2050, "Borsa Tabletine Göz Atıyorsunuz.")
	Citizen.Wait(2000)
	
	SetEntityHeading(playerPed, 125.0)
	FreezeEntityPosition(playerPed, true)
								
	
	
    local elements = {
        {label = 'Gram Altın Fiyat = <span style="color:green;">'..gramaltinfiyati..'$</span>',      value = 'gramfiyat'},
        {label = 'Çeyrek Altın Sat Fiyat = <span style="color:green;">'..ceyrekaltinfiyati..'$</span>',      value = 'ceyrekfiyat'},
        {label = 'Yarım Altın Sat Fiyat = <span style="color:green;">'..yarimaltinfiyati..'$</span>',      value = 'yarimfiyat'},
        {label = 'Tam Altın Sat Fiyat = <span style="color:green;">'..tamaltinfiyati..'$</span>',      value = 'tamfiyat'},
        {label = 'TL Sat Fiyat = <span style="color:green;">'..tlfiyati..'$</span>',      value = 'tlfiyat'},
        {label = 'Euro Sat Fiyat = <span style="color:green;">'..eurofiyati..'$</span>',      value = 'eurofiyat'},
        {label = 'Sterlin Sat Fiyat = <span style="color:green;">'..sterlinfiyati..'$</span>',      value = 'sterlinfiyat'},
        {label = 'Tektas Sat Fiyat = <span style="color:green;">'..tektasyuzukfiyati..'$</span>',      value = 'tektasfiyat'},
        {label = '<span style="color:red;">Menüyü Kapat</span>',      value = 'menukapat'},
    }

    ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mercansatis_actions', {
        title    = '<span style="color:yellow;">Yıldırım Borsa Merkezi A.Ş.</span>',
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
       
			if data.current.value == 'gramfiyat' then
				local esya = "Gram Altın"
				brkblnt_alsat(esya)
				menu.close()
			elseif data.current.value == 'ceyrekfiyat' then
				local esya = "Çeyrek Altın"
				brkblnt_alsat(esya)
				menu.close()
			elseif data.current.value == 'yarimfiyat' then
				local esya = "Yarım Altın"
				brkblnt_alsat(esya)
				menu.close()	
			elseif data.current.value == 'tamfiyat' then
				local esya = "Tam Altın"
				brkblnt_alsat(esya)
				menu.close()	
			elseif data.current.value == 'tlfiyat' then
				local esya = "Türk Lirası"
				brkblnt_alsat(esya)
				menu.close()	
			elseif data.current.value == 'eurofiyat' then
				local esya = "Euro"
				brkblnt_alsat(esya)
				menu.close()	
			elseif data.current.value == 'sterlinfiyat' then
				local esya = "Sterlin"
				brkblnt_alsat(esya)
				menu.close()	
			elseif data.current.value == 'tektasfiyat' then
				local esya = "Tektaş Yüzük"
				brkblnt_alsat(esya)
				menu.close()	
			elseif data.current.value == 'menukapat' then
				FreezeEntityPosition(playerPed, false)
				menu.close()
				DeleteEntity(tabletObject)
				ClearPedTasks(playerPed)
				tabletObject = nil
			end
		end)
	end, 'tektas')
	end, 'sterlin')
	end, 'euro')
	end, 'tl')
	end, 'tam_altin')
	end, 'yarim_altin')
	end, 'ceyrek_altin')
	end, 'gram_altin')
end

function brkblnt_alsat(esya)
	local playerPed = PlayerPedId()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'brkblnt_menu',
        {
            title    = '<span style="color:yellow;">Yıldırım Borsa Merkezi A.Ş.</span>',
			align    = 'top-left',
            elements = {
				{label = esya.. ' Satın Al.', value = 'satınal'},
				{label = esya.. ' Bozdur.', value = 'bozdur'},
				{label = 'Menüyü Kapat', value = 'geridon'},
            }
        },
        function(data, menu)
            if data.current.value == 'satınal' then
				brkblnt_esya_satinal(esya)
				DeleteEntity(tabletObject)
				ClearPedTasks(playerPed)
				tabletObject = nil
				FreezeEntityPosition(playerPed, false)
				menu.close()
            elseif data.current.value == 'bozdur' then
				brkblnt_esya_sat(esya)
				DeleteEntity(tabletObject)
				ClearPedTasks(playerPed)
				tabletObject = nil
				FreezeEntityPosition(playerPed, false)
				menu.close()
			elseif data.current.value == 'geridon' then
				DeleteEntity(tabletObject)
				ClearPedTasks(playerPed)
				tabletObject = nil
				FreezeEntityPosition(playerPed, false)
				menu.close()
				brkblnt_menu()
				
            end
        end,
        function(data, menu)
			menu.close()
            ClearPedTasks(playerPed)
			FreezeEntityPosition(playerPed, false)
			DeleteEntity(tabletObject)
			ClearPedTasks(playerPed)
			tabletObject = nil
        end
    )
end


function brkblnt_esya_satinal(esya)
	local playerPed = PlayerPedId()
    local menu = {
        type = 'dialog',
        name = 'billing_show_amount',
        title = 'Kaç Tane ' ..esya.. ' Almak İstiyorsunuz ?',
        action = function(value)
            ESX.UI.Menu.CloseAll()
			
			DeleteEntity(tabletObject)
			ClearPedTasks(playerPed)
			tabletObject = nil
            if tonumber(value) == nil then
                exports['mythic_notify']:SendAlert('error', 'Geçersiz Miktar')
				ClearPedTasks(playerPed)
				FreezeEntityPosition(playerPed, false)
				DeleteEntity(tabletObject)
				ClearPedTasks(playerPed)
				tabletObject = nil
                return
            end
			TriggerServerEvent('brkblnt_kuyumcu:esyasatinal', esya, value)
        end
    }
	DeleteEntity(tabletObject)
	ClearPedTasks(playerPed)
	tabletObject = nil
	FreezeEntityPosition(playerPed, false)
    TriggerEvent('disc-base:openMenu', menu)
end

function brkblnt_esya_sat(esya)
	local playerPed = PlayerPedId()
    local menu = {
        type = 'dialog',
        name = 'billing_show_amount',
        title = 'Kaç Tane ' ..esya.. ' Satmak İstiyorsunuz ?', 
        action = function(value)
            ESX.UI.Menu.CloseAll()
            if tonumber(value) == nil then
                exports['mythic_notify']:SendAlert('error', 'Geçersiz Miktar')
				ClearPedTasks(playerPed)
				FreezeEntityPosition(playerPed, false)
				DeleteEntity(tabletObject)
				ClearPedTasks(playerPed)
				tabletObject = nil
                return
            end
			TriggerServerEvent('brkblnt_kuyumcu:esyasat', esya, value)
        end
    }
	DeleteEntity(tabletObject)
	ClearPedTasks(playerPed)
	tabletObject = nil
	FreezeEntityPosition(playerPed, false)
    TriggerEvent('disc-base:openMenu', menu)
end