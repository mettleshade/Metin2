quest dengeleme_ogretmen begin
	state start begin
		when 9338.take with item.get_vnum() == 42205 or item.get_vnum() == 42206 or item.get_vnum() == 42211 begin
			
			if game.get_event_flag("dengeleme_ogretmen_durum") == 0 then
				syschat("Sistem þuanda devredýþý...")
				return
			end
			
			if item.get_vnum() == 42205 then
				if pc.getqf("grand_ek_guc") == 1 then
					syschat("Dengeleme gücünü kapattýktan sonra tekrar dene.")
					return
				else
					if pc.count_item(42206) > 0 then
						syschat("Zaten envanterinde Perfect Dengeleme Yüzügünü görüyorum.")
						return
					end
					
					if pc.count_item(50513) < 50 or pc.count_item(70102) < 500 then
						say_title ("Dengeleme Gücü Öðretmeni")say ("")
						say ("Bu iþlemi yapabilmem için bu nesnelere sahip olmalýsýn :")
						say ("")
						say_item(item_name(50513).." x50",50513, "")
						say_item(item_name(70102).." x500",70102, "")
						say ("")
					elseif pc.count_item(50513) > 49 and pc.count_item(70102) > 499 then
						say_title ("Dengeleme Gücü Öðretmeni")say ("")
						say_reward ("Grand Dengeleme Gücünü dönüþtürmeyi onaylýyor musun ?")say ("")say ("")
						wait()
						--Ä°TEMÄ° VER
						if pc.count_item(42206) == 0 then
							pc.remove_item(50513, 50)
							pc.remove_item(70102, 500)
							pc.remove_item(42205, 1)
							pc.give_item2(42206, 1)
						else
							say ("Zaten envanterinde bu itemi görüyorum !!")
							return
						end
					end
				end
			elseif item.get_vnum() == 42206 then
				syschat("Þan elinizdeki dengeleme yüzügü en son yüzüktür daha ilerisi bulunmamaktadýr..")
				return
			elseif item.get_vnum() == 42211 then
				syschat("Suralara özel tek itemi kullanýyorsunuz, daha ilerisi bulunmamaktadýr.")
				return
			end
		end
	end
end