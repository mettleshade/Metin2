quest muratingotu_dungeon begin
	state start begin
		function setting()
		return {
				["base"]={["x"] = 3072  , ["y"]= 12032 ,},
				["bossroom_entry_pos"] = {8109,6867},
				["boss_pos"] = {686,637},
				["based"]				=		{["x"] = 550, ["y"]= 536},
				["floor_1"]				=		{["x"] = 87, ["y"] = 73},
				["floor_2"]				=		{["x"] = 256, ["y"] = 1145},
				["floor_3"]				=		{["x"] = 1115, ["y"] = 1076},
				["floor_4"]				=		{["x"] = 703, ["y"] = 385},
				["floor_5"]				=		{["x"] = 1000, ["y"] = 737},
				["final_boss"]		=		{["x"] = 74, ["y"] = 1103},
				["floor7_entry"] = {["x"] = 73, ["y"] = 1156},
				["devil_emperor"] = 2598,
				["devil_emperor_pos"] = {74,1103},
			}
		end

		when login begin
			if (pc.get_map_index() >= 3510000 and pc.get_map_index() < 3519999) then
				if pc.getqf("join_dungsasas") > 0 then
					pc.setqf("join_dungsasas", 0)
					d.zodiac_notice_clear()
					d.zodiac_notice("Merhaba Epsilon2'ye Özel Razador Katında Başlamış Bulunuyorsunuz !")
					d.setqf2("gir_dungsas","last_exit_time", get_global_time())
					d.setf("level", 1)
					server_loop_timer('murat4', 5, d.get_map_index())
					server_loop_timer("muratingotu_dungeon_end_first", 3, d.get_map_index())
				end
			end

			local idx = pc.get_map_index()
			if idx >= (351 * 10000) and idx < ((351 + 1) * 10000) then
				local level = d.getf("level")
			end

			if idx == 351 then
				pc.setf("gir_dungsas","last_exit_time", get_global_time())
				pc.warp(600400,706700)
			end
		end

		when logout begin
			local idx = pc.get_map_index()
			if idx == 351 or idx >= (351 * 10000) and idx < ((351 + 1) * 10000) then
				pc.setf("murat","dungeon_turn",1)
			end
		end

		when 20394.chat."Razadör Kulesi(Bireysel) " begin
			if party.is_party() then
				say_title_center("Razadör:")
				say_reward_center("Bu zindana grup halinde giremezsin")
				say_reward_center("lütfen önce bulundugun grupdan ayril !")
				return
			end

			say_title_center(mob_name(20394))
			addimage(35,35,'razador.tga')
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center("Razadör karanlık güçlerin ele")
			say_center("Geçirdiği Bir Diyardır. Giriş yapabilmek")
			say_center("için 100. seviyenin üzerinde olman gerekiyor.")
			say_center("")
			say_item(item_name(71175),71175, "")
			wait()
			say_title_center(mob_name(20394))
			addimage(35,35,'razador.tga')
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center(string.format("%s:", item_name(71175)))
			say_center("Giriş yaptığında eşya yok olacak. ")
			say_center("")
			say_reward_center("Devam etmek istiyor musun?")
			say_center("")
			local s = select("Evet", "Hayır")
			if s == 1 then
				if not pc.can_warp() then
					say_title_center(mob_name(20394))
					addimage(35,35,'razador.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Henüz ışınlanamazsın.")
					say_center("")
					return
				end

				if get_time() < pc.getqf("player_amsss_65") then
					say_title_center(mob_name(20394))
					addimage(35,35,'razador.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Soguma süren henüz dolmadi !")
					say_center("Kalan süre: "..dungeon_get_duration(pc.getqf("player_amsss_65") - get_global_time()).."")
					return
				end

				if pc.get_level() < 100 or pc.get_level() > 120 then
					say_title_center(mob_name(20394))
					addimage(35,35,'razador.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Giris yapmak için seviyen yetersiz.")
					say_center(string.format("Minimum Seviye: %d.",100))
					say_center(string.format("Maksimum Seviye: %d.",120))
					return
				end	
				
				if pc.count_item(71175) < 1 then
					say_title_center(mob_name(20394))
					addimage(35,35,'razador.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Envanterinde yeterli miktarda yok:")
					say_reward_center(string.format("%s.", item_name(71175)))
					say_center("")
					return
				end
				if game.get_event_flag("murat_dung_close") == 1 then
					say_title_center(mob_name(20394))
					addimage(35,35,'razador.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Razador Henüz Aktif Değil.")
					say_center("")
					return
				else
					pc.setqf("player_amsss_65", get_time()+60*60*1)
					pc.remove_item(71175, 1)
					pc.setqf("join_dungsasas", 1)
					d.new_jump(351, 8112 * 100, 6766 * 100)
				end
			end
		end
		
		when 20394.chat."Süre sıfırla " with pc.is_gm() begin
			local select_timer = select("Sıfırla", "Sıfırlama")
			if select_timer == 1 then
				pc.setqf("player_amsss_65", 0)
			end
		end

		when muratingotu_dungeon_end_first.server_timer begin
			if d.select(get_server_timer_arg()) then
				local setting = muratingotu_dungeon.setting()
				d.spawn_mob(6091,setting.boss_pos[1],setting.boss_pos[2])
				d.zodiac_notice_clear()
				d.zodiac_notice("Azraili Yok Ederek Bu Savaşı Kazanabilirsin !")
				clear_server_timer("muratingotu_dungeon_end_first",d.get_map_index())
			end	
		end

		when kill with npc.get_race() == 6091 and pc.get_map_index() >= 3510000 and pc.get_map_index() < 3519999 and d.getf("level") == 1 begin
			timer("exitmsh", 1*60)
			pc.setqf("join_dungsasas", 0)
			d.zodiac_notice_clear()
			d.zodiac_notice("Tebrikler Razadör'ü tamamladınız 1 dakika içerisinde dışarı gönderileceksin.")
		end

		when murat4.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindanı tamamlamak için 15 dakika vaktin kaldı.")
				server_loop_timer('murat5', 10*60,d.get_map_index())
				clear_server_timer("murat4",d.get_map_index())
			end
		end
		when murat5.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindanı tamamlamak için 5 dakika vaktin kaldı.")
				server_loop_timer('murat6', 4*60,d.get_map_index())
				clear_server_timer("murat5",d.get_map_index())
			end
		end

		when murat6.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindanı tamamlamak için 1 dakika vaktin kaldı.")
				server_loop_timer('muratend', 60,d.get_map_index())
				clear_server_timer("murat6",d.get_map_index())
			end
		end
		when muratend.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindanı tamamlamakta başarısız oldun. 10 saniye içerisinde dışarı ışınlanıyorsun.")
				server_loop_timer('muratfail', 10,d.get_map_index())
				clear_server_timer("muratend",d.get_map_index())
			end
		end
		when muratfail.server_timer begin
			if d.select(get_server_timer_arg()) then
				clear_server_timer("muratfail",d.get_map_index())
				d.exit_all_to_start_position()
			end
		end

		when exitmsh.timer begin
			d.setqf2("gir_dungsas","last_exit_time", get_global_time())
			d.exit_all_to_start_position()
		end
	end
end