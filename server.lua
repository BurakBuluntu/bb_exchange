if GetCurrentResourceName() == "brkblnt_borsa" then
ESX = nil
local rasgale = nil
local sans4 = nil
local sans3 = nil
local sans2 = nil
local sans1 = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	while true do
		rasgale = math.random(0, 30)
		sans4 = math.random(83, 87)
		sans3 = math.random(55, 66)
		sans2 = math.random(30, 45)
		sans1 = math.random(2, 29)
		Citizen.Wait(3600000)
	end
end)

RegisterServerEvent('brkblnt_borsa:guncelle')
AddEventHandler('brkblnt_borsa:guncelle', function(esyaismi, esyafiyati)
    MySQL.Async.fetchAll('SELECT * FROM brkblnt_borsa', {}, function(result)

        for i=1, #result, 1 do

            local id = result[i].ID

            local name = result[i].Name
            local fiyat = result[i].Fiyat
			
			
            MySQL.Async.execute('UPDATE brkblnt_borsa SET Fiyat=@YeniFiyat WHERE name=@Name',
                {
                    ['@YeniFiyat'] = esyafiyati,
					['@Name'] = esyaismi
                }
			)
        end
		
    end)
end)

	ESX.RegisterServerCallback('brkblnt_borsa:esyasatis', function(source, cb, esya, brkblnt)
		MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
			['@Name'] = esya
		}, function(result)
			for i=1, #result, 1 do
				if esya == 'packaged_chicken' then
					tavukfiyati = result[i].Fiyat
				elseif esya == 'maderaroble' then
					mesefiyati = result[i].Fiyat
				elseif esya == 'maderanogal' then
					cevizfiyati = result[i].Fiyat
				elseif esya == 'maderacaoba' then
					maunfiyati = result[i].Fiyat
				elseif esya == 'packaged_plank' then
					odunfiyati = result[i].Fiyat
				elseif esya == 'diamond' then
					elmasfiyati = result[i].Fiyat
				elseif esya == 'gold' then
					altinfiyati = result[i].Fiyat
				elseif esya == 'iron' then
					demirfiyati = result[i].Fiyat
				elseif esya == 'copper' then
					bakirfiyati = result[i].Fiyat
				elseif esya == 'paketlenmis_amfetamin' then
					amfetaminfiyati = result[i].Fiyat
				elseif esya == 'paketlenmis_beyaztas' then
					beyaztasfiyati = result[i].Fiyat
				elseif esya == 'paketlenmis_kokain' then
					kokainfiyati = result[i].Fiyat
				elseif esya == 'paketlenmis_esrar' then
					esrarfiyati = result[i].Fiyat
				elseif esya == 'paketlenmis_metafetamin' then
					metafetaminfiyati = result[i].Fiyat
				elseif esya == 'islenmis_mercan' then
					mercanfiyati = result[i].Fiyat
				elseif esya == 'paketlenmis_karides' then
					karidesfiyati = result[i].Fiyat
				elseif esya == 'paketlenmis_yengec' then
					yengecfiyati = result[i].Fiyat
					
				elseif esya == 'gram_altin' then
					gramaltinfiyati = result[i].Fiyat	
				elseif esya == 'ceyrek_altin' then
					ceyrekaltinfiyati = result[i].Fiyat	
				elseif esya == 'yarim_altin' then
					yarimaltinfiyati = result[i].Fiyat	
				elseif esya == 'tam_altin' then
					tamaltinfiyati = result[i].Fiyat	
				elseif esya == 'tl' then
					tlfiyati = result[i].Fiyat	
				elseif esya == 'euro' then
					eurofiyati = result[i].Fiyat	
				elseif esya == 'sterlin' then
					sterlinfiyati = result[i].Fiyat	
				elseif esya == 'tektas' then
					tektasyuzukfiyati = result[i].Fiyat
				else
					print("VERİ YOK: ".. esya)
				end
			end
		end)
		
		if esya == 'packaged_chicken' then
			cb(tavukfiyati)

					MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
						['@Name'] = 'paketlenmis_karides' and 'paketlenmis_yengec'
					}, function(result)
						for i=1, #result, 1 do
							karidesfiyati = result[i].Fiyat
							yengecfiyati = result[i].Fiyat
							
					brkblnt = brkblnt
					local paketlenmis_tavuk_yenidegeri = 0.03 * brkblnt
					tavukfiyati = tavukfiyati - paketlenmis_tavuk_yenidegeri
					
					local paketlenmis_karides_yenidegeri = 0.03 * brkblnt
					karidesfiyati = karidesfiyati + paketlenmis_karides_yenidegeri

					local paketlenmis_yengec_yenidegeri = 0.03 * brkblnt
					yengecfiyati = yengecfiyati + paketlenmis_yengec_yenidegeri
					
					if tavukfiyati >= 3000 then
						tavukfiyati = 3000
						TriggerEvent('brkblnt_borsa:guncelle', 'packaged_chicken', tavukfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_karides', karidesfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_yengec', yengecfiyati)
					elseif tavukfiyati <= 500 then
						tavukfiyati = 500
						TriggerEvent('brkblnt_borsa:guncelle', 'packaged_chicken', tavukfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_karides', karidesfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_yengec', yengecfiyati)
					else
						TriggerEvent('brkblnt_borsa:guncelle', 'packaged_chicken', tavukfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_karides', karidesfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_yengec', yengecfiyati)
					end
				end
			end)
		elseif esya == 'maderaroble' then
			cb(mesefiyati)

					MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
						['@Name'] = 'diamond'
					}, function(result)
						for i=1, #result, 1 do
							elmasfiyati = result[i].Fiyat

					brkblnt = brkblnt
					local paketlenmis_mese_yenidegeri = 0.05 * brkblnt
					mesefiyati = mesefiyati - paketlenmis_mese_yenidegeri
					
					local paketlenmis_elmas_yenidegeri = 0.05 * brkblnt
					elmasfiyati = elmasfiyati + paketlenmis_elmas_yenidegeri
					
					if mesefiyati >= 150 then
						mesefiyati = 150
						TriggerEvent('brkblnt_borsa:guncelle', 'maderaroble', mesefiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'diamond', elmasfiyati)
					elseif mesefiyati <= 15 then
						mesefiyati = 15
						TriggerEvent('brkblnt_borsa:guncelle', 'maderaroble', mesefiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'diamond', elmasfiyati)
					else
						TriggerEvent('brkblnt_borsa:guncelle', 'maderaroble', mesefiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'diamond', elmasfiyati)
					end
				end
			end)
		elseif esya == 'maderanogal' then
					cb(cevizfiyati)

					MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
						['@Name'] = 'gold'
					}, function(result)
						for i=1, #result, 1 do
							altinfiyati = result[i].Fiyat
							
					brkblnt = brkblnt
					local paketlenmis_ceviz_yenidegeri = 0.05 * brkblnt
					cevizfiyati = cevizfiyati - paketlenmis_ceviz_yenidegeri
					
					local paketlenmis_altin_yenidegeri = 0.05 * brkblnt
					altinfiyati = altinfiyati + paketlenmis_altin_yenidegeri
					
					if cevizfiyati >= 150 then
						cevizfiyati = 150
						TriggerEvent('brkblnt_borsa:guncelle', 'maderanogal', cevizfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'gold', altinfiyati)
					elseif cevizfiyati <= 30 then
						cevizfiyati = 30
						TriggerEvent('brkblnt_borsa:guncelle', 'maderanogal', cevizfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'gold', altinfiyati)
					else
						TriggerEvent('brkblnt_borsa:guncelle', 'maderanogal', cevizfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'gold', altinfiyati)
					end
				end
			end)
		elseif esya == 'maderacaoba' then
						cb(maunfiyati)

						MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
							['@Name'] = 'iron'
						}, function(result)
							for i=1, #result, 1 do
								demirfiyati = result[i].Fiyat
						brkblnt = brkblnt
						local paketlenmis_maun_yenidegeri = 0.05 * brkblnt
						maunfiyati = maunfiyati - paketlenmis_maun_yenidegeri
						
						local paketlenmis_demir_yenidegeri = 0.05 * brkblnt
						demirfiyati = demirfiyati + paketlenmis_demir_yenidegeri
						
						if maunfiyati >= 85 then
							maunfiyati = 85
							TriggerEvent('brkblnt_borsa:guncelle', 'maderacaoba', maunfiyati)
							TriggerEvent('brkblnt_borsa:guncelle', 'iron', demirfiyati)
						elseif maunfiyati <= 11 then
							maunfiyati = 11
							TriggerEvent('brkblnt_borsa:guncelle', 'maderacaoba', maunfiyati)
							TriggerEvent('brkblnt_borsa:guncelle', 'iron', demirfiyati)
						else
							TriggerEvent('brkblnt_borsa:guncelle', 'maderacaoba', maunfiyati)
							TriggerEvent('brkblnt_borsa:guncelle', 'iron', demirfiyati)
						end
					end
				end)
		elseif esya == 'packaged_plank' then
			cb(odunfiyati)

						MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
							['@Name'] = 'copper'
						}, function(result)
							for i=1, #result, 1 do
								bakirfiyati = result[i].Fiyat

						brkblnt = brkblnt
						local paketlenmis_odun_yenidegeri = 0.05 * brkblnt
						odunfiyati = odunfiyati - paketlenmis_odun_yenidegeri
						
						local paketlenmis_bakir_yenidegeri = 0.05 * brkblnt
						bakirfiyati = bakirfiyati + paketlenmis_bakir_yenidegeri
						
						if odunfiyati >= 45 then
							odunfiyati = 45
							TriggerEvent('brkblnt_borsa:guncelle', 'packaged_plank', odunfiyati)
							TriggerEvent('brkblnt_borsa:guncelle', 'copper', bakirfiyati)
						elseif odunfiyati <= 8 then
							odunfiyati = 8
							TriggerEvent('brkblnt_borsa:guncelle', 'packaged_plank', odunfiyati)
							TriggerEvent('brkblnt_borsa:guncelle', 'copper', bakirfiyati)
						else
							TriggerEvent('brkblnt_borsa:guncelle', 'packaged_plank', odunfiyati)
							TriggerEvent('brkblnt_borsa:guncelle', 'copper', bakirfiyati)
						end
					end
				end)
		elseif esya == 'diamond' then
			cb(elmasfiyati)

				MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
					['@Name'] = 'maderaroble'
				}, function(result)
					for i=1, #result, 1 do
					mesefiyati = result[i].Fiyat
					brkblnt = brkblnt
					local paketlenmis_elmas_yenidegeri = 0.05 * brkblnt
					elmasfiyati = elmasfiyati - paketlenmis_elmas_yenidegeri
					
					local paketlenmis_mese_yenidegeri = 0.05 * brkblnt
					mesefiyati = mesefiyati + paketlenmis_mese_yenidegeri

				
				
					if elmasfiyati >= 1500 then
						elmasfiyati = 1500
						TriggerEvent('brkblnt_borsa:guncelle', 'diamond', elmasfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'maderaroble', mesefiyati)
					elseif elmasfiyati <= 500 then
						elmasfiyati = 500
						TriggerEvent('brkblnt_borsa:guncelle', 'diamond', elmasfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'maderaroble', mesefiyati)
					else
						TriggerEvent('brkblnt_borsa:guncelle', 'diamond', elmasfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'maderaroble', mesefiyati)
					end
				end
			end)
		elseif esya == 'gold' then
			cb(altinfiyati)

			MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
				['@Name'] = 'maderanogal'
			}, function(result)
				for i=1, #result, 1 do
					cevizfiyati = result[i].Fiyat

					brkblnt = brkblnt
					local paketlenmis_altin_yenidegeri = 0.05 * brkblnt
					altinfiyati = altinfiyati - paketlenmis_altin_yenidegeri
					
					local paketlenmis_ceviz_yenidegeri = 0.05 * brkblnt
					cevizfiyati = cevizfiyati + paketlenmis_ceviz_yenidegeri
					
					if altinfiyati >= 1250 then
						altinfiyati = 1250
						TriggerEvent('brkblnt_borsa:guncelle', 'gold', altinfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'maderanogal', cevizfiyati)
					elseif altinfiyati <= 200 then
						altinfiyati = 200
						TriggerEvent('brkblnt_borsa:guncelle', 'gold', altinfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'maderanogal', cevizfiyati)
					else
						TriggerEvent('brkblnt_borsa:guncelle', 'gold', altinfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'maderanogal', cevizfiyati)
					end
				end
			end)
		elseif esya == 'iron' then
					cb(demirfiyati)

					MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
						['@Name'] = 'maderacaoba'
					}, function(result)
						for i=1, #result, 1 do
					maunfiyati = result[i].Fiyat

					brkblnt = brkblnt
					local paketlenmis_demir_yenidegeri = 0.05 * brkblnt
					demirfiyati = demirfiyati - paketlenmis_demir_yenidegeri
					
					local paketlenmis_maun_yenidegeri = 0.05 * brkblnt
					maunfiyati = maunfiyati + paketlenmis_maun_yenidegeri
					
					if demirfiyati >= 1000 then
						demirfiyati = 1000
						TriggerEvent('brkblnt_borsa:guncelle', 'iron', demirfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'maderacaoba', maunfiyati)
					elseif demirfiyati <= 100 then
						demirfiyati = 100
						TriggerEvent('brkblnt_borsa:guncelle', 'iron', demirfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'maderacaoba', maunfiyati)
					else
						TriggerEvent('brkblnt_borsa:guncelle', 'iron', demirfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'maderacaoba', maunfiyati)
					end
				end
			end)
		elseif esya == 'copper' then
					cb(bakirfiyati)

						MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
							['@Name'] = 'packaged_plank'
						}, function(result)
							for i=1, #result, 1 do
								odunfiyati = result[i].Fiyat

						brkblnt = brkblnt
						local paketlenmis_bakir_yenidegeri = 0.05 * brkblnt
						bakirfiyati = bakirfiyati - paketlenmis_bakir_yenidegeri
						
						local paketlenmis_odun_yenidegeri = 0.05 * brkblnt
						odunfiyati = odunfiyati + paketlenmis_odun_yenidegeri

						if bakirfiyati >= 500 then
							bakirfiyati = 500
							TriggerEvent('brkblnt_borsa:guncelle', 'copper', bakirfiyati)
							TriggerEvent('brkblnt_borsa:guncelle', 'packaged_plank', odunfiyati)
						elseif bakirfiyati <= 100 then
							bakirfiyati = 100
							TriggerEvent('brkblnt_borsa:guncelle', 'copper', bakirfiyati)
							TriggerEvent('brkblnt_borsa:guncelle', 'packaged_plank', odunfiyati)
						else
							TriggerEvent('brkblnt_borsa:guncelle', 'copper', bakirfiyati)
							TriggerEvent('brkblnt_borsa:guncelle', 'packaged_plank', odunfiyati)
						end
					end
				end)
		elseif esya == 'paketlenmis_karides' then
			cb(karidesfiyati)
					MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
						['@Name'] = 'packaged_chicken'
					}, function(result)
						for i=1, #result, 1 do
							tavukfiyati = result[i].Fiyat

					brkblnt = brkblnt
					local paketlenmis_karides_yenidegeri = 0.05 * brkblnt
					karidesfiyati = karidesfiyati - paketlenmis_karides_yenidegeri
					
					local paketlenmis_tavuk_yenidegeri = 0.05 * brkblnt
					tavukfiyati = tavukfiyati + paketlenmis_tavuk_yenidegeri
					
					if karidesfiyati >= 3000 then
						karidesfiyati = 3000
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_karides', karidesfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'packaged_chicken', tavukfiyati)
					elseif karidesfiyati <= 500 then
						karidesfiyati = 500
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_karides', karidesfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'packaged_chicken', tavukfiyati)
					else
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_karides', karidesfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'packaged_chicken', tavukfiyati)
					end
				end
			end)
		elseif esya == 'paketlenmis_yengec' then
			cb(yengecfiyati)
					MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
						['@Name'] = 'packaged_chicken'
					}, function(result)
						for i=1, #result, 1 do
							tavukfiyati = result[i].Fiyat

					brkblnt = brkblnt

					local paketlenmis_yengec_yenidegeri = 0.05 * brkblnt
					yengecfiyati = yengecfiyati - paketlenmis_yengec_yenidegeri
					
					local paketlenmis_tavuk_yenidegeri = 0.05 * brkblnt
					tavukfiyati = tavukfiyati + paketlenmis_tavuk_yenidegeri

					if yengecfiyati >= 3000 then
						yengecfiyati = 3000
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_yengec', yengecfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'packaged_chicken', tavukfiyati)
					elseif yengecfiyati <= 500 then
						yengecfiyati = 500
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_yengec', yengecfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'packaged_chicken', tavukfiyati)
					else
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_yengec', yengecfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'packaged_chicken', tavukfiyati)
					end		
				end
			end)
		elseif esya == 'paketlenmis_amfetamin' then
			cb(amfetaminfiyati)
					MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
						['@Name'] = 'paketlenmis_metafetamin'
					}, function(result)
						for i=1, #result, 1 do
							metafetaminfiyati = result[i].Fiyat

					brkblnt = brkblnt
					local paketlenmis_amfetamin_yenidegeri = 0.15 * brkblnt
					amfetaminfiyati = amfetaminfiyati - paketlenmis_amfetamin_yenidegeri

					local paketlenmis_metafetamin_yenidegeri = 0.15 * brkblnt
					metafetaminfiyati = metafetaminfiyati + paketlenmis_metafetamin_yenidegeri


					if amfetaminfiyati >= 350 then
						amfetaminfiyati = 350
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_amfetamin', amfetaminfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_metafetamin', metafetaminfiyati)
					elseif amfetaminfiyati <= 150 then
						amfetaminfiyati = 150
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_amfetamin', amfetaminfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_metafetamin', metafetaminfiyati)
					else
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_amfetamin', amfetaminfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_metafetamin', metafetaminfiyati)
					end
				end
			end)
		elseif esya == 'paketlenmis_beyaztas' then
			cb(beyaztasfiyati)
					MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
						['@Name'] = 'islenmis_mercan'
					}, function(result)
						for i=1, #result, 1 do
							mercanfiyati = result[i].Fiyat

					brkblnt = brkblnt
					local paketlenmis_beyaztas_yenidegeri = 0.12 * brkblnt
					beyaztasfiyati = beyaztasfiyati - paketlenmis_beyaztas_yenidegeri
					
					local paketlenmis_mercan_yenidegeri = 0.12 * brkblnt
					mercanfiyati = mercanfiyati + paketlenmis_mercan_yenidegeri

					if beyaztasfiyati >= 325 then
						beyaztasfiyati = 325
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_beyaztas', beyaztasfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'islenmis_mercan', mercanfiyati)
					elseif beyaztasfiyati <= 125 then
						beyaztasfiyati = 125
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_beyaztas', beyaztasfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'islenmis_mercan', mercanfiyati)
					else
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_beyaztas', beyaztasfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'islenmis_mercan', mercanfiyati)
					end
				end
			end)
		elseif esya == 'paketlenmis_kokain' then
			cb(kokainfiyati)
					MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
						['@Name'] = 'paketlenmis_esrar'
					}, function(result)
						for i=1, #result, 1 do
							esrarfiyati = result[i].Fiyat

					brkblnt = brkblnt
					local paketlenmis_kokain_yenidegeri = 0.10 * brkblnt
					kokainfiyati = kokainfiyati - paketlenmis_kokain_yenidegeri

					local paketlenmis_esrar_yenidegeri = 0.10 * brkblnt
					esrarfiyati = esrarfiyati + paketlenmis_esrar_yenidegeri
					
					if kokainfiyati >= 150 then
						kokainfiyati = 150
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_kokain', kokainfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_esrar', esrarfiyati)
					elseif kokainfiyati <= 85 then
						kokainfiyati = 85
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_kokain', kokainfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_esrar', esrarfiyati)
					else
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_kokain', kokainfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_esrar', esrarfiyati)
					end
				end
			end)
		elseif esya == 'paketlenmis_esrar' then
			cb(esrarfiyati)
					MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
						['@Name'] = 'paketlenmis_kokain'
					}, function(result)
						for i=1, #result, 1 do
							kokainfiyati = result[i].Fiyat

					brkblnt = brkblnt
					local paketlenmis_esrar_yenidegeri =  0.10 * brkblnt
					esrarfiyati = esrarfiyati - paketlenmis_esrar_yenidegeri

					local paketlenmis_kokain_yenidegeri = 0.10 * brkblnt
					kokainfiyati = kokainfiyati + paketlenmis_kokain_yenidegeri

					if esrarfiyati >= 225 then
						esrarfiyati = 225
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_esrar', esrarfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_kokain', kokainfiyati)
					elseif esrarfiyati <= 115 then
						esrarfiyati = 115
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_esrar', esrarfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_kokain', kokainfiyati)
					else
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_esrar', esrarfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_kokain', kokainfiyati)
					end
				end
			end)
		elseif esya == 'paketlenmis_metafetamin' then
			cb(metafetaminfiyati)

					MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
						['@Name'] = 'paketlenmis_amfetamin'
					}, function(result)
						for i=1, #result, 1 do
							amfetaminfiyati = result[i].Fiyat

					brkblnt = brkblnt
					local paketlenmis_metafetamin_yenidegeri = 0.15 * brkblnt
					metafetaminfiyati = metafetaminfiyati - paketlenmis_metafetamin_yenidegeri

					local paketlenmis_amfetamin_yenidegeri = 0.15 * brkblnt
					amfetaminfiyati = amfetaminfiyati + paketlenmis_amfetamin_yenidegeri
					
					if metafetaminfiyati >= 195 then
						metafetaminfiyati = 195
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_metafetamin', metafetaminfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_amfetamin', amfetaminfiyati)
					elseif metafetaminfiyati <= 135 then
						metafetaminfiyati = 135
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_metafetamin', metafetaminfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_amfetamin', amfetaminfiyati)
					else
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_metafetamin', metafetaminfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_amfetamin', amfetaminfiyati)
					end
				end
			end)
		elseif esya == 'islenmis_mercan' then
			cb(mercanfiyati)

					MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
						['@Name'] = 'paketlenmis_beyaztas'
					}, function(result)
						for i=1, #result, 1 do
							beyaztasfiyati = result[i].Fiyat

					brkblnt = brkblnt
					local paketlenmis_mercan_yenidegeri = 0.12 * brkblnt
					mercanfiyati = mercanfiyati - paketlenmis_mercan_yenidegeri
					
					local paketlenmis_beyaztas_yenidegeri = 0.12 * brkblnt
					beyaztasfiyati = beyaztasfiyati + paketlenmis_beyaztas_yenidegeri
					
					if mercanfiyati >= 220 then
						mercanfiyati = 220
						TriggerEvent('brkblnt_borsa:guncelle', 'islenmis_mercan', mercanfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_beyaztas', beyaztasfiyati)
					elseif mercanfiyati <= 145 then
						mercanfiyati = 145
						TriggerEvent('brkblnt_borsa:guncelle', 'islenmis_mercan', mercanfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_beyaztas', beyaztasfiyati)
					else
						TriggerEvent('brkblnt_borsa:guncelle', 'islenmis_mercan', mercanfiyati)
						TriggerEvent('brkblnt_borsa:guncelle', 'paketlenmis_beyaztas', beyaztasfiyati)
					end
				end
			end)
		else
			print("ESYANIN DB ISMI: "..esya)
		end
	end)

	ESX.RegisterServerCallback('brkblnt_borsa:fiyatsorgulama', function(source, cb, esya)
		MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
			['@Name'] = esya
		}, function(result)
			for i=1, #result, 1 do
				if esya == 'packaged_chicken' then
					tavukfiyati = result[i].Fiyat
					cb(tavukfiyati)
				elseif esya == 'maderaroble' then
					mesefiyati = result[i].Fiyat
					cb(mesefiyati)
				elseif esya == 'maderanogal' then
					cevizfiyati = result[i].Fiyat
					cb(cevizfiyati)
				elseif esya == 'maderacaoba' then
					maunfiyati = result[i].Fiyat
					cb(maunfiyati)
				elseif esya == 'packaged_plank' then
					odunfiyati = result[i].Fiyat
					cb(odunfiyati)
				elseif esya == 'diamond' then
					elmasfiyati = result[i].Fiyat
					cb(elmasfiyati)
				elseif esya == 'gold' then
					altinfiyati = result[i].Fiyat
					cb(altinfiyati)
				elseif esya == 'iron' then
					demirfiyati = result[i].Fiyat
					cb(demirfiyati)
				elseif esya == 'copper' then
					bakirfiyati = result[i].Fiyat
					cb(bakirfiyati)
				elseif esya == 'paketlenmis_amfetamin' then
					amfetaminfiyati = result[i].Fiyat
					cb(amfetaminfiyati)
				elseif esya == 'paketlenmis_beyaztas' then
					beyaztasfiyati = result[i].Fiyat
					cb(beyaztasfiyati)
				elseif esya == 'paketlenmis_kokain' then
					kokainfiyati = result[i].Fiyat
					cb(kokainfiyati)
				elseif esya == 'paketlenmis_esrar' then
					esrarfiyati = result[i].Fiyat
					cb(esrarfiyati)
				elseif esya == 'paketlenmis_metafetamin' then
					metafetaminfiyati = result[i].Fiyat
					cb(metafetaminfiyati)
				elseif esya == 'islenmis_mercan' then
					mercanfiyati = result[i].Fiyat
					cb(mercanfiyati)
				elseif esya == 'paketlenmis_karides' then
					karidesfiyati = result[i].Fiyat
					cb(karidesfiyati)
				elseif esya == 'paketlenmis_yengec' then
					yengecfiyati = result[i].Fiyat
					cb(yengecfiyati)
					
				elseif esya == 'gram_altin' then
					gramaltinfiyati = result[i].Fiyat
					
					if rasgale == 30 then
						gramaltinfiyati = gramaltinfiyati + sans4
					elseif rasgale >= 26 and rasgale <= 29 then
						gramaltinfiyati = gramaltinfiyati + sans3
					elseif rasgale >= 21 and rasgale <= 25 then
						gramaltinfiyati = gramaltinfiyati + sans2
					elseif rasgale >= 16 and rasgale <= 20 then
						gramaltinfiyati = gramaltinfiyati + sans1
					elseif rasgale >= 10 and rasgale <= 14 then
						gramaltinfiyati = gramaltinfiyati - sans1
					elseif rasgale >= 5 and rasgale <= 9 then
						gramaltinfiyati = gramaltinfiyati - sans2
					elseif rasgale >= 1 and rasgale <= 4 then
						gramaltinfiyati = gramaltinfiyati - sans3
					elseif rasgale == 0 then
						gramaltinfiyati = gramaltinfiyati - sans4
					end
			
					
					cb(gramaltinfiyati)	
				elseif esya == 'ceyrek_altin' then
					ceyrekaltinfiyati = result[i].Fiyat
					
					if rasgale == 30 then
						ceyrekaltinfiyati = ceyrekaltinfiyati + sans4
					elseif rasgale >= 26 and rasgale <= 29 then
						ceyrekaltinfiyati = ceyrekaltinfiyati + sans3
					elseif rasgale >= 21 and rasgale <= 25 then
						ceyrekaltinfiyati = ceyrekaltinfiyati + sans2
					elseif rasgale >= 16 and rasgale <= 20 then
						ceyrekaltinfiyati = ceyrekaltinfiyati + sans1
					elseif rasgale >= 10 and rasgale <= 14 then
						ceyrekaltinfiyati = ceyrekaltinfiyati - sans1
					elseif rasgale >= 5 and rasgale <= 9 then
						ceyrekaltinfiyati = ceyrekaltinfiyati - sans2
					elseif rasgale >= 1 and rasgale <= 4 then
						ceyrekaltinfiyati = ceyrekaltinfiyati - sans3
					elseif rasgale == 0 then
						ceyrekaltinfiyati = ceyrekaltinfiyati - sans4
					end
					
					cb(ceyrekaltinfiyati)	
				elseif esya == 'yarim_altin' then
					yarimaltinfiyati = result[i].Fiyat
					
					if rasgale == 30 then
						yarimaltinfiyati = yarimaltinfiyati + sans4
					elseif rasgale >= 26 and rasgale <= 29 then
						yarimaltinfiyati = yarimaltinfiyati + sans3
					elseif rasgale >= 21 and rasgale <= 25 then
						yarimaltinfiyati = yarimaltinfiyati + sans2
					elseif rasgale >= 16 and rasgale <= 20 then
						yarimaltinfiyati = yarimaltinfiyati + sans1
					elseif rasgale >= 10 and rasgale <= 14 then
						yarimaltinfiyati = yarimaltinfiyati - sans1
					elseif rasgale >= 5 and rasgale <= 9 then
						yarimaltinfiyati = yarimaltinfiyati - sans2
					elseif rasgale >= 1 and rasgale <= 4 then
						yarimaltinfiyati = yarimaltinfiyati - sans3
					elseif rasgale == 0 then
						yarimaltinfiyati = yarimaltinfiyati - sans4
					end
					
					cb(yarimaltinfiyati)	
				elseif esya == 'tam_altin' then
					tamaltinfiyati = result[i].Fiyat
					
					if rasgale == 30 then
						tamaltinfiyati = tamaltinfiyati + sans4
					elseif rasgale >= 26 and rasgale <= 29 then
						tamaltinfiyati = tamaltinfiyati + sans3
					elseif rasgale >= 21 and rasgale <= 25 then
						tamaltinfiyati = tamaltinfiyati + sans2
					elseif rasgale >= 16 and rasgale <= 20 then
						tamaltinfiyati = tamaltinfiyati + sans1
					elseif rasgale >= 10 and rasgale <= 14 then
						tamaltinfiyati = tamaltinfiyati - sans1
					elseif rasgale >= 5 and rasgale <= 9 then
						tamaltinfiyati = tamaltinfiyati - sans2
					elseif rasgale >= 1 and rasgale <= 4 then
						tamaltinfiyati = tamaltinfiyati - sans3
					elseif rasgale == 0 then
						tamaltinfiyati = tamaltinfiyati - sans4
					end
					
					cb(tamaltinfiyati)	
				elseif esya == 'tl' then
					tlfiyati = result[i].Fiyat
					
					if rasgale == 30 then
						tlfiyati = tlfiyati - 3
					elseif rasgale >= 20 and rasgale <= 29 then
						tlfiyati = tlfiyati - 2
					elseif rasgale >= 16 and rasgale <= 19 then
						tlfiyati = tlfiyati - 1
					elseif rasgale >= 10 and rasgale <= 15 then
						tlfiyati = tlfiyati + 1
					elseif rasgale >= 1 and rasgale <= 9 then
						tlfiyati = tlfiyati + 2
					elseif rasgale == 0 then
						tlfiyati = tlfiyati + 3
					end
					
					cb(tlfiyati)	
				elseif esya == 'euro' then
					eurofiyati = result[i].Fiyat
					
					if rasgale == 30 then
						eurofiyati = eurofiyati - 4
					elseif rasgale >= 20 and rasgale <= 29 then
						eurofiyati = eurofiyati - 3
					elseif rasgale >= 16 and rasgale <= 19 then
						eurofiyati = eurofiyati - 2
					elseif rasgale >= 10 and rasgale <= 15 then
						eurofiyati = eurofiyati + 2
					elseif rasgale >= 1 and rasgale <= 9 then
						eurofiyati = eurofiyati + 3
					elseif rasgale == 0 then
						eurofiyati = eurofiyati + 4
					end
					
					cb(eurofiyati)	
				elseif esya == 'sterlin' then
					sterlinfiyati = result[i].Fiyat
					
					if rasgale == 30 then
						sterlinfiyati = sterlinfiyati - 4
					elseif rasgale >= 20 and rasgale <= 29 then
						sterlinfiyati = sterlinfiyati - 3
					elseif rasgale >= 16 and rasgale <= 19 then
						sterlinfiyati = sterlinfiyati - 2
					elseif rasgale >= 10 and rasgale <= 15 then
						sterlinfiyati = sterlinfiyati + 2
					elseif rasgale >= 1 and rasgale <= 9 then
						sterlinfiyati = sterlinfiyati + 3
					elseif rasgale == 0 then
						sterlinfiyati = sterlinfiyati + 4
					end
					
					cb(sterlinfiyati)	
				elseif esya == 'tektas' then
					tektasyuzukfiyati = result[i].Fiyat
					
					if rasgale == 30 then
						tektasyuzukfiyati = tektasyuzukfiyati + 773
					elseif rasgale >= 20 and rasgale <= 29 then
						tektasyuzukfiyati = tektasyuzukfiyati + 460
					elseif rasgale >= 16 and rasgale <= 19 then
						tektasyuzukfiyati = tektasyuzukfiyati + 211
					elseif rasgale >= 10 and rasgale <= 15 then
						tektasyuzukfiyati = tektasyuzukfiyati - 211
					elseif rasgale >= 1 and rasgale <= 9 then
						tektasyuzukfiyati = tektasyuzukfiyati - 460
					elseif rasgale == 0 then
						tektasyuzukfiyati = tektasyuzukfiyati - 773
					end
					
					cb(tektasyuzukfiyati)
				else
					print("VERİ YOK: ".. esya)
				end
			end
		end)  
	end)
	
	----------------------------------------------------------------------------- KUYUMCU -----------------------------------------------------------------------------
	----------------------------------------------------------------------------- KUYUMCU -----------------------------------------------------------------------------
	----------------------------------------------------------------------------- KUYUMCU -----------------------------------------------------------------------------
	----------------------------------------------------------------------------- KUYUMCU -----------------------------------------------------------------------------
	----------------------------------------------------------------------------- KUYUMCU ----------------------------------------------------------------------------
	
