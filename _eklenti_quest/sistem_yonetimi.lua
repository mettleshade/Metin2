quest sistem_yonetimi begin
	state start begin  
		when letter with pc.is_gm() begin
			send_letter("Sistem Yonetimi ")
		end
		when info or button begin
			if not pc.is_gm() then
				say_title("Sistem Yonetimi: ")
				say("")
				say("Y�netici de�ilsiniz!")
				return
			end
			local sistemler = select(
				"H�zl� ��lem Sistemi ", 
				"Sand�k A�ma Sistemi ", 
				"Grand Hasar Dengeleme ", 
				"Perfect Hasar Dengeleme ", 
				"Sura Hasar Dengeleme ", 
				"Dengeleme ��retmeni ", 
				"Ortalama Beceri Sistemi ", 
				"Paketli Bozdur Sistemi ", 
				"Vazge� ")
			if sistemler == 1 then
				if game.get_event_flag("hizli_islem_sistemi") == 1 then
					a = "A��k ";
				else
					a = "Kapal� "
				end
				say("�uan Sistem : "..a.."")
				say("")
				local secenek1 = select ("A� ", "Kapat ", "Vazge� ")
				if secenek1 == 1 then
					game.set_event_flag("hizli_islem_sistemi", 1)
					say("Sistem A��ld�..")
				elseif secenek1 == 2 then
					game.set_event_flag("hizli_islem_sistemi", 0)
					say("Sistem Kapat�ld�..")
				else
					return
				end
				send_letter("Sistem Yonetimi ")
			elseif sistemler == 2 then
				if game.get_event_flag("hizli_sandik_sistemi") == 1 then
					b = "A��k ";
				else
					b = "Kapal� ";
				end
				say("�uan Sistem : "..b.."")
				say("")
				local secenek2 = select ("A� ", "Kapat ", "Vazge� ")
				if secenek2 == 1 then
					game.set_event_flag("hizli_sandik_sistemi", 1)
					say("Sistem A��ld�..")
				elseif secenek2 == 2 then
					game.set_event_flag("hizli_sandik_sistemi", 0)
					say("Sistem Kapat�ld�..")
				else
					return
				end
				send_letter("Sistem Yonetimi ")
			elseif sistemler == 3 then
				if game.get_event_flag("grand_guc_durum") == 1 then
					b = "A��k ";
				else
					b = "Kapal� ";
				end
				say("�uan Sistem : "..b.."")
				say("")
				local secenek2 = select ("A� ", "Kapat ", "Vazge� ")
				if secenek2 == 1 then
					game.set_event_flag("grand_guc_durum", 1)
					say("Sistem A��ld�..")
				elseif secenek2 == 2 then
					game.set_event_flag("grand_guc_durum", 0)
					say("Sistem Kapat�ld�..")
				else
					return
				end
				send_letter("Sistem Yonetimi ")
			elseif sistemler == 4 then
				if game.get_event_flag("perfect_guc_durum") == 1 then
					b = "A��k ";
				else
					b = "Kapal� ";
				end
				say("�uan Sistem : "..b.."")
				say("")
				local secenek2 = select ("A� ", "Kapat ", "Vazge� ")
				if secenek2 == 1 then
					game.set_event_flag("perfect_guc_durum", 1)
					say("Sistem A��ld�..")
				elseif secenek2 == 2 then
					game.set_event_flag("perfect_guc_durum", 0)
					say("Sistem Kapat�ld�..")
				else
					return
				end
				send_letter("Sistem Yonetimi ")
			elseif sistemler == 5 then
				if game.get_event_flag("sura_guc_durum") == 1 then
					b = "A��k ";
				else
					b = "Kapal� ";
				end
				say("�uan Sistem : "..b.."")
				say("")
				local secenek2 = select ("A� ", "Kapat ", "Vazge� ")
				if secenek2 == 1 then
					game.set_event_flag("sura_guc_durum", 1)
					say("Sistem A��ld�..")
				elseif secenek2 == 2 then
					game.set_event_flag("sura_guc_durum", 0)
					say("Sistem Kapat�ld�..")
				else
					return
				end
				send_letter("Sistem Yonetimi ")
			elseif sistemler == 6 then
				if game.get_event_flag("dengeleme_ogretmen_durum") == 1 then
					b = "A��k ";
				else
					b = "Kapal� ";
				end
				say("�uan Sistem : "..b.."")
				say("")
				local secenek2 = select ("A� ", "Kapat ", "Vazge� ")
				if secenek2 == 1 then
					game.set_event_flag("dengeleme_ogretmen_durum", 1)
					say("Sistem A��ld�..")
				elseif secenek2 == 2 then
					game.set_event_flag("dengeleme_ogretmen_durum", 0)
					say("Sistem Kapat�ld�..")
				else
					return
				end
				send_letter("Sistem Yonetimi ")
			elseif sistemler == 7 then
				if game.get_event_flag("ortalama_beceri_sistemi") == 1 then
					b = "A��k ";
				else
					b = "Kapal� ";
				end
				say("�uan Sistem : "..b.."")
				say("")
				local secenek2 = select ("A� ", "Kapat ", "Vazge� ")
				if secenek2 == 1 then
					game.set_event_flag("ortalama_beceri_sistemi", 1)
					say("Sistem A��ld�..")
				elseif secenek2 == 2 then
					game.set_event_flag("ortalama_beceri_sistemi", 0)
					say("Sistem Kapat�ld�..")
				else
					return
				end
				send_letter("Sistem Yonetimi ")
			elseif sistemler == 8 then
				if game.get_event_flag("paketleme_sistemi") == 1 then
					b = "A��k ";
				else
					b = "Kapal� ";
				end
				say("�uan Sistem : "..b.."")
				say("")
				local secenek2 = select ("A� ", "Kapat ", "Vazge� ")
				if secenek2 == 1 then
					game.set_event_flag("paketleme_sistemi", 1)
					say("Sistem A��ld�..")
				elseif secenek2 == 2 then
					game.set_event_flag("paketleme_sistemi", 0)
					say("Sistem Kapat�ld�..")
				else
					return
				end
				send_letter("Sistem Yonetimi ")
			else
				send_letter("Sistem Yonetimi ")
				return
			end
		end
	end
end