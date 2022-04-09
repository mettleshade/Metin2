quest dengeleme_ogretmen begin
	state start begin
		when 9338.take with item.get_vnum() == 42205 or item.get_vnum() == 42206 or item.get_vnum() == 42211 begin
			
			if game.get_event_flag("dengeleme_ogretmen_durum") == 0 then
				syschat("Sistem �uanda devred���...")
				return
			end
			
			if item.get_vnum() == 42205 then
				if pc.getqf("grand_ek_guc") == 1 then
					syschat("Dengeleme g�c�n� kapatt�ktan sonra tekrar dene.")
					return
				else
					if pc.count_item(42206) > 0 then
						syschat("Zaten envanterinde Perfect Dengeleme Y�z�g�n� g�r�yorum.")
						return
					end
					
					if pc.count_item(50513) < 50 or pc.count_item(70102) < 500 then
						say_title ("Dengeleme G�c� ��retmeni")say ("")
						say ("Bu i�lemi yapabilmem i�in bu nesnelere sahip olmal�s�n :")
						say ("")
						say_item(item_name(50513).." x50",50513, "")
						say_item(item_name(70102).." x500",70102, "")
						say ("")
					elseif pc.count_item(50513) > 49 and pc.count_item(70102) > 499 then
						say_title ("Dengeleme G�c� ��retmeni")say ("")
						say_reward ("Grand Dengeleme G�c�n� d�n��t�rmeyi onayl�yor musun ?")say ("")say ("")
						wait()
						--İTEMİ VER
						if pc.count_item(42206) == 0 then
							pc.remove_item(50513, 50)
							pc.remove_item(70102, 500)
							pc.remove_item(42205, 1)
							pc.give_item2(42206, 1)
						else
							say ("Zaten envanterinde bu itemi g�r�yorum !!")
							return
						end
					end
				end
			elseif item.get_vnum() == 42206 then
				syschat("�an elinizdeki dengeleme y�z�g� en son y�z�kt�r daha ilerisi bulunmamaktad�r..")
				return
			elseif item.get_vnum() == 42211 then
				syschat("Suralara �zel tek itemi kullan�yorsunuz, daha ilerisi bulunmamaktad�r.")
				return
			end
		end
	end
end