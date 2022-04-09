quest sistem_yonetimi begin
	state start begin  
		when letter with pc.is_gm() begin
			send_letter("Sistem Yonetimi ")
		end
		when info or button begin
			if not pc.is_gm() then
				say_title("Sistem Yonetimi: ")
				say("")
				say("Yönetici deðilsiniz!")
				return
			end
			local sistemler = select(
				"Hýzlý Ýþlem Sistemi ", 
				"Sandýk Açma Sistemi ", 
				"Grand Hasar Dengeleme ", 
				"Perfect Hasar Dengeleme ", 
				"Sura Hasar Dengeleme ", 
				"Dengeleme Öðretmeni ", 
				"Ortalama Beceri Sistemi ", 
				"Paketli Bozdur Sistemi ", 
				"Vazgeç ")
			if sistemler == 1 then
				if game.get_event_flag("hizli_islem_sistemi") == 1 then
					a = "Açýk ";
				else
					a = "Kapalý "
				end
				say("Þuan Sistem : "..a.."")
				say("")
				local secenek1 = select ("Aç ", "Kapat ", "Vazgeç ")
				if secenek1 == 1 then
					game.set_event_flag("hizli_islem_sistemi", 1)
					say("Sistem Açýldý..")
				elseif secenek1 == 2 then
					game.set_event_flag("hizli_islem_sistemi", 0)
					say("Sistem Kapatýldý..")
				else
					return
				end
				send_letter("Sistem Yonetimi ")
			elseif sistemler == 2 then
				if game.get_event_flag("hizli_sandik_sistemi") == 1 then
					b = "Açýk ";
				else
					b = "Kapalý ";
				end
				say("Þuan Sistem : "..b.."")
				say("")
				local secenek2 = select ("Aç ", "Kapat ", "Vazgeç ")
				if secenek2 == 1 then
					game.set_event_flag("hizli_sandik_sistemi", 1)
					say("Sistem Açýldý..")
				elseif secenek2 == 2 then
					game.set_event_flag("hizli_sandik_sistemi", 0)
					say("Sistem Kapatýldý..")
				else
					return
				end
				send_letter("Sistem Yonetimi ")
			elseif sistemler == 3 then
				if game.get_event_flag("grand_guc_durum") == 1 then
					b = "Açýk ";
				else
					b = "Kapalý ";
				end
				say("Þuan Sistem : "..b.."")
				say("")
				local secenek2 = select ("Aç ", "Kapat ", "Vazgeç ")
				if secenek2 == 1 then
					game.set_event_flag("grand_guc_durum", 1)
					say("Sistem Açýldý..")
				elseif secenek2 == 2 then
					game.set_event_flag("grand_guc_durum", 0)
					say("Sistem Kapatýldý..")
				else
					return
				end
				send_letter("Sistem Yonetimi ")
			elseif sistemler == 4 then
				if game.get_event_flag("perfect_guc_durum") == 1 then
					b = "Açýk ";
				else
					b = "Kapalý ";
				end
				say("Þuan Sistem : "..b.."")
				say("")
				local secenek2 = select ("Aç ", "Kapat ", "Vazgeç ")
				if secenek2 == 1 then
					game.set_event_flag("perfect_guc_durum", 1)
					say("Sistem Açýldý..")
				elseif secenek2 == 2 then
					game.set_event_flag("perfect_guc_durum", 0)
					say("Sistem Kapatýldý..")
				else
					return
				end
				send_letter("Sistem Yonetimi ")
			elseif sistemler == 5 then
				if game.get_event_flag("sura_guc_durum") == 1 then
					b = "Açýk ";
				else
					b = "Kapalý ";
				end
				say("Þuan Sistem : "..b.."")
				say("")
				local secenek2 = select ("Aç ", "Kapat ", "Vazgeç ")
				if secenek2 == 1 then
					game.set_event_flag("sura_guc_durum", 1)
					say("Sistem Açýldý..")
				elseif secenek2 == 2 then
					game.set_event_flag("sura_guc_durum", 0)
					say("Sistem Kapatýldý..")
				else
					return
				end
				send_letter("Sistem Yonetimi ")
			elseif sistemler == 6 then
				if game.get_event_flag("dengeleme_ogretmen_durum") == 1 then
					b = "Açýk ";
				else
					b = "Kapalý ";
				end
				say("Þuan Sistem : "..b.."")
				say("")
				local secenek2 = select ("Aç ", "Kapat ", "Vazgeç ")
				if secenek2 == 1 then
					game.set_event_flag("dengeleme_ogretmen_durum", 1)
					say("Sistem Açýldý..")
				elseif secenek2 == 2 then
					game.set_event_flag("dengeleme_ogretmen_durum", 0)
					say("Sistem Kapatýldý..")
				else
					return
				end
				send_letter("Sistem Yonetimi ")
			elseif sistemler == 7 then
				if game.get_event_flag("ortalama_beceri_sistemi") == 1 then
					b = "Açýk ";
				else
					b = "Kapalý ";
				end
				say("Þuan Sistem : "..b.."")
				say("")
				local secenek2 = select ("Aç ", "Kapat ", "Vazgeç ")
				if secenek2 == 1 then
					game.set_event_flag("ortalama_beceri_sistemi", 1)
					say("Sistem Açýldý..")
				elseif secenek2 == 2 then
					game.set_event_flag("ortalama_beceri_sistemi", 0)
					say("Sistem Kapatýldý..")
				else
					return
				end
				send_letter("Sistem Yonetimi ")
			elseif sistemler == 8 then
				if game.get_event_flag("paketleme_sistemi") == 1 then
					b = "Açýk ";
				else
					b = "Kapalý ";
				end
				say("Þuan Sistem : "..b.."")
				say("")
				local secenek2 = select ("Aç ", "Kapat ", "Vazgeç ")
				if secenek2 == 1 then
					game.set_event_flag("paketleme_sistemi", 1)
					say("Sistem Açýldý..")
				elseif secenek2 == 2 then
					game.set_event_flag("paketleme_sistemi", 0)
					say("Sistem Kapatýldý..")
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