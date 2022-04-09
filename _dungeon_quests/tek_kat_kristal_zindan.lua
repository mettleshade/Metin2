quest kristal_zindan begin
	state start begin
		--[[ FUNCTION STATEMENT BEGIN ]]
		function spawn_boss(level)
			local boss_settings = {
				[1] = {950, 270, 280}};
			return d.spawn_mob(boss_settings[level][1], boss_settings[level][2], boss_settings[level][3])
		end
		
		function settings()
			return
			{
				["map_index"] = 9,
				["level_check1"] = {
					["minimum"] = 85,
					["maximum"] = 120
				},
			}
		end
		
		
		when login begin
			local mid = pc.get_map_index()
			local setting = kristal_zindan.settings()

			if (pc.get_map_index() >= 90000 and pc.get_map_index() < 99999) then
				if pc.getqf("kristal_zindan_giris") > 0 then
					pc.setqf("kristal_zindan_giris", 0)
					kristal_zindan.spawn_boss(1)
					d.zodiac_notice_clear()
					d.zodiac_notice("Merhaba Epsilon2'ye Özel Kristal Zindanına Hoşgeldin. 10 Dakika zamanın var.")
					server_loop_timer('sureyi_baslat', 60*10, d.get_map_index())
				end
			end

			if mid == setting["map_index"] then
				if not pc.in_dungeon() then
					warp_to_village()
				end
			end
		end
		
		when logout with pc.get_map_index() >= 90000 and pc.get_map_index() < 99999 begin
			------------ Dungeon Turn Back System ----------------------
			pc.setf("Crystal","dungeon_turn",1)
			------------------------------------------------------------
		end
		
		when kill with npc.get_race() == 950 and pc.in_dungeon() begin
			d.zodiac_notice_clear()
			pc.setqf("kristal_zindan_giris", 0)
			d.zodiac_notice(string.format("%s Mağlub edildi , Tebrikler!", mob_name(950)))
			notice_all(string.format("%s grubu Kristal Zindanı başarı ile tamamladı!", pc.get_name()))
			d.notice("3 dakika içide ışınlanıyorsun !")
			d.kill_all()
			timer("final1", 60*3)
		end

		when sureyi_baslat.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindanı tamamlamakta başarısız oldun. 1 dakika içerisinde dışarı ışınlanıyorsun.")
				server_loop_timer('sure_bitti', 60,d.get_map_index())
				clear_server_timer("sureyi_baslat",d.get_map_index())
			end
		end
		
		when sure_bitti.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.exit_all_to_start_position()
				clear_server_timer("sure_bitti",d.get_map_index())
			end
		end
		
		when final1.timer begin
			d.exit_all_to_start_position()
		end
		
		--[[ TIMER STATEMENT END ]]
		
		--[[ CHAT BEGIN ]]
		when 9215.chat."Kristal Zindan " begin
			-- Quest window dungeon image
			addimage(35,35,'kristal.tga')
			local settings = kristal_zindan.settings()
			
			say_title_center(mob_name(20348))
			say("")
			
			if not pc.can_warp() then
				addimage(35,35,'kristal.tga')say("")say("")say("")say("")
				say_center("Henüz ışınlanamazsın.")
				say_center("")
				return
			end
			if get_time() < pc.getqf("cy_player_time_duration") then
				if pc.is_gm() then
					say_center("Beta Server; süreyi sıfırlamak mı istiyorsun?")
					say_center("Kalan süre: "..dungeon_get_duration(pc.getqf("cy_player_time_duration") - get_global_time()).."")
					if select("Evet","Hayır") == 1 then
						pc.setqf("cy_player_time_duration",0)
						return
					end
				end
				say_title_center(mob_name(9215))
				addimage(35,35,'kristal.tga')say("")say("")say("")say("")
				say_center("Soguma süren henüz dolmadi !")
				say_center("Kalan süre: "..dungeon_get_duration(pc.getqf("cy_player_time_duration") - get_global_time()).."")
				return
			end
			if pc.get_level() < 85 or pc.get_level() > 120 then
				say_title_center(mob_name(9215))
				addimage(35,35,'kristal.tga')say("")say("")say("")say("")
				say_center("Giris yapmak için seviyen yetersiz.")
				say_center(string.format("Minimum Seviye: %d.",85))
				say_center(string.format("Maksimum Seviye: %d.",120))
				return
			end	
			
			if pc.count_item(55034) < 1 then
				say_title_center(mob_name(9215))
				addimage(35,35,'kristal.tga')say("")say("")say("")say("")
				say_center("Envanterinde yeterli miktarda yok:")
				say_reward_center(string.format("%s.", item_name(55034)))
				say_center("")
				return
			end
			
			addimage(35,35,'kristal.tga')say("")say("")say("")say("")say("")

			say_center("Kristal Zindanına ışınlanıyorsun,")
			wait()
			pc.remove_item(55034, 1)
			pc.setqf("kristal_zindan_giris", 1)
			pc.setqf("cy_player_time_duration", get_time()+60*60*2)
			d.new_jump(9, 21272 * 100, 29576 * 100)
			
		end
		when 9215.chat."Mağara Süre sıfırla " with pc.is_gm() begin
			local select_timer = select("Sıfırla", "Sıfırlama")
			if select_timer == 1 then
				pc.setqf("cy_player_time_duration", 0)
			end
		end
		--[[ CHAT END ]]
	end
end