RegisterServerEvent('brkblnt_kuyumcu:esyasatinal')
AddEventHandler('brkblnt_kuyumcu:esyasatinal', function(item, miktari)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if item == "Gram Altın" then
		MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
			['@Name'] = "gram_altin"
		}, function(result)
			for i=1, #result, 1 do
				gramaltinfiyati = result[i].Fiyat
				
				
					if rasgale == 30 then
						gramaltinfiyati = gramaltinfiyati + sans4
					elseif rasgale >= 26 and rasgale <= 29 then
						gramaltinfiyati = gramaltinfiyati + sans3
					elseif rasgale >= 21 and rasgale <= 25 then
						gramaltinfiyati = gramaltinfiyati + sans2
					elseif rasgale >= 16 and rasgale <= 20 then
						gramaltinfiyati = gramaltinfiyati + sans1
					elseif rasgale >= 10 and rasgale <= 14 then
						gramaltinfiyati = gramaltinfiyati - sans1
					elseif rasgale >= 5 and rasgale <= 9 then
						gramaltinfiyati = gramaltinfiyati - sans2
					elseif rasgale >= 1 and rasgale <= 4 then
						gramaltinfiyati = gramaltinfiyati - sans3
					elseif rasgale == 0 then
						gramaltinfiyati = gramaltinfiyati - sans4
					end
				
					local fiyat = gramaltinfiyati*miktari

				if xPlayer.getMoney() >= fiyat then

					xPlayer.removeMoney(fiyat)
					xPlayer.addInventoryItem('gram_altin', miktari+.0)
				else
					TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Yeterli Paranız Yok.', length = 3000})
				end
			end
		end)
	elseif item == "Çeyrek Altın" then
		MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
			['@Name'] = "ceyrek_altin"
		}, function(result)
			for i=1, #result, 1 do
				ceyrekaltinfiyati = result[i].Fiyat
				
					if rasgale == 30 then
						ceyrekaltinfiyati = ceyrekaltinfiyati + sans4
					elseif rasgale >= 26 and rasgale <= 29 then
						ceyrekaltinfiyati = ceyrekaltinfiyati + sans3
					elseif rasgale >= 21 and rasgale <= 25 then
						ceyrekaltinfiyati = ceyrekaltinfiyati + sans2
					elseif rasgale >= 16 and rasgale <= 20 then
						ceyrekaltinfiyati = ceyrekaltinfiyati + sans1
					elseif rasgale >= 10 and rasgale <= 14 then
						ceyrekaltinfiyati = ceyrekaltinfiyati - sans1
					elseif rasgale >= 5 and rasgale <= 9 then
						ceyrekaltinfiyati = ceyrekaltinfiyati - sans2
					elseif rasgale >= 1 and rasgale <= 4 then
						ceyrekaltinfiyati = ceyrekaltinfiyati - sans3
					elseif rasgale == 0 then
						ceyrekaltinfiyati = ceyrekaltinfiyati - sans4
					end
				
				
				local fiyat = ceyrekaltinfiyati*miktari
				
				if xPlayer.getMoney() >= fiyat then
					xPlayer.removeMoney(fiyat)
					xPlayer.addInventoryItem('ceyrek_altin', miktari+.0)
				else
					TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Yeterli Paranız Yok.', length = 3000})
				end
			end
		end)
	elseif item == "Yarım Altın" then
		MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
			['@Name'] = "yarim_altin"
		}, function(result)
			for i=1, #result, 1 do
				yarimaltinfiyati = result[i].Fiyat
				
					if rasgale == 30 then
						yarimaltinfiyati = yarimaltinfiyati + sans4
					elseif rasgale >= 26 and rasgale <= 29 then
						yarimaltinfiyati = yarimaltinfiyati + sans3
					elseif rasgale >= 21 and rasgale <= 25 then
						yarimaltinfiyati = yarimaltinfiyati + sans2
					elseif rasgale >= 16 and rasgale <= 20 then
						yarimaltinfiyati = yarimaltinfiyati + sans1
					elseif rasgale >= 10 and rasgale <= 14 then
						yarimaltinfiyati = yarimaltinfiyati - sans1
					elseif rasgale >= 5 and rasgale <= 9 then
						yarimaltinfiyati = yarimaltinfiyati - sans2
					elseif rasgale >= 1 and rasgale <= 4 then
						yarimaltinfiyati = yarimaltinfiyati - sans3
					elseif rasgale == 0 then
						yarimaltinfiyati = yarimaltinfiyati - sans4
					end
					
				local fiyat = yarimaltinfiyati*miktari
				
					
					
				if xPlayer.getMoney() >= fiyat then
					xPlayer.removeMoney(fiyat)
					xPlayer.addInventoryItem('yarim_altin', miktari+.0)
				else
					TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Yeterli Paranız Yok.', length = 3000})
				end
			end
		end)
	elseif item == "Tam Altın" then
		MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
			['@Name'] = "tam_altin"
		}, function(result)
			for i=1, #result, 1 do
				tamaltinfiyati = result[i].Fiyat
				
					if rasgale == 30 then
						tamaltinfiyati = tamaltinfiyati + sans4
					elseif rasgale >= 26 and rasgale <= 29 then
						tamaltinfiyati = tamaltinfiyati + sans3
					elseif rasgale >= 21 and rasgale <= 25 then
						tamaltinfiyati = tamaltinfiyati + sans2
					elseif rasgale >= 16 and rasgale <= 20 then
						tamaltinfiyati = tamaltinfiyati + sans1
					elseif rasgale >= 10 and rasgale <= 14 then
						tamaltinfiyati = tamaltinfiyati - sans1
					elseif rasgale >= 5 and rasgale <= 9 then
						tamaltinfiyati = tamaltinfiyati - sans2
					elseif rasgale >= 1 and rasgale <= 4 then
						tamaltinfiyati = tamaltinfiyati - sans3
					elseif rasgale == 0 then
						tamaltinfiyati = tamaltinfiyati - sans4
					end
					
				local fiyat = tamaltinfiyati*miktari
				
				if xPlayer.getMoney() >= fiyat then
					xPlayer.removeMoney(fiyat)
					xPlayer.addInventoryItem('tam_altin', miktari+.0)
				else
					TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Yeterli Paranız Yok.', length = 3000})
				end
			end
		end)
	elseif item == "Türk Lirası" then
		MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
			['@Name'] = "tl"
		}, function(result)
			for i=1, #result, 1 do
				tlfiyati = result[i].Fiyat
				
					if rasgale == 30 then
						tlfiyati = tlfiyati - 3
					elseif rasgale >= 20 and rasgale <= 29 then
						tlfiyati = tlfiyati - 2
					elseif rasgale >= 16 and rasgale <= 19 then
						tlfiyati = tlfiyati - 1
					elseif rasgale >= 10 and rasgale <= 15 then
						tlfiyati = tlfiyati + 1
					elseif rasgale >= 1 and rasgale <= 9 then
						tlfiyati = tlfiyati + 2
					elseif rasgale == 0 then
						tlfiyati = tlfiyati + 3
					end
					
				local fiyat = tlfiyati*miktari
				
				if xPlayer.getMoney() >= fiyat then
					xPlayer.removeMoney(fiyat)
					xPlayer.addInventoryItem('tl', miktari+.0)
				else
					TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Yeterli Paranız Yok.', length = 3000})
				end
			end
		end)
	elseif item == "Euro" then
		MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
			['@Name'] = "euro"
		}, function(result)
			for i=1, #result, 1 do
				eurofiyati = result[i].Fiyat
				
					if rasgale == 30 then
						eurofiyati = eurofiyati - 4
					elseif rasgale >= 20 and rasgale <= 29 then
						eurofiyati = eurofiyati - 3
					elseif rasgale >= 16 and rasgale <= 19 then
						eurofiyati = eurofiyati - 2
					elseif rasgale >= 10 and rasgale <= 15 then
						eurofiyati = eurofiyati + 2
					elseif rasgale >= 1 and rasgale <= 9 then
						eurofiyati = eurofiyati + 3
					elseif rasgale == 0 then
						eurofiyati = eurofiyati + 4
					end
					
				local fiyat = eurofiyati*miktari
				
				if xPlayer.getMoney() >= fiyat then
					xPlayer.removeMoney(fiyat)
					xPlayer.addInventoryItem('euro', miktari+.0)
				else
					TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Yeterli Paranız Yok.', length = 3000})
				end
			end
		end)
	elseif item == "Sterlin" then
		MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
			['@Name'] = "sterlin"
		}, function(result)
			for i=1, #result, 1 do
				sterlinfiyati = result[i].Fiyat
				
				if rasgale == 30 then
						sterlinfiyati = sterlinfiyati - 4
					elseif rasgale >= 20 and rasgale <= 29 then
						sterlinfiyati = sterlinfiyati - 3
					elseif rasgale >= 16 and rasgale <= 19 then
						sterlinfiyati = sterlinfiyati - 2
					elseif rasgale >= 10 and rasgale <= 15 then
						sterlinfiyati = sterlinfiyati + 2
					elseif rasgale >= 1 and rasgale <= 9 then
						sterlinfiyati = sterlinfiyati + 3
					elseif rasgale == 0 then
						sterlinfiyati = sterlinfiyati + 4
					end
					
				local fiyat = sterlinfiyati*miktari
				
					
					
				if xPlayer.getMoney() >= fiyat then
					xPlayer.removeMoney(fiyat)
					xPlayer.addInventoryItem('sterlin', miktari+.0)
				else
					TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Yeterli Paranız Yok.', length = 3000})
				end
			end
		end)
	elseif item == "Tektaş Yüzük" then
		MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
			['@Name'] = "tektas"
		}, function(result)
			for i=1, #result, 1 do
				tektasfiyati = result[i].Fiyat
					if rasgale == 30 then
						tektasyuzukfiyati = tektasyuzukfiyati + 773
					elseif rasgale >= 20 and rasgale <= 29 then
						tektasyuzukfiyati = tektasyuzukfiyati + 460
					elseif rasgale >= 16 and rasgale <= 19 then
						tektasyuzukfiyati = tektasyuzukfiyati + 211
					elseif rasgale >= 10 and rasgale <= 15 then
						tektasyuzukfiyati = tektasyuzukfiyati - 211
					elseif rasgale >= 1 and rasgale <= 9 then
						tektasyuzukfiyati = tektasyuzukfiyati - 460
					elseif rasgale == 0 then
						tektasyuzukfiyati = tektasyuzukfiyati - 773
					end
					
				local fiyat = tektasfiyati*miktari
					
				if xPlayer.getMoney() >= fiyat then
					xPlayer.removeMoney(fiyat)
					xPlayer.addInventoryItem('tektas', miktari+.0)
				else
					TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Yeterli Paranız Yok.', length = 3000})
				end
			end
		end)
	else
		print("HATA KONTROL : Esya Bulunamadı Eşya :" ..esya)
	end			
