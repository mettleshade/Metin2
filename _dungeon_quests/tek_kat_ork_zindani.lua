quest ork_maze begin
	state start begin
		when 20403.chat."Ork Zindanı " begin
			addimage(35,35,'orklabi.tga')
			if party.is_leader() or party.is_party() then
				say_reward_center("Bu zindana grup halinde giremezsin")
				say_reward_center("lütfen önce bulundugun grupdan ayril !")
				return
			end
			-- sys_log(0,"ork_maze quest open")

			say_title_center(mob_name(20403))
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center("Ork Zindanı yeraltındaki en tehlikeli[ENTER]yaratıkların bulundugu bir yeraltı zindanı[ENTER]giriş yapabilmek için 40 ila 70 seviye arasında olman gerekiyor")
			say_item(item_name(90005),90005, "")
			wait()
			say_title_center(mob_name(20403))
			addimage(35,35,'orklabi.tga')
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center("Giriş yaptığında eşya yok olacak. ")
			say_center("")
			say_reward_center("Devam etmek istiyor musun?")
			say_center("")
			local s = select("Evet", "Hayır")
			-- ------------ Dungeon Turn Back System ----------------------
			-- pc.remove_turn_back_dungeon()
			-- ------------------------------------------------------------
			if s == 1 then
				if not pc.can_warp() then
					say_title_center(mob_name(20403))
					addimage(35,35,'orklabi.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Henüz ışınlanamazsın.")
					say_center("")
					return
				elseif pc.count_item(90005) < 1 then
					say_title_center(mob_name(20403))
					addimage(35,35,'orklabi.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Envanterinde yeterli miktarda yok:")
					say_center(string.format("%s.", item_name(90005)))
					say_center("")
					return
				elseif pc.level < 40 or pc.level > 75 then
					say_title_center(mob_name(20403))
					addimage(35,35,'orklabi.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Seviyen giriş gereksinimlerini karşılamıyor. ")
					say_center("Gereksinimler:")
					say_center(string.format("Minimum Seviye: %d.",40))
					say_center(string.format("Maksimum Seviye: %d.",75))
					say_center("")
					return
				elseif get_time() < pc.getqf("ork_player_time_110") then
					say_title_center(mob_name(20403))
					addimage(35,35,'orklabi.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Soguma sureniz henuz dolmadi!")
					say_center("Kalan süre: "..dungeon_get_duration(pc.getqf("ork_player_time_110") - get_global_time()).."")
					say_center("")
					if pc.is_gm() then
						say_center("Beta Server; süreyi sıfırlamak mı istiyorsun?")
						if select("Evet","Hayır") == 1 then
							pc.setqf("ork_player_time_110",0)
							return
						end
					end
					return
				elseif game.get_event_flag("enable_orcmaze_dungeon") == 1 then
					say_title_center(mob_name(20403))
					addimage(35,35,'orklabi.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Ork Zindanı henüz aktif durumda değildir.")
					say_center("")
					return
				else
					pc.remove_item(90005, 1)
					pc.setqf("ork_player_time_110", get_time()+60*45)
					pc.setqf("join_orcmaze_dung", 1)
					d.new_jump (245, 12170 * 100, 8102 * 100)
				end
			end
		end

		--d.MapControl
		when login with pc.get_map_index() == 245 begin
			pc.set_warp_location(67, 2894, 66)
			d.exit()
		end
		
		when logout with pc.get_map_index() >= 2450000 and pc.get_map_index() < 2459999 begin
			------------ Dungeon Turn Back System ----------------------
			pc.setf("ork_maze","dungeon_turn",1)
			------------------------------------------------------------
		end

		--d.FloorOne
		when login with pc.get_map_index() >= 2450000 and pc.get_map_index() < 2460000 begin
			if pc.getqf("join_orcmaze_dung") > 0 then
				pc.setqf("join_orcmaze_dung", 0)
				d.setqf2("orcmaze_dungeon","last_exit_time", get_global_time())
				d.setf("floor_four_finish", 1)
				d.clear_regen()
				d.kill_all()
				d.zodiac_notice_clear()
				d.zodiac_notice("Merhaba Epsilon2'ye Özel Kristal Zindanına Hoşgeldin. 10 Dakika zamanın var.")
				server_timer('orcfloor4_eli_check_timer', 5,d.get_map_index())
			end
			--cmdchat("OpenMidgardCoolTime")
		end

		when orcfloor4_eli_check_timer.server_timer begin
			if d.select(get_server_timer_arg()) then
				if d.getf("floor_four_finish") == 1 then
					d.regen_file("data/dungeon/orcmaze/regen_boss.txt")
					server_timer('orclogintime4', 5,d.get_map_index())
					clear_server_timer("orcfloor4_eli_check_timer",d.get_map_index())
				end
			end
		end
		
		when kill with pc.get_map_index() >= 2450000 and pc.get_map_index() < 2460000 and npc.get_race() == 694 begin
			d.setf("floor_boss_finish", 1)
			d.clear_regen()
			d.kill_all()
			d.zodiac_notice_clear()
			pc.setqf("join_orcmaze_dung", 0)
			d.zodiac_notice("Ork Zindanını Yok Ettiniz! 3 Dakika Sonra Dışarı Gönderileceksiniz.")
			timer('exit_orkmaze', 60*3)
		end

		when orclogintime4.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindanı tamamlamak için 10 dakika vaktiniz kaldı.")
				server_timer('orclogintime5', 10*60,d.get_map_index())
			end
		end
		when orclogintime5.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindanı tamamlamak için 5 dakika vaktiniz kaldı.")
				server_timer('orclogintime6', 5*60,d.get_map_index())
			end
		end

		when orclogintime6.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindanı tamamlamak için 1 dakika vaktiniz kaldı.")
				server_timer('orclogintimeend', 60,d.get_map_index())
			end
		end
		when orclogintimeend.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindanı tamamlamakta başarısız oldun. 5 saniye içerisinde dışarı ışınlanıyorsunuz.")
				server_timer('orctimefail', 5,d.get_map_index())
			end
		end
		when orctimefail.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.exit_all_to_start_position()
			end
		end

		when exit_orkmaze.timer begin
			d.setqf2("orcmaze_dungeon","last_exit_time", get_global_time())
			d.exit_all_to_start_position()
		end
		--d.TimerControl
	end
end