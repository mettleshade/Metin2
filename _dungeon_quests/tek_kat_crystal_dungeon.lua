quest crystal_dungeon1 begin
	state start begin
		--Functions
		function settings()
			return
			{
				["map_index"] = 9,
				["spawm_pos"] = {
					[1] = {21272, 29576},
					[2] = {663+20992, 248+29440},
					[3] = {241+20992, 639+29440},
					[4] = {406+20992, 648+29440},
					[5] = {776+20992, 740+29440}
				},
				["level_check"] = {
					["minimum"] = 85,
					["maximum"] = 120
				},
				["keys"] = {19985, 19986, 19987},
				["metin_stones"] = {8411, 8412, 8413, 8414}
			};
		end
		
		function spawn_boss(level)
			local boss_settings = {
				[3] = {948, 741, 191},
				[5] = {949, 431, 544},
				[7] = {950, 270, 280}
				};
			
			return d.spawn_mob(boss_settings[level][1], boss_settings[level][2], boss_settings[level][3])
		end
		
		
		function make_dungeon()
			local setting = crystal_dungeon1.settings()
			pc.setqf("kristal_sure", 1)
			d.new_jump_party(setting["map_index"], setting["spawm_pos"][1][1], setting["spawm_pos"][1][2])
			cleartimer("level_timer")
			d.setf("level_four_login", 0)
			d.setf("lair_check", 7)
			
			crystal_dungeon1.spawn_boss(7)
		end

		function party_get_member_pids()
			local pids = {party.get_member_pids()}
			
			return pids
		end
		
		------
		------[Dungeon enter]
		------
		when 9215.chat."Kristal Zindan " begin
			addimage(35,35,'kristal.tga')
			local settings = crystal_dungeon1.settings()
			
			say_title_center(mob_name(9215))
			say("")
			
			if not party.is_party() then
				addimage(35,35,'kristal.tga')say("")say("")say("")say("")
				say_center("Bu zindana giri� yapabilmen i�in,")
				say_center("bir grupta bulunman gerekiyor .")
				return
			end
			
			if not party.is_leader() then
				addimage(35,35,'kristal.tga')say("")say("")say("")say("")

				say_center("Bu zindana giri� yapabilmen i�in,")
				say_center("bir grubun lideri olmal�s�n .")
				return
			end
			
			if party.get_near_count() < 2 then
				addimage(35,35,'kristal.tga')say("")say("")say("")say("")

				say_center("Bu zindana giri� yapabilmen i�in,")
				say_center("bir grupta bulunmal�s�n�z.")
				return
			end
			
			local levelCheck, maximlevelCheck, itemCheck, durationCheck = true, true, true, true
			local noDurationMembers, noLevelMembers, noitemCheckMembers = {},{},{}

			for i, pid in next, crystal_dungeon1.party_get_member_pids(), nil do
				q.begin_other_pc_block(pid)
				
				if pc.get_level() < settings["level_check"]["minimum"] then
					table.insert(noLevelMembers, pc.get_name())
					levelCheck = false
				end
				if pc.get_level() > settings["level_check"]["maximum"] then
					table.insert(noLevelMembers, pc.get_name())
					maximlevelCheck = false
				end
				if pc.count_item(55034) <= 0 then
					table.insert(noitemCheckMembers, pc.get_name())
					itemCheck = false
				end
				
				if get_time() < pc.getqf("cy_player_time_duration") then
					table.insert(noDurationMembers, pc.get_name())
					durationCheck = false
				end
				
				q.end_other_pc_block()
			end
			
			if not levelCheck then
				addimage(35,35,'kristal.tga')say("")say("")say("")say("")

				say_center("Bu zindana giri� yapabilmen i�in,")
				say_center("grubun her �yesi")
				say_center(string.format("Minimum seviye: %s.", settings["level_check1"]["minimum"]))
				say_center("")
				say_center("Grubunuzdaki baz� �yeler bu �art� yerine getirmiyor !")
				for i, name in next, noLevelMembers, nil do
					say(color(1,1,0), "    "..name)
				end
				return
			end
			
			if not maximlevelCheck then
				addimage(35,35,'kristal.tga')say("")say("")say("")say("")
	
				say_center("Bu zindana giri� yapabilmen i�in,")
				say_center("grubun her �yesi ")
				say_center(string.format("Minimum seviye:   %s.", settings["level_check1"]["maximum"]))
				say_center("")
				say_center("Grubunuzdaki baz� �yeler bu �art� yerine getirmiyor !")
				for i, name in next, noLevelMembers, nil do
					say(color(1,1,0), "    "..name)
				end
				return
			end
			
			if not itemCheck then
				-- Quest window dungeon image
				addimage(35,35,'kristal.tga')say("")say("")say("")say("")

				say_center("Bu zindana giri� yapabilmen i�in,")
				say_center("grubun her �yesinin zindan biletine")
				say_center("sahip olmas� gerekiyor bir �yenin")
				say_center("Envanterinde yeterli miktarda yok:")
				say_item(item_name(55034),55034, "")
				for i, name in next, noitemCheckMembers, nil do
					say(color(1,1,0), "    "..name)
				end
				return
			end
			
			if not durationCheck then
				Quest window dungeon image
				addimage(35,35,'kristal.tga')say("")say("")say("")say("")

				say_center("Bu zindana giri� yapabilmen i�in,")
				say_center("grubun her �yesinin soguma s�resinin")
				say_center("sona ermi� olmas� gerekiyor")
				say_center("soguma s�resini tamamlamam�� olanlar var:")

				for i, name in next, noDurationMembers, nil do
					say(color(1,1,0), "    "..name)
				end
				return
			end

			
			for i, pid in next, crystal_dungeon1.party_get_member_pids(), nil do
				q.begin_other_pc_block(pid)
				pc.remove_item(55034, 1)
				pc.setqf("cy_player_time_duration", get_time()+60*60*3)
				q.end_other_pc_block()
			end

			addimage(35,35,'kristal.tga')say("")say("")say("")say("")

			say_center("Kristal zindana ���nlan�yorsun,")
			say_center("'Devam' dedikten sonra b�t�n �yeler ���nlanacaklar .")
			wait()
			crystal_dungeon1.make_dungeon()
		end
		when 9215.chat."Ma�ara S�re s�f�rla " with pc.is_gm() begin
			local select_timer = select("S�f�rla", "S�f�rlama")
			if select_timer == 1 then
				pc.setqf("cy_player_time_duration", 0)
			end
		end
		----
		----Dungeon start
		----
		when login begin
			local mid = pc.get_map_index()
			local setting = crystal_dungeon1.settings()
			if (pc.get_map_index() >= 90000 and pc.get_map_index() < 99999) then
				if pc.getqf("kristal_sure") > 0 then
					pc.setqf("kristal_sure", 0)
					d.zodiac_notice_clear()
					d.zodiac_notice("Merhaba Epsilon2'ye �zel Kristal Zindan�na Ho�geldin. 10 Dakika zaman�n var.")
					server_loop_timer('sureyi_baslat', 10*60, d.get_map_index())
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

		when 950.kill with pc.in_dungeon() begin
			local setting = crystal_dungeon1.settings()
			
			if d.getf("lair_check") == 7 then
				d.kill_all()
				d.zodiac_notice_clear()
				d.zodiac_notice("Kristal Ejderha �ld�r�ld� !")
				d.notice("Zindan� ba�ar�yla tamamlad�n !")
				d.notice("3 dakika i�inde ���nlanacaks�n .")
				timer("final", 3 * 60)
			else
				return
			end
		end

		when sureyi_baslat.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindan� tamamlamakta ba�ar�s�z oldun. 10 saniye i�erisinde d��ar� ���nlan�yorsun.")
				server_loop_timer('sure_bitti', 10,d.get_map_index())
				clear_server_timer("sureyi_baslat",d.get_map_index())
			end
		end
		
		when sure_bitti.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.exit_all_to_start_position()
				clear_server_timer("sure_bitti",d.get_map_index())
			end
		end

		when final.timer begin
			d.exit_all_to_start_position()
		end
	end
end