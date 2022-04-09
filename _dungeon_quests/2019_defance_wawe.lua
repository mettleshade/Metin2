quest defance_wawe begin
	state start begin
		function Settings()
			local Settings = {}
			Settings.map_index = 501
			Settings.cord = {1280, 4864}
			Settings.start_pos = {385, 357}
			return Settings
		end
		function SpawnHandicap(i)
			if i == 0 then
				local h1 = d.spawn_mob_ac_dir(3970, 400, 372, 0)
				local h2 = d.spawn_mob_ac_dir(3970, 369, 372, 0)
				d.setf("h1", h1)
				d.setf("h2", h2)
			elseif i == 1 then
				local h3 = d.spawn_mob_ac_dir(3970, 400, 435, 0)
				local h4 = d.spawn_mob_ac_dir(3970, 369, 435, 0)
				d.setf("h3", h3)
				d.setf("h4", h4)
			end
		end
		function PurgeHandicap(i)
			if i == 0 then
				d.purge_vid(d.getf("h1"))
				d.purge_vid(d.getf("h2"))
			elseif i == 1 then
				d.purge_vid(d.getf("h3"))
				d.purge_vid(d.getf("h4"))
			end
		end
		function SpawnHidras()
			local h1 = d.spawn_mob_ac_dir(3963, 378, 443, 180)
			local h2 = d.spawn_mob_ac_dir(3963, 385, 439, 180)
			local h3 = d.spawn_mob_ac_dir(3964, 392, 443, 180)
			d.setf("hidra1", h1)
			d.setf("hidra2", h2)
			d.setf("hidra3", h3)
		end
		function PurgeHidras()
			if d.getf("hidracount") == 2 then
				d.purge_vid(d.getf("hidra3"))
			elseif d.getf("hidracount") == 1 then
				d.purge_vid(d.getf("hidra3"))
				d.purge_vid(d.getf("hidra2"))
			else
				d.purge_vid(d.getf("hidra3"))
				d.purge_vid(d.getf("hidra2"))
				d.purge_vid(d.getf("hidra1"))
			end
		end
		function Clear(inx)
			clear_server_timer("UpdateDungeon", inx)
			clear_server_timer("DefanceCheckSecondFiveOne", inx)
			clear_server_timer("DefanceCheckSecondFive", inx)
			clear_server_timer("DefanceCheckSecondFourOne", inx)
			clear_server_timer("DefanceCheckSecondFour", inx)
			clear_server_timer("DefanceCheckSecondThreeOne", inx)
			clear_server_timer("DefanceCheckSecondThree", inx)
			clear_server_timer("DefanceJump_Wawe2", inx)
			clear_server_timer("DefanceCheckSecondTwoOne", inx)
			clear_server_timer("DefanceCheckSecondTwo", inx)
			clear_server_timer("DefanceCheckSecond", inx)
			d.setf("sn", 0)
			d.setf("dalga", 0)
			d.setf("hidra1", 0)
			d.setf("hidra2", 0)
			d.setf("hidra3", 0)
			d.setf("h3", 0)
			d.setf("h4", 0)
			d.setf("h3", 0)
			d.setf("h4", 0)
			d.setf("hidracount", 0)
			d.setf("hidra", 0)
		end
		
		when DefanceExit.server_timer begin
			defance_wawe.Clear(d.get_map_index())
			d.exit_all_to_start_position()
		end

		when kill with npc.get_race() == 3962 begin
			d.zodiac_notice_clear()
			d.zodiac_notice("Kara g�r�nd�! Gemi dire�ini ba�ar�yla savundunuz ve uzun bir bir yolculuktan sonra yeni k�taya ula�t�n�z.")
			-- d.zodiac_notice("3 dakika i�erisinde gemiden ineceksin haz�rlan !")
			d.clear_regen()
			d.kill_all()
			d.spawn_mob_ac_dir(3965, 385, 417, 0)
			d.spawn_mob_ac_dir(3949, 385, 451, 0)
			defance_wawe.PurgeHandicap(1)
			server_timer("DefanceExit", 60*3, d.get_map_index())
		end
		when DefanceCheckSecondFiveOne.server_timer begin
			if d.select(get_server_timer_arg()) then
				if d.getf("sn") > 1 then
					d.zodiac_notice_clear()
					d.zodiac_notice("Deniz Sava�� "..d.getf("sn").." sn. i�inde ba�layacak")
					d.setf("sn", d.getf("sn") - 1)
					d.set_victim_mast(d.getf("hidra"), 0)
				else
					clear_server_timer("DefanceCheckSecondFiveOne", d.get_map_index())
					d.zodiac_notice_clear()
					d.zodiac_notice("Deniz sava�� ba�lad� dire�i savun !")
					d.setf("sn", d.getf("sn") - 1)
					d.set_regen_file("data/dungeon/defance_wawe/4.txt")
					d.set_victim_mast(d.spawn_mob_ac_dir(3956, 385, 430, 0), 1)
					defance_wawe.PurgeHandicap(0)
					d.set_victim_mast(d.getf("hidra"), 1)
				end
			end
		end
		when DefanceCheckSecondFive.server_timer begin
			if d.select(get_server_timer_arg()) then
				clear_server_timer("DefanceCheckSecondFive", d.get_map_index())
				local set = defance_wawe.Settings()
				local cord = set.cord
				local pos = set.start_pos
				defance_wawe.SpawnHandicap(0)
				d.setf("hidra", d.spawn_mob_ac_dir(3962, 385, 377, 0))
				d.set_victim_mast(d.getf("hidra"), 0)
				d.setf("hidracount", 0)
				defance_wawe.PurgeHidras()
				d.jump_all((cord[1] + pos[1]), (cord[2] + pos[2]))
				d.zodiac_notice_clear()
				d.zodiac_notice("4. Dalga: Gemi dire�i savunmas� esnas�nda, Hidra ki�isini ma�lup edin")
				-- cmdchat("BINARY_Update_Mast_Floor 4")
				d.setf("sn", 5)
				server_loop_timer("DefanceCheckSecondFiveOne", 1, d.get_map_index())
			end
		end
		when kill with npc.get_race() == 3961 begin
			d.zodiac_notice_clear()
			d.zodiac_notice("Dire�i ba�ar�yla savundunuz. Aferin! Bir sonraki dalgaya haz�rlan�n.")
			d.clear_regen()
			d.kill_all()
			server_timer("DefanceCheckSecondFive", 10, d.get_map_index())
		end
		when DefanceCheckSecondFourOne.server_timer begin
			if d.select(get_server_timer_arg()) then
				if d.getf("sn") > 1 then
					d.zodiac_notice_clear()
					d.zodiac_notice("Deniz Sava�� "..d.getf("sn").." sn. i�inde ba�layacak")
					d.setf("sn", d.getf("sn") - 1)
					d.set_victim_mast(d.getf("hidra"), 0)
				else
					d.zodiac_notice_clear()
					d.zodiac_notice("Deniz sava�� ba�lad� dire�i savun !")
					d.setf("sn", d.getf("sn") - 1)
					clear_server_timer("DefanceCheckSecondFourOne", d.get_map_index())
					d.set_regen_file("data/dungeon/defance_wawe/3.txt")
					d.set_victim_mast(d.spawn_mob_ac_dir(3956, 385, 430, 0), 1)
					defance_wawe.PurgeHandicap(0)
					d.set_victim_mast(d.getf("hidra"), 1)
				end
			end
		end
		when DefanceCheckSecondFour.server_timer begin
			if d.select(get_server_timer_arg()) then
				clear_server_timer("DefanceCheckSecondFour", d.get_map_index())
				local set = defance_wawe.Settings()
				local cord = set.cord
				local pos = set.start_pos
				defance_wawe.SpawnHandicap(0)
				d.setf("hidra", d.spawn_mob_ac_dir(3961, 385, 377, 0))
				d.set_victim_mast(d.getf("hidra"), 0)
				d.setf("hidracount", 1)
				defance_wawe.PurgeHidras()
				d.jump_all((cord[1] + pos[1]), (cord[2] + pos[2]))
				d.zodiac_notice_clear()
				d.zodiac_notice("3. Dalga: Gemi dire�i savunmas� esnas�nda, Hidra ki�isini ma�lup edin")
				-- cmdchat("BINARY_Update_Mast_Floor 3")
				d.setf("sn", 10)
				server_loop_timer("DefanceCheckSecondFourOne", 1, d.get_map_index())
			end
		end
		when kill with npc.get_race() == 3960 begin
			d.zodiac_notice_clear()
			d.zodiac_notice("Dire�i ba�ar�yla savundunuz. Aferin! Bir sonraki dalgaya haz�rlan�n.")
			d.clear_regen()
			d.kill_all()
			server_timer("DefanceCheckSecondFour", 7, d.get_map_index())
		end
		when DefanceCheckSecondThreeOne.server_timer begin
			if d.select(get_server_timer_arg()) then
				if d.getf("sn") > 1 then
					d.zodiac_notice_clear()
					d.zodiac_notice("Deniz Sava�� "..d.getf("sn").." sn. i�inde ba�layacak")
					d.setf("sn", d.getf("sn") - 1)
					d.set_victim_mast(d.getf("hidra"), 0)
				else
					d.zodiac_notice_clear()
					d.zodiac_notice("Deniz sava�� ba�lad� dire�i savun !")
					d.setf("sn", d.getf("sn") - 1)
					clear_server_timer("DefanceCheckSecondThreeOne", d.get_map_index())
					d.set_regen_file("data/dungeon/defance_wawe/2.txt")
					d.set_victim_mast(d.spawn_mob_ac_dir(3956, 385, 377, 0), 1)
					defance_wawe.PurgeHandicap(0)
					d.set_victim_mast(d.getf("hidra"), 1)
				end
			end
		end
		when DefanceCheckSecondThree.server_timer begin
			if d.select(get_server_timer_arg()) then
				clear_server_timer("DefanceCheckSecondThree", d.get_map_index())
				server_loop_timer("DefanceCheckSecondThreeOne", 1, d.get_map_index())
				d.set_victim_mast(d.getf("hidra"), 0)
				d.setf("sn", 10)
			end
		end
		when DefanceJump_Wawe2.server_timer begin
			if d.select(get_server_timer_arg()) then
				clear_server_timer("DefanceJump_Wawe2", d.get_map_index())
				local set = defance_wawe.Settings()
				local cord = set.cord
				local pos = set.start_pos
				defance_wawe.SpawnHandicap(0)
				d.setf("hidra", d.spawn_mob_ac_dir(3960, 385, 377, 0))
				d.set_victim_mast(d.getf("hidra"), 0)
				d.setf("hidracount", 2)
				defance_wawe.PurgeHidras()
				d.jump_all((cord[1] + pos[1]), (cord[2] + pos[2]))
				d.zodiac_notice_clear()
				d.zodiac_notice("2. Dalga: Gemi dire�i savunmas� esnas�nda, Hidra ki�isini ma�lup edin")
				-- cmdchat("BINARY_Update_Mast_Floor 2")
				server_timer("DefanceCheckSecondThree", 1, d.get_map_index())
			end
		end
		when DefanceCheckSecondTwoOne.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Bir Sonraki dalga "..d.getf("sn").." sn. i�inde ba�layacak..")
				if d.getf("sn") > 1 then
					d.setf("sn", d.getf("sn") - 1)
				else
					d.setf("sn", d.getf("sn") - 1)
					clear_server_timer("DefanceCheckSecondTwoOne", d.get_map_index())
					d.clear_regen()
					d.kill_all()
					server_timer("DefanceJump_Wawe2", 1, d.get_map_index())
				end	
			end
		end
		when DefanceCheckSecondTwo.server_timer begin
			if d.select(get_server_timer_arg()) then
				clear_server_timer("DefanceCheckSecondTwo", d.get_map_index())
				server_loop_timer("DefanceCheckSecondTwoOne", 1, d.get_map_index())
				d.zodiac_notice_clear()
				d.zodiac_notice("Bir Sonraki dalga "..d.getf("sn").." sn. i�inde ba�layacak.")
				d.setf("sn", d.getf("sn") - 1)
			end
		end
		when DefanceCheckSecondOne.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Deniz Sava�� "..d.getf("sn").." sn. i�inde ba�layacak")
				if d.getf("sn") > 1 then
					d.setf("sn", d.getf("sn") - 1)
				else
					
					d.zodiac_notice_clear()
					d.zodiac_notice("Deniz sava�� ba�lad� dire�i savun !")
					d.setf("sn", d.getf("sn") - 1)
					clear_server_timer("DefanceCheckSecondOne", d.get_map_index())
					defance_wawe.PurgeHandicap(0)
					d.set_regen_file("data/dungeon/defance_wawe/1.txt")
					-- cmdchat("BINARY_Update_Mast_Floor 1")
					d.set_victim_mast(d.spawn_mob_ac_dir(3956, 385, 430, 0), 1)
					server_timer("DefanceCheckSecondTwo", 100, d.get_map_index())
					d.setf("sn", 10)
				end
			end
		end
		when DefanceCheckSecond.server_timer begin
			-- cmdchat("BINARY_Update_Mast_Floor 1")
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Deniz Sava�� "..d.getf("sn").." sn. i�inde ba�layacak")
				clear_server_timer("DefanceLoginTime", inx)
				server_timer("DefanceLoginTime", 60*45,d.get_map_index())
				if d.getf("sn") == 10 then
					d.setf("sn", d.getf("sn") - 1)
					server_loop_timer("DefanceCheckSecondOne", 1, d.get_map_index())
					clear_server_timer("DefanceCheckSecond", d.get_map_index())
				else
					d.setf("sn", d.getf("sn") - 10)
				end
			end
		end
		
		when DefanceIsDefenseControl.server_timer begin
			if d.select(get_server_timer_arg()) then
				if d.get_mast() <= 0 then
					server_timer("DefanceExit", 2,d.get_map_index())
					d.zodiac_notice_clear()
					d.zodiac_notice("<Gemi savunmas�> Gemi savunmas� tamamlanamad�!")
					clear_server_timer("DefanceIsDefenseControl", d.get_map_index())
					defance_wawe.Clear(d.get_map_index())
					d.exit_all_to_start_position()
				else
					server_timer("DefanceIsDefenseControl2", 10, d.get_map_index())
					clear_server_timer("DefanceIsDefenseControl", d.get_map_index())
				end
			end
		end
		
		when DefanceIsDefenseControl2.server_timer begin
			if d.select(get_server_timer_arg()) then
				if d.get_mast() <= 0 then
					server_timer("DefanceExit", 2,d.get_map_index())
					d.zodiac_notice_clear()
					d.zodiac_notice("<Gemi savunmas�> Gemi savunmas� tamamlanamad�!")
					clear_server_timer("DefanceIsDefenseControl2", d.get_map_index())
					defance_wawe.Clear(d.get_map_index())
					d.exit_all_to_start_position()
				else
					server_timer("DefanceIsDefenseControl", 10, d.get_map_index())
					clear_server_timer("DefanceIsDefenseControl2", d.get_map_index())
				end
			end
		end
		
		when DefanceLoginTime.server_timer begin
			if d.select(get_server_timer_arg()) then
				server_timer("DefanceExit", 2,d.get_map_index())
				d.zodiac_notice_clear()
				d.zodiac_notice("<Gemi savunmas�> S�reniz doldu! Gemi savunmas� tamamlanamad�!")
				clear_server_timer("DefanceLoginTime", d.get_map_index())
				defance_wawe.Clear(d.get_map_index())
			end
		end

		when 20436.chat."Dalgay� Ba�lat" begin
			if party.is_leader() then
				say_npc()
				say("")
				say("Bir grupta iken giri� yapamazs�n!")
			else
				say_npc()
				say("")
				say("Savunmay� ba�latmak istiyor musun ?")
				if select("Evet", "Hay�r") == 2 then
					return
				end
				local config = defance_wawe.Settings()
				local cord = config.cord
				local start_pos = config.start_pos
				d.setf("hidracount", 3)
				defance_wawe.SpawnHidras()
				d.jump_all(config.map_index, (cord[1] + start_pos[1]), (cord[2] + start_pos[2]))
				d.jump_all(config.map_index, (cord[1] + start_pos[1]), (cord[2] + start_pos[2]))
				d.zodiac_notice_clear()
				d.zodiac_notice("1. Dalga: 120 sn. Boyunca t�m g�c�n�zle Gemi dire�i ��esini savunun.")
				server_loop_timer("DefanceCheckSecond", 10, d.get_map_index())
				server_timer("DefanceIsDefenseControl", 1, d.get_map_index())
				npc.purge()
				d.setf("sn", 20)
				d.setf("dalga", 1)
			end
		end
		
		
		-- when Defancemake_dungeon.timer begin
			-- local config = defance_wawe.Settings()
			-- local cord = config.cord
			-- local start_pos = config.start_pos
			-- d.new_jump(config.map_index, (cord[1] + start_pos[1] * 100), (cord[2] + start_pos[2] * 100))
			-- d.spawn_mob_ac_dir(20436, 385, 359, 0)
			-- d.spawn_mob(20434, 385, 400)
			-- defance_wawe.SpawnHandicap(0)
			-- defance_wawe.SpawnHandicap(1)
		-- end

		when 20013.chat."Herkes Gemiye!" with (game.get_event_flag("enable_defance_wave_system") == 0) begin
			addimage(35,35,'hidra.tga')
			if party.is_leader() then
				say_title_center("Bal�kc� :")
				addimage(35,35,'hidra.tga')
				say("")
				say("")
				say("")
				say("")
				say("")
				say_reward_center("Grupta iken giremezsin")
				return
			end
			
			-- if party.get_near_count() < 2 then
				-- say_title_center("Bal�kc� :")
				-- addimage(35,35,'hidra.tga')
				-- say("")
				-- say("")
				-- say("")
				-- say("")
				-- say("")
				-- say_reward_center("Bu gemiye en az 2 ki�i gelmelisin.")
				-- say("")
				-- say_reward_center("Yan�nda bulunan �ye say�s� : "..party.get_near_count())
				-- say_reward_center("Yan�nda bulunan �ye say�s� : "..party.get_near_count())
				-- return
			-- end
			
			-- local pids = {party.get_member_pids()}
			-- local noTicketMembers = {}
			-- local notEnoughLevelMembers = {}
			-- local notLoginTimeMembers = {}
			-- local repeatDungeontime = true
			-- local ticketCheck = true
			-- local levelCheck = true
			-- local ticketGroup = {31323, 1, 31323, 1}
			-- for i, pid in next, pids, nil do
				-- q.begin_other_pc_block(pid)
				-- local canPass = false
				-- for idx=1, table.getn(ticketGroup),2 do 
					-- if pc.count_item(ticketGroup[idx]) >= ticketGroup[idx+1] then
						-- canPass = true
						-- break
					-- end
				-- end
				
				-- if not canPass then
					-- table.insert(noTicketMembers, pc.get_name())
					-- ticketCheck = false
				-- end

				-- if pc.level < 100 then
					-- table.insert(notEnoughLevelMembers, pc.get_name())
					-- levelCheck = false
				-- end
				
				-- if (get_time() < pc.getf("defensewave", "dungeon_last_login_time")) then
					-- table.insert(notLoginTimeMembers, pc.get_name())
					-- repeatDungeontime = false
				-- end

				-- q.end_other_pc_block()
			-- end

			-- if not repeatDungeontime then
				-- say_title_center(mob_name(20013))
				-- addimage(35,35,'hidra.tga')
				-- say("")
				-- say("")
				-- say("")
				-- say("")
				-- say("")
				-- say_center("Uyar�! Gemi savunmas�ndan yeni ��km�� grup[ENTER]�yeleri mevcut a�a��daki �yeler 6 saat[ENTER]sonra giri� yapabilir")
				-- for i, name in next, notLoginTimeMembers, nil do
					-- say(color(1,1,0), "    "..name)
				-- end
				-- return
			-- end
			
			-- if not ticketCheck then
				-- say_title_center(mob_name(20013))
				-- addimage(35,35,'hidra.tga')
				-- say("")
				-- say("")
				-- say("")
				-- say("")
				-- say("")
				-- say_center("Uyar�! Gemi savunmas�na girebilmek i�in,[ENTER]b�t�n grup �yelerinin[ENTER]ge�it biletine sahip olmas� gereklidir.")
				-- for i, name in next, noTicketMembers, nil do
					-- say(color(1,1,0), "    "..name)
				-- end
				-- if levelCheck then
					-- return
				-- else
					-- wait()
				-- end
			-- end

			-- if not levelCheck then
				-- say_title_center(mob_name(20013))
				-- addimage(35,35,'hidra.tga')
				-- if not ticketCheck then
					-- say("")
					-- say("")
					-- say("")
					-- say("")
					-- say("")
					-- say_center("Uyar�! Gemi savunmas�na girebilmek i�in,[ENTER]b�t�n grup �yelerinin[ENTER]ge�it biletine sahip olmas� gereklidir.")
				-- end

				-- say_center("Uyar�! Gemi savunmas�na girebilmek i�in,[ENTER]b�t�n grup �yelerinin[ENTER]100.Seviye'ye ula�m�� olmas� gereklidir.")
				-- for i, name in next, notEnoughLevelMembers, nil do
					-- say_center(color(1,1,0), "    "..name)
				-- end
				-- return
			-- end
					
			
			if pc.get_level() < 100 or pc.get_level() > 120 then
				say_title_center(mob_name(20013))
				addimage(35,35,'mantar.tga')
				say_center("")
				say_center("")
				say_center("")
				say_center("")
				say_center("")
				say_center("Giris yapmak i�in seviyen yetersiz.")
				say_center(string.format("Minimum Seviye: %d.",100))
				say_center(string.format("Maksimum Seviye: %d.",120))
				return
			end
			
			if pc.count_item(31323) < 1 then
				say_title_center(mob_name(20013))
				addimage(35,35,'mantar.tga')
				say_center("")
				say_center("")
				say_center("")
				say_center("")
				say_center("")
				say_center("Envanterinde yeterli miktarda yok:")
				say_reward_center(string.format("%s.", item_name(31323)))
				say_center("")
				return
			end
			
			if (get_time() < pc.getf("defensewave", "dungeon_last_login_time")) then
				say_title_center(mob_name(20013))
				addimage(35,35,'mantar.tga')
				say_center("")
				say_center("")
				say_center("")
				say_center("")
				say_center("")
				say_center("Soguma s�ren hen�z dolmadi !")
				say_center("Kalan s�re: "..dungeon_get_duration(pc.getf("defensewave", "dungeon_last_login_time") - get_global_time()).."")
				say_center("")
				return
			end
			
			if game.get_event_flag("mashroom_dung_close") == 1 then
				say_title_center(mob_name(20410))
				addimage(35,35,'mantar.tga')
				say_center("")
				say_center("")
				say_center("")
				say_center("")
				say_center("")
				say_center("Lanetli Orman hen�z aktif durumda de�ildir.")
				say_center("")
				return
			else
				say("Meley'i takip etmek i�in �imdi gemi yolculu�una")
				say("ba�lamak istiyor musun?")
					say("")
					say("")
					say("")
					say("")
					say("")
				if select("Evet", "Hay�r") == 1 then
					local config = defance_wawe.Settings()
					local cord = config.cord
					local start_pos = config.start_pos
					d.new_jump(501, ((1280 + 385) * 100), ((4864+357) * 100))
					d.spawn_mob_ac_dir(20436, 385, 359, 0)
					d.spawn_mob(20434, 385, 400)
					defance_wawe.SpawnHandicap(0)
					defance_wawe.SpawnHandicap(1)
				else
					return
				end
				if game.get_event_flag("enable_defance_wave_system") == 1 then
					say_title_center(mob_name(20013))
					addimage(35,35,'hidra.tga')
					say("")
					say("")
					say("")
					say("")
					say("")
					say_reward_center("Harita �uanda bak�m modunda.")
					return
				end
				-- timer("Defancemake_dungeon", 1)
			end

		end
		
		when 20013.chat."S�remi s�f�rlamak istiyorum.." with (game.get_event_flag("enable_defance_wave_system_time") == 1) begin
			addimage(35,35,'hidra.tga')
			say_title_center("Bal�kc� :")
			say("")
			say("")
			say("")
			say("")
			say("")
			say_center("Gemi savunmas�na tekrar girebilmek i�in")
			say_center("S�reni s�f�rlaman gerekiyor")
			say("")
			say_reward_center("S�reni s�f�rlamak ister misin ?")
			local select_time = select("Evet", "Hay�r")
			if select_time == 2 then return end
			if select_time == 1 then
				say_title_center("Bal�kc� :")
				addimage(35,35,'hidra.tga')
				say("")
				say("")
				say("")
				say("")
				say("")
				say_center("S�reni s�f�rlamam i�in bana")
				say_center("50.000.000 yang vermen gerekiyor ")
				say_center("")
				say_reward_center("S�reni s�f�rlamak ister misin ?")
				local select_time_new = select("Evet", "Hay�r")
				if select_time_new == 2 then return end
				if select_time_new == 1 then
					if (get_time() > pc.getf("defensewave", "dungeon_last_login_time")) then
						say_title_center("Bal�kc�: ")
						addimage(35,35,'hidra.tga')
						say("")
						say("")
						say("")
						say("")
						say("")
						say_reward_center("Zaten s�ren s�f�rlanm�� durumda [ENTER]tekrar giri� yapabilirsin.")
					elseif pc.get_gold() < 50000000 then
						say_title_center("Bal�kc�: ")
						addimage(35,35,'hidra.tga')
						say("")
						say("")
						say("")
						say("")
						say("")
						say_reward_center("Yeterli miktarda Yang'a sahip de�ilsin.")
					elseif pc.is_busy() == true then
						say_title_center("Bal�kc�: ")
						addimage(35,35,'hidra.tga')
						say("")
						say("")
						say("")
						say("")
						say("")
						say_reward_center("Me�gul durumda oldu�un i�in bunu ger�ekle�tiremezsin.")
					elseif pc.is_dead() == true then
						say_title_center("Bal�kc�: ")
						addimage(35,35,'hidra.tga')
						say("")
						say("")
						say("")
						say("")
						say("")
						say_reward_center("�l� durumda oldu�un i�in bunu ger�ekle�tiremezsin.")
					else
						say_title_center("Bal�kc�: ")
						addimage(35,35,'hidra.tga')
						say("")
						say("")
						say("")
						say("")
						say("")
						pc.setf("defensewave", "dungeon_last_login_time", 0)
						say_reward_center("S�ren s�f�rland� tekrar giri� yapabilirsin.")
						pc.change_gold(-50000000)
					end
				end
			end
		end
		
		when login begin
			if pc.get_map_index() == 501 then
				pc.warp(168600,611700)
				return
			end
			if pc.get_map_index() >= 5010000 and pc.get_map_index() < 5020000 then
				pc.remove_item("31323",1)
				pc.setf("defensewave", "dungeon_last_login_time", get_time() + (60*60*2))
				cmdchat("BINARY_Update_Mast_Window 1 2700")
				-- cmdchat("BINARY_Update_Mast_Floor 0")
			else
				cmdchat("BINARY_Update_Mast_Window 0 0")
			end
		end
	end
end