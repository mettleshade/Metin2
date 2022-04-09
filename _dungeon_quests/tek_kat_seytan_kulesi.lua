quest deviltower_zone begin
	state start begin
		--[[ FUNCTION STATEMENT BEGIN ]]
		function spawn_boss(level)
			local boss_settings = {
				[1] = {1093, 200, 460}};
			
			return d.spawn_mob(boss_settings[level][1], boss_settings[level][2], boss_settings[level][3])
		end
		
		function settings()
			return
			{
				["map_index"] = 66,
				["spawm_pos"] = {
					[1] = {560+21000, 546+22000}
				},
				["level_check1"] = {
					["minimum"] = 75,
					["maximum"] = 120
				},
				["keys"] = {30330, 30330}
			}
		end
		
		when login begin
			local mid = pc.get_map_index()
			local setting = deviltower_zone.settings()

			if (pc.get_map_index() >= 660000 and pc.get_map_index() < 670000) then
				
				pc.setqf("sk_player_time_duration", get_time()+60*10)
				
				if pc.getqf("seytan_kulesi_giris") > 0 then
					pc.setqf("seytan_kulesi_giris", 0)
					d.zodiac_notice_clear()
					deviltower_zone.spawn_boss(1)
					d.zodiac_notice("Merhaba Epsilon2'ye �zel �eytan Kulesine Ho�geldin. 10 Dakika zaman�n var.")
					server_loop_timer('sureyi_baslat', 60*10, d.get_map_index())
				end
			end

			if mid == setting["map_index"] then
				if not pc.in_dungeon() then
					warp_to_village()
				end
			end
		end
		
		when logout with pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 begin
			------------ Dungeon Turn Back System ----------------------
			pc.setf("devil_tower","dungeon_turn",1)
			------------------------------------------------------------
		end
		
		when kill with npc.get_race() == 1093 and pc.in_dungeon() begin
			d.zodiac_notice_clear()
			pc.setqf("seytan_kulesi_giris", 0)
			d.zodiac_notice(string.format("%s Ma�lub edildi , Tebrikler!", mob_name(1093)))
			-- notice_all(string.format("%s grubu �eytan Kulesini ba�ar� ile tamamlad�!", pc.get_name()))
			d.notice("3 dakika i�ide ���nlan�yorsun !")
			d.kill_all()
			timer("final1", 60*3)
		end

		when sureyi_baslat.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindan� tamamlamakta ba�ar�s�z oldun. 1 dakika i�erisinde d��ar� ���nlan�yorsun.")
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
		when 20348.chat."�eytan Kulesi " begin
			-- Quest window dungeon image
			addimage(35,35,'kule.tga')
			local settings = deviltower_zone.settings()
			
			say_title_center(mob_name(20348))
			say("")
			
			if not pc.can_warp() then
				addimage(35,35,'kule.tga')say("")say("")say("")say("")
				say_center("Hen�z ���nlanamazs�n.")
				say_center("")
				return
			end
			if get_time() < pc.getqf("sk_player_time_duration") then
				addimage(35,35,'kule.tga')say("")say("")say("")say("")
				say_center("Soguma s�ren hen�z dolmadi !")
				say_center("Kalan s�re: "..dungeon_get_duration(pc.getqf("sk_player_time_duration") - get_global_time()).."")
				return
			end
			if pc.get_level() < 75 or pc.get_level() > 120 then
				addimage(35,35,'kule.tga')say("")say("")say("")say("")
				say_center("Giris yapmak i�in seviyen yetersiz.")
				say_center(string.format("Minimum Seviye: %d.",75))
				say_center(string.format("Maksimum Seviye: %d.",120))
				return
			end	
			
			if pc.get_money() < 100000000 then
				say_npc()
				say_reward("Hay aksi!") 
				say("Seni i�eri alamam envanterinde yeterli") 
				say("yang bulamad�m bana 100.000.000 yang getirmelisin.") 
				return 
			end
			
			
			-- Quest window dungeon image
			addimage(35,35,'kule.tga')say("")say("")say("")say("")say("")

			say_center("�eytan kalesine ���nlan�yorsun,")
			say_center("'Devam' dedikten sonra b�t�n �yeler ���nlanacaklar .")
			wait()
			-- level deviltower_zone.spawn_boss(1)
			-- deviltower_zone.spawn_boss(1)deviltower_zone.spawn_boss(1)
			-- d.new_jump(66, 2048+575 * 100, 6656+148 * 100)
			pc.change_money(-100000000) 
			d.new_jump(66, special.devil_tower[1][1] * 100, special.devil_tower[1][2] * 100)
			pc.setqf("seytan_kulesi_giris", 1)
			--deviltower_zone.make_dungeon()
		end
		when 20348.chat."Ma�ara S�re s�f�rla " with pc.is_gm() begin
			local select_timer = select("S�f�rla", "S�f�rlama")
			if select_timer == 1 then
				pc.setqf("sk_player_time_duration", 0)
			end
		end
		--[[ CHAT END ]]
	end
end