end)

	RegisterServerEvent('brkblnt_kuyumcu:esyasat')
	AddEventHandler('brkblnt_kuyumcu:esyasat', function(item, miktari)
		local _source = source
		local xPlayer = ESX.GetPlayerFromId(_source)
		
		
		if item == "Gram Altın" then
			MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
				['@Name'] = "gram_altin"
			}, function(result)
				for i=1, #result, 1 do
					gramaltinfiyati = result[i].Fiyat
					local uzerindekimiktar = xPlayer.getInventoryItem('gram_altin').count  

					if rasgale == 30 then
						gramaltinfiyati = gramaltinfiyati + sans4
					elseif rasgale >= 26 and rasgale <= 29 then
						gramaltinfiyati = gramaltinfiyati + sans3
					elseif rasgale >= 21 and rasgale <= 25 then
						gramaltinfiyati = gramaltinfiyati + sans2
					elseif rasgale >= 16 and rasgale <= 20 then
						gramaltinfiyati = gramaltinfiyati + sans1
					elseif rasgale >= 10 and rasgale <= 14 then
						gramaltinfiyati = gramaltinfiyati - sans1
					elseif rasgale >= 5 and rasgale <= 9 then
						gramaltinfiyati = gramaltinfiyati - sans2
					elseif rasgale >= 1 and rasgale <= 4 then
						gramaltinfiyati = gramaltinfiyati - sans3
					elseif rasgale == 0 then
						gramaltinfiyati = gramaltinfiyati - sans4
					end
					
					if uzerindekimiktar >= miktari+.0 then
						if xPlayer.canCarryItem("gram_altin", miktari) then 
							xPlayer.addMoney(gramaltinfiyati*miktari)
							xPlayer.removeInventoryItem('gram_altin', miktari)
						else
							TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Üzerinizde Yeterli Yer Yok.', length = 3000})
						end
					else
						TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Üzerinizde Gram Altın Yok.', length = 3000})
					end
				end
			end)
		elseif item == "Çeyrek Altın" then
			MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
				['@Name'] = "ceyrek_altin"
			}, function(result)
				for i=1, #result, 1 do
					ceyrekaltinfiyati = result[i].Fiyat
					local uzerindekimiktar = xPlayer.getInventoryItem('ceyrek_altin').count
					
					if rasgale == 30 then
						ceyrekaltinfiyati = ceyrekaltinfiyati + sans4
					elseif rasgale >= 26 and rasgale <= 29 then
						ceyrekaltinfiyati = ceyrekaltinfiyati + sans3
					elseif rasgale >= 21 and rasgale <= 25 then
						ceyrekaltinfiyati = ceyrekaltinfiyati + sans2
					elseif rasgale >= 16 and rasgale <= 20 then
						ceyrekaltinfiyati = ceyrekaltinfiyati + sans1
					elseif rasgale >= 10 and rasgale <= 14 then
						ceyrekaltinfiyati = ceyrekaltinfiyati - sans1
					elseif rasgale >= 5 and rasgale <= 9 then
						ceyrekaltinfiyati = ceyrekaltinfiyati - sans2
					elseif rasgale >= 1 and rasgale <= 4 then
						ceyrekaltinfiyati = ceyrekaltinfiyati - sans3
					elseif rasgale == 0 then
						ceyrekaltinfiyati = ceyrekaltinfiyati - sans4
					end
					
						if uzerindekimiktar >= miktari+.0 then
							if xPlayer.canCarryItem("ceyrek_altin", miktari) then 
								xPlayer.addMoney(ceyrekaltinfiyati*miktari)
								xPlayer.removeInventoryItem('ceyrek_altin', miktari)
							else
								TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Üzerinizde Yeterli Yer Yok.', length = 3000})
							end
						else
							TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Üzerinizde Çeyrek Altın Yok.', length = 3000})
						end
				end
			end)
		elseif item == "Yarım Altın" then
			MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
				['@Name'] = "yarim_altin"
			}, function(result)
				for i=1, #result, 1 do
					yarimaltinfiyati = result[i].Fiyat
					local uzerindekimiktar = xPlayer.getInventoryItem('yarim_altin').count
					if rasgale == 30 then
						yarimaltinfiyati = yarimaltinfiyati + sans4
					elseif rasgale >= 26 and rasgale <= 29 then
						yarimaltinfiyati = yarimaltinfiyati + sans3
					elseif rasgale >= 21 and rasgale <= 25 then
						yarimaltinfiyati = yarimaltinfiyati + sans2
					elseif rasgale >= 16 and rasgale <= 20 then
						yarimaltinfiyati = yarimaltinfiyati + sans1
					elseif rasgale >= 10 and rasgale <= 14 then
						yarimaltinfiyati = yarimaltinfiyati - sans1
					elseif rasgale >= 5 and rasgale <= 9 then
						yarimaltinfiyati = yarimaltinfiyati - sans2
					elseif rasgale >= 1 and rasgale <= 4 then
						yarimaltinfiyati = yarimaltinfiyati - sans3
					elseif rasgale == 0 then
						yarimaltinfiyati = yarimaltinfiyati - sans4
					end
					
					if uzerindekimiktar >= miktari+.0 then
						if xPlayer.canCarryItem("yarim_altin", miktari) then 
							xPlayer.addMoney(yarimaltinfiyati*miktari)
							xPlayer.removeInventoryItem('yarim_altin', miktari)
						else
							TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Üzerinizde Yeterli Yer Yok.', length = 3000})
						end
					else
						TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Üzerinizde Yarım Altın Yok.', length = 3000})
					end
				end
			end)
		elseif item == "Tam Altın" then
			MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
				['@Name'] = "tam_altin"
			}, function(result)
				for i=1, #result, 1 do
					tamaltinfiyati = result[i].Fiyat
					local uzerindekimiktar = xPlayer.getInventoryItem('tam_altin').count
					
					if rasgale == 30 then
						tamaltinfiyati = tamaltinfiyati + sans4
					elseif rasgale >= 26 and rasgale <= 29 then
						tamaltinfiyati = tamaltinfiyati + sans3
					elseif rasgale >= 21 and rasgale <= 25 then
						tamaltinfiyati = tamaltinfiyati + sans2
					elseif rasgale >= 16 and rasgale <= 20 then
						tamaltinfiyati = tamaltinfiyati + sans1
					elseif rasgale >= 10 and rasgale <= 14 then
						tamaltinfiyati = tamaltinfiyati - sans1
					elseif rasgale >= 5 and rasgale <= 9 then
						tamaltinfiyati = tamaltinfiyati - sans2
					elseif rasgale >= 1 and rasgale <= 4 then
						tamaltinfiyati = tamaltinfiyati - sans3
					elseif rasgale == 0 then
						tamaltinfiyati = tamaltinfiyati - sans4
					end
					
					if uzerindekimiktar >= miktari+.0 then
						if xPlayer.canCarryItem("tam_altin", miktari) then 
							xPlayer.addMoney(tamaltinfiyati*miktari)
							xPlayer.removeInventoryItem('tam_altin', miktari)
						else
							TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Üzerinizde Yeterli Yer Yok.', length = 3000})
						end
					else
						TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Üzerinizde Tam Altın Yok.', length = 3000})
					end
				end
			end)
		elseif item == "Türk Lirası" then
			MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
				['@Name'] = "tl"
			}, function(result)
				for i=1, #result, 1 do
					tlfiyati = result[i].Fiyat
					local uzerindekimiktar = xPlayer.getInventoryItem('tl').count
					if rasgale == 30 then
						tlfiyati = tlfiyati - 3
					elseif rasgale >= 20 and rasgale <= 29 then
						tlfiyati = tlfiyati - 2
					elseif rasgale >= 16 and rasgale <= 19 then
						tlfiyati = tlfiyati - 1
					elseif rasgale >= 10 and rasgale <= 15 then
						tlfiyati = tlfiyati + 1
					elseif rasgale >= 1 and rasgale <= 9 then
						tlfiyati = tlfiyati + 2
					elseif rasgale == 0 then
						tlfiyati = tlfiyati + 3
					end
					
					if uzerindekimiktar >= miktari+.0 then
						if xPlayer.canCarryItem("tl", miktari) then 
							xPlayer.addMoney(tlfiyati*miktari)
							xPlayer.removeInventoryItem('tl', miktari)
						else
							TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Üzerinizde Yeterli Yer Yok.', length = 3000})
						end
					else
						TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Üzerinizde Türk Lirası Yok.', length = 3000})
					end
				end
			end)
		elseif item == "Euro" then
			MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
				['@Name'] = "euro"
			}, function(result)
				for i=1, #result, 1 do
					eurofiyati = result[i].Fiyat
					local uzerindekimiktar = xPlayer.getInventoryItem('euro').count
					if rasgale == 30 then
						eurofiyati = eurofiyati - 4
					elseif rasgale >= 20 and rasgale <= 29 then
						eurofiyati = eurofiyati - 3
					elseif rasgale >= 16 and rasgale <= 19 then
						eurofiyati = eurofiyati - 2
					elseif rasgale >= 10 and rasgale <= 15 then
						eurofiyati = eurofiyati + 2
					elseif rasgale >= 1 and rasgale <= 9 then
						eurofiyati = eurofiyati + 3
					elseif rasgale == 0 then
						eurofiyati = eurofiyati + 4
					end
					
					if uzerindekimiktar >= miktari+.0 then
						if xPlayer.canCarryItem("euro", miktari) then 
							xPlayer.addMoney(eurofiyati*miktari)
							xPlayer.removeInventoryItem('euro', miktari)
						else
							TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Üzerinizde Yeterli Yer Yok.', length = 3000})
						end
					else
						TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Üzerinizde Euro Lirası Yok.', length = 3000})
					end
				end
			end)
		elseif item == "Sterlin" then
			MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
				['@Name'] = "sterlin"
			}, function(result)
				for i=1, #result, 1 do
					sterlinfiyati = result[i].Fiyat
					local uzerindekimiktar = xPlayer.getInventoryItem('sterlin').count
					if rasgale == 30 then
						sterlinfiyati = sterlinfiyati - 4
					elseif rasgale >= 20 and rasgale <= 29 then
						sterlinfiyati = sterlinfiyati - 3
					elseif rasgale >= 16 and rasgale <= 19 then
						sterlinfiyati = sterlinfiyati - 2
					elseif rasgale >= 10 and rasgale <= 15 then
						sterlinfiyati = sterlinfiyati + 2
					elseif rasgale >= 1 and rasgale <= 9 then
						sterlinfiyati = sterlinfiyati + 3
					elseif rasgale == 0 then
						sterlinfiyati = sterlinfiyati + 4
					end
					
					if uzerindekimiktar >= miktari+.0 then
						if xPlayer.canCarryItem("sterlin", miktari) then 
							xPlayer.addMoney(sterlinfiyati*miktari)
							xPlayer.removeInventoryItem('sterlin', miktari)
						else
							TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Üzerinizde Yeterli Yer Yok.', length = 3000})
						end
					else
						TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Üzerinizde Sterlin Yok.', length = 3000})
					end
				end
			end)
		elseif item == "Tektaş Yüzük" then
			MySQL.Async.fetchAll('SELECT Fiyat FROM brkblnt_borsa WHERE Name = @Name', {
				['@Name'] = "tektas"
			}, function(result)
				for i=1, #result, 1 do
					tektasfiyati = result[i].Fiyat
					local uzerindekimiktar = xPlayer.getInventoryItem('tektas').count
					if rasgale == 30 then
						tektasfiyati = tektasfiyati + 773
					elseif rasgale >= 20 and rasgale <= 29 then
						tektasfiyati = tektasfiyati + 460
					elseif rasgale >= 16 and rasgale <= 19 then
						tektasfiyati = tektasfiyati + 211
					elseif rasgale >= 10 and rasgale <= 15 then
						tektasfiyati = tektasfiyati - 211
					elseif rasgale >= 1 and rasgale <= 9 then
						tektasfiyati = tektasfiyati - 460
					elseif rasgale == 0 then
						tektasfiyati = tektasfiyati - 773
					end
					
					if uzerindekimiktar >= miktari+.0 then
						if xPlayer.canCarryItem("tektas", miktari) then 
							xPlayer.addMoney(tektasfiyati*miktari)
							xPlayer.removeInventoryItem('tektas', miktari)
						else
							TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Üzerinizde Yeterli Yer Yok.', length = 3000})
						end
					else
						TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Üzerinizde Pırlanta Yok.', length = 3000})
					end
				end
			end)
		else
			print("HATA KONTROL : Esya Bulunamadı Eşya :" ..esya)
		end			
	end)


else
    print("=========================================")
    print("BU SCRIPT Burak Buluntu#0587 TARAFINDAN YAPILMISTIR")
    print("LISANS KIRILDIGI TESPIT EDILDI, SUNUCUN KAPATILACAK")
    print("=========================================")
	os.exit()
end