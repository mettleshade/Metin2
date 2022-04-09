quest nemere_dungeon begin
	state start begin
		function setting()
		return {
				["base"]={["x"] = 3072  , ["y"]= 12032 ,},
				["bossroom_entry_pos"] = {8109,6867},
				["based"]				=		{["x"] = 550, ["y"]= 536},
				["floor_1"]				=		{["x"] = 87, ["y"] = 73},
				["floor_2"]				=		{["x"] = 256, ["y"] = 1145},
				["floor_3"]				=		{["x"] = 1115, ["y"] = 1076},
				["floor_4"]				=		{["x"] = 703, ["y"] = 385},
				["floor_5"]				=		{["x"] = 1000, ["y"] = 737},
				["final_boss"]		=		{["x"] = 74, ["y"] = 1103},
				["floor7_entry"] = {["x"] = 73, ["y"] = 1156},
				["devil_emperors"] = 6191,
				["devil_emperor_poss"] = {928,335},
			}
		end

		when login begin
			if (pc.get_map_index() >= 3520000 and pc.get_map_index() < 3529999) then
				if pc.getqf("cikss_dung_time") > 0 then
					pc.setqf("cikss_dung_time", 0)
					d.zodiac_notice_clear()
					d.zodiac_notice("Merhaba Epsilon2'ye �zel Direkt Nemere Kat�nda Ba�lam�� Bulunuyorsunuz !")
					d.setqf2("lis_dung","last_exit_time", get_global_time())
					d.setf("level", 1)
					server_loop_timer('emre4', 5, d.get_map_index())
					server_loop_timer("emreingotu_dungeon_end_first", 3, d.get_map_index())
				end
			end

			local idx = pc.get_map_index()
			if idx >= (352 * 10000) and idx < ((352 + 1) * 10000) then
				local level = d.getf("level")
			end

			if idx == 352 then
				pc.setf("lis_dung","last_exit_time", get_global_time())
				pc.warp(432000,165000)
			end
		end

		when logout begin
			local idx = pc.get_map_index()
			if idx == 352 or idx >= (352 * 10000) and idx < ((352 + 1) * 10000) then
				pc.setf("emre","dungeon_turn",1)
			end
		end

		when 20395.chat."Nemere'nin Kulesi (Bireysel) " begin
			if party.is_party() then
				say_title_center("Nemere:")
				say_reward_center("Bu zindana grup halinde giremezsin")
				say_reward_center("l�tfen �nce bulundugun grupdan ayril !")
				return
			end

			say_title_center(mob_name(20395))
			addimage(35,35,'nemere.tga')
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center("Nemere karanl�k g��lerin ele")
			say_center("Ge�irdi�i Bir Diyard�r. Giri� yapabilmek")
			say_center("i�in 100. seviyenin �zerinde olman gerekiyor.")
			say_center("")
			say_item(item_name(71174),71174, "")
			wait()
			say_title_center(mob_name(20395))
			addimage(35,35,'nemere.tga')
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center(string.format("%s:", item_name(71174)))
			say_center("Giri� yapt���nda e�ya yok olacak. ")
			say_center("")
			say_reward_center("Devam etmek istiyor musun?")
			say_center("")
			local s = select("Evet", "Hay�r")
			if s == 1 then
				if not pc.can_warp() then
					say_title_center(mob_name(20395))
					addimage(35,35,'nemere.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Hen�z ���nlanamazs�n.")
					say_center("")
					return
				end

				if get_time() < pc.getqf("nemere_giris_zamani") then
					say_title_center(mob_name(20395))
					addimage(35,35,'nemere.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Soguma s�ren hen�z dolmadi !")
					say_center("Kalan s�re: "..dungeon_get_duration(pc.getqf("nemere_giris_zamani") - get_global_time()).."")
					return
				end

				if pc.get_level() < 90 or pc.get_level() > 120 then
					say_title_center(mob_name(20395))
					addimage(35,35,'nemere.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Giris yapmak i�in seviyen yetersiz.")
					say_center(string.format("Minimum Seviye: %d.",90))
					say_center(string.format("Maksimum Seviye: %d.",120))
					return
				end	
				
				if pc.count_item(71174) < 1 then
					say_title_center(mob_name(20395))
					addimage(35,35,'nemere.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Envanterinde yeterli miktarda yok:")
					say_reward_center(string.format("%s.", item_name(71174)))
					say_center("")
					return
				end
				if game.get_event_flag("emre_dung_close") == 1 then
					say_title_center(mob_name(20395))
					addimage(35,35,'nemere.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Nemere Hen�z Aktif De�il.")
					say_center("")
					return
				else
					pc.setqf("nemere_giris_zamani", get_time()+60*60*1)
					pc.remove_item(71174, 1)
					pc.setqf("cikss_dung_time", 1)
					d.new_jump(352, 6047 * 100, 1927 * 100)
				end
			end
		end
		
		when 20395.chat."S�re s�f�rla " with pc.is_gm() begin
			local select_timer = select("S�f�rla", "S�f�rlama")
			if select_timer == 1 then
				pc.setqf("nemere_giris_zamani", 0)
			end
		end

		when emreingotu_dungeon_end_first.server_timer begin
			if d.select(get_server_timer_arg()) then
				local setting = nemere_dungeon.setting()
				d.spawn_mob (setting.devil_emperors, setting.devil_emperor_poss[1], setting.devil_emperor_poss[2])
				d.zodiac_notice_clear()
				d.zodiac_notice("Ayaz�n ve buzun kral� Nemere'yi ma�lup edin.")
				clear_server_timer("emreingotu_dungeon_end_first",d.get_map_index())
			end	
		end

		when kill with npc.get_race() == 6191 and pc.get_map_index() >= 3520000 and pc.get_map_index() < 3529999 and d.getf("level") == 1 begin
			timer("exitmsh", 1*60)
			d.zodiac_notice_clear()
			pc.setqf("cikss_dung_time", 0)
			d.zodiac_notice("Tebrikler Nemere'yi tamamlad�n�z 1 dakika i�erisinde d��ar� g�nderileceksin.")
		end

		when emre4.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindan� tamamlamak i�in 10 dakika vaktin kald�.")
				server_loop_timer('emre5', 10*60,d.get_map_index())
				clear_server_timer("emre4",d.get_map_index())
			end
		end
		when emre5.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindan� tamamlamak i�in 5 dakika vaktin kald�.")
				server_loop_timer('emre6', 5*60,d.get_map_index())
				clear_server_timer("emre5",d.get_map_index())
			end
		end

		when emre6.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindan� tamamlamak i�in 1 dakika vaktin kald�.")
				server_loop_timer('emreend', 60,d.get_map_index())
				clear_server_timer("emre6",d.get_map_index())
			end
		end
		when emreend.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindan� tamamlamakta ba�ar�s�z oldun. 10 saniye i�erisinde d��ar� ���nlan�yorsun.")
				server_loop_timer('emrefail', 10,d.get_map_index())
				clear_server_timer("emreend",d.get_map_index())
			end
		end
		when emrefail.server_timer begin
			if d.select(get_server_timer_arg()) then
				clear_server_timer("emrefail",d.get_map_index())
				d.exit_all_to_start_position()
			end
		end

		when exitmsh.timer begin
			d.setqf2("lis_dung","last_exit_time", get_global_time())
			d.exit_all_to_start_position()
		end
	end
end