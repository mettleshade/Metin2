quest paketle_boz begin
	state start begin
		function kodlar()
			return
			{
				["cor"] = 50260,
				["bar5m"] = 80007,
				
				--paketler
				
				["cor_paket"] = 55048,
				["zenpaket"] = 42351,
				["ruhpaket"] = 42353
			};
		end
		when letter begin
			send_letter("Paketle - Bozdur ")
		end
		when info or button begin
			if game.get_event_flag("paketleme_sistemi") == 0 then
				say_reward("Þžuan sistem kapalýdýr...")
				return
			end
			local kod = paketle_boz.kodlar()
			
			local secenek = select (
				"Cor Paketle (1.000) ", 
				"Cor Paketle (10.000) ", 
				"Zen - Ruh Takasý (1.000) ", 
				"Zen - Ruh Takasý (10.000) ", 
				"5M Bar Bozdur (10.000) ", 
				"Vazgeç ")
				
			if secenek == 1 then
				if pc.count_item(kod["cor"]) > 999 then
					pc.remove_item(kod["cor"], 1000)
					pc.give_item2(kod["cor_paket"], 1)
					
					syschat("10.000 Cor paketlenmiþtir.")
				else
					syschat("Yeterli sayýda cor bulunamadý. Gerekli : 1.000")
					return
				end
				send_letter("Paketle - Bozdur ")
			elseif secenek == 2 then
				if pc.count_item(kod["cor"]) > 9999 then
					pc.remove_item(kod["cor"], 10000)
					pc.give_item2(kod["cor_paket"], 10)
					
					syschat("10.000 Cor paketlenmiþtir.")
				else
					syschat("Yeterli sayýda cor bulunamadý. Gerekli : 10.000")
					return
				end
				send_letter("Paketle - Bozdur ")
			elseif secenek == 3 then
				if pc.count_item(kod["zenpaket"]) > 0 then
					pc.remove_item(kod["zenpaket"], 1)
					pc.give_item2(kod["ruhpaket"], 1)
					syschat("Takas gerçekleþmiþtir..")
				else
					syschat("Yeterli sayýda zen paketi bulunamadý. Gerekli : 1")
					return
				end
				send_letter("Paketle - Bozdur ")
			elseif secenek == 4 then
				if pc.count_item(kod["zenpaket"]) > 9 then
					pc.remove_item(kod["zenpaket"], 10)
					pc.give_item2(kod["ruhpaket"], 10)
					syschat("Takas gerçekleþmiþtir..")
				else
					syschat("Yeterli sayýda zen paketi bulunamadý. Gerekli : 10")
					return
				end
				send_letter("Paketle - Bozdur ")
			elseif secenek == 5 then
				if pc.count_item(kod["bar5m"]) > 9999 then
					if pc.get_cheque() <= 29499 then
						pc.remove_item(kod["bar5m"], 10000)
						pc.change_cheque(500)
						syschat("10.000 Bar Bozdurulmuþtur.")
					else
						syschat("Envanterindeki en fazla 30Bin won olabilir. Gerekli : 10.000")
						return
					end
				else
					syschat("Yeterli sayýda bar bulunamadý.")
					return
				end
				send_letter("Paketle - Bozdur ")
			else
				return
			end	
		end	
	end	
end	
