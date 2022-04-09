quest map_yonetimi begin
	state start begin  
		when letter with pc.is_gm() begin
			send_letter("Map Yonetimi ")
		end
		when info or button begin
			if not pc.is_gm() then
				say_title("Map Yonetimi: ")
				say("")
				say("Y�netici de�ilsiniz!")
				return
			end
			local maplar = select(
				"Krallar Vadisi ", 
				"Enfekte Orman ", 
				"Paskalya Adas� ", 
				"Ganeshta Tap�nag� ", 
				"Antik Piramit ", 
				"Enfekte Orman 2 ", 
				"Vazge� ")
			if maplar == 1 then
				if game.get_event_flag("krallar_vadisi") == 1 then
					a = "A��k ";
				else
					a = "Kapal� "
				end
				say("�uan Map : "..a.."")
				say("")
				local secenek1 = select ("A� ", "Kapat ", "Vazge� ")
				if secenek1 == 1 then
					game.set_event_flag("krallar_vadisi", 1)
					say("Map A��ld�..")
					send_letter("Map Yonetimi ")
				elseif secenek1 == 2 then
					game.set_event_flag("krallar_vadisi", 0)
					say("Map Kapat�ld�..")
					send_letter("Map Yonetimi ")
				else
					return
				end
			elseif maplar == 2 then
				if game.get_event_flag("enfekte_orman") == 1 then
					a = "A��k ";
				else
					a = "Kapal� "
				end
				say("�uan Map : "..a.."")
				say("")
				local secenek2 = select ("A� ", "Kapat ", "Vazge� ")
				if secenek2 == 1 then
					game.set_event_flag("enfekte_orman", 1)
					say("Map A��ld�..")
					send_letter("Map Yonetimi ")
				elseif secenek2 == 2 then
					game.set_event_flag("enfekte_orman", 0)
					say("Map Kapat�ld�..")
					send_letter("Map Yonetimi ")
				else
					return
				end
			elseif maplar == 3 then
				if game.get_event_flag("paskalya_adasi") == 1 then
					a = "A��k ";
				else
					a = "Kapal� "
				end
				say("�uan Map : "..a.."")
				say("")
				local secenek3 = select ("A� ", "Kapat ", "Vazge� ")
				if secenek3 == 1 then
					game.set_event_flag("paskalya_adasi", 1)
					say("Map A��ld�..")
					send_letter("Map Yonetimi ")
				elseif secenek3 == 2 then
					game.set_event_flag("paskalya_adasi", 0)
					say("Map Kapat�ld�..")
					send_letter("Map Yonetimi ")
				else
					return
				end
			elseif maplar == 4 then
				if game.get_event_flag("ganesha_tapinagi") == 1 then
					a = "A��k ";
				else
					a = "Kapal� "
				end
				say("�uan Map : "..a.."")
				say("")
				local secenek3 = select ("A� ", "Kapat ", "Vazge� ")
				if secenek3 == 1 then
					game.set_event_flag("ganesha_tapinagi", 1)
					say("Map A��ld�..")
					send_letter("Map Yonetimi ")
				elseif secenek3 == 2 then
					game.set_event_flag("ganesha_tapinagi", 0)
					say("Map Kapat�ld�..")
					send_letter("Map Yonetimi ")
				else
					return
				end
			elseif maplar == 5 then
				if game.get_event_flag("antik_piramid") == 1 then
					a = "A��k ";
				else
					a = "Kapal� "
				end
				say("�uan Map : "..a.."")
				say("")
				local secenek3 = select ("A� ", "Kapat ", "Vazge� ")
				if secenek3 == 1 then
					game.set_event_flag("antik_piramid", 1)
					say("Map A��ld�..")
					send_letter("Map Yonetimi ")
				elseif secenek3 == 2 then
					game.set_event_flag("antik_piramid", 0)
					say("Map Kapat�ld�..")
					send_letter("Map Yonetimi ")
				else
					return
				end
			elseif maplar == 6 then
				if game.get_event_flag("enfekte_orman2") == 1 then
					a = "A��k ";
				else
					a = "Kapal� "
				end
				say("�uan Map : "..a.."")
				say("")
				local secenek3 = select ("A� ", "Kapat ", "Vazge� ")
				if secenek3 == 1 then
					game.set_event_flag("enfekte_orman2", 1)
					say("Map A��ld�..")
					send_letter("Map Yonetimi ")
				elseif secenek3 == 2 then
					game.set_event_flag("enfekte_orman2", 0)
					say("Map Kapat�ld�..")
					send_letter("Map Yonetimi ")
				else
					return
				end
			else
				return
			end
		end
	end
end