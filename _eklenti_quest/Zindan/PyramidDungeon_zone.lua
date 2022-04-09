quest PyramidDungeon_zone begin
	state start begin
		when login with PyramidDungeonLIB.isActive() begin
			-- local settings = PyramidDungeonLIB.Settings();
			
			if pc.getqf("antik_p_giris") > 0 then
				pc.setqf("antik_p_giris", 0)
				d.spawn_mob_dir(4157, 957, 1144, 7);
				d.zodiac_notice_clear()
				d.zodiac_notice("Sfenks'i 15 dakikada öldür.")
				d.setf("PyramidDungeon_level", 1)
				server_timer('sfenks', 10*60,d.get_map_index())
			end
			-- d.set_warp_location(settings["outside_index"], settings["outside_pos"][1], settings["outside_pos"][2]);
			-- if (party.is_party() and party.is_leader() or not party.is_party()) then
				
				-- pc.setqf("PyramidDungeon_reward", 0) --- Player can get reward on last floor
				-- d.setf("PyramidDungeon_level", 1); d.setf("PyramidDungeon_stone1", 1);
				-- d.spawn_mob(8471, 91, 130) --- First stone
				
				-- server_timer("PyramidDungeon_full_timer", settings["dungeon_timer"], d.get_map_index()) ---- Full dungeon timer
				-- server_timer("PyramidDungeon_1st_stone", settings["time_until_destroy_first_stone"], d.get_map_index())
				
				-- d.notice("<Antik Piramid>: Mumya Metnini 4 dakika içinde yok et!")
				-- d.notice("<Antik Piramid>: Eðer zamanýnda bitiremezsen dýþarý atýlacaksýn.")
			-- end
		end
		
		when sfenks.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindaný tamamlamak için 5 dakika vaktin kaldý.")
				server_timer('sfenks1', 5*60,d.get_map_index())
				clear_server_timer("sfenks",d.get_map_index())
			end
		end

		when sfenks1.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindaný tamamlamak için 1 dakika vaktin kaldý.")
				server_timer('sfenks2', 60,d.get_map_index())
				clear_server_timer("sfenks1",d.get_map_index())
			end
		end
		when sfenks2.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindaný tamamlamakta baþarýsýz oldun. 10 saniye içerisinde dýþarý ýþýnlanýyorsun.")
				server_timer('sfenksbitti', 10,d.get_map_index())
				clear_server_timer("sfenks2",d.get_map_index())
			end
		end
		when sfenksbitti.server_timer begin
			if d.select(get_server_timer_arg()) then
				clear_server_timer("sfenksbitti",d.get_map_index())
				d.exit_all_to_start_position()
			end
		end
		
		-- 1. Floor - destroy the stone (8471)
		-- when 8471.kill with PyramidDungeonLIB.isActive() and not npc.is_pc() and d.getf("PyramidDungeon_level") == 1 begin
			-- local settings = PyramidDungeonLIB.Settings();
			-- clear_server_timer("PyramidDungeon_1st_stone", get_server_timer_arg())
			
			-- d.setf("PyramidDungeon_stone1", 2);
			-- pc.setqf("2_kat_metin", 0);
			-- d.notice("<Antik Piramid>: Bir kaç saniye sonra gönderileceksin.")
			-- server_timer("PyramidDungeon_1st_jump", 12, d.get_map_index())
			-- server_timer("PyramidDungeon_5th_jump", 12, d.get_map_index())
		-- end
		
		-- 1. Floor - Stone timer, if you wont destroy the stone within 4 minutes, dungeon is closed
		-- when PyramidDungeon_1st_stone.server_timer begin
			-- if d.select(get_server_timer_arg()) then
				-- if d.getf("PyramidDungeon_stone1") == 1 then
					-- d.notice("<Antik Piramid>: Baþarýsýz oldun!")
					-- d.exit_all()
				-- else
					-- return;
				-- end
			-- end
		-- end
		
		-- 1. Floor - Second floor jumper
		-- when PyramidDungeon_1st_jump.server_timer begin
			-- if d.select(get_server_timer_arg()) then
				-- local settings = PyramidDungeonLIB.Settings();

				-- d.jump_all(settings["insidePos_2f"][1], settings["insidePos_2f"][2]);
				-- d.setf("PyramidDungeon_level", 2); d.setf("PyramidDungeon_pergamen", 0);  d.setf("PyramidDungeon_CanUseSeal", 0);
				-- d.spawn_mob_dir(9222, 306, 158, 5);
				-- d.spawn_mob_dir(8432, 306, 145, 1);
				-- d.spawn_mob_dir(8432, 306, 132, 1);
				-- d.spawn_mob_dir(8432, 306, 119, 1);
				-- d.spawn_mob_dir(8432, 306, 106, 1);
				-- pc.setqf("2_kat_metin", 0);
				-- d.regen_file("data/dungeon/pyramid_dungeon/regen_2f_a.txt");
				-- d.setf("Pyramid_2floor_monsters", d.count_monster())
				
				-- d.notice("<Antik Piramid>: Metinleri öldürerek 4 antik parþomeni elde et..")
				---d.notice(string.format("<Antik Piramid>: Yok Edildi : %s!", mob_name(9332)))
			-- end
		-- end
		
		-- 2. Floor - Getting all pieces of pergamen (30800-30803)
		-- when kill with PyramidDungeonLIB.isActive() and not npc.is_pc() and d.getf("PyramidDungeon_level") == 2 begin
		
			
			-- local settings = PyramidDungeonLIB.Settings(); local pergamen = d.getf("PyramidDungeon_pergamen");
			-- if pc.get_x() > 9238 and pc.get_y() > 22616 and pc.get_x() < 9294 and 22694 then				
				-- if pergamen == 0 then
					-- d.setf("Pyramid_2floor_monsters", d.getf("Pyramid_2floor_monsters")-1)
					-- if d.getf("Pyramid_2floor_monsters") < 1 then
						-- game.drop_item(settings["Items_2floor"][1], 1)
						-- d.setf("Pyramid_2floor_monsters", 0);  d.setf("PyramidDungeon_pergamen", 1);
						-- server_timer("PyramidDungeon_2floor_spawner", 12, d.get_map_index())														
					-- end
				-- end
				-- if pergamen == 1 then
					-- d.setf("Pyramid_2floor_monsters", d.getf("Pyramid_2floor_monsters")-1)
					-- if d.getf("Pyramid_2floor_monsters") < 1 then
						-- game.drop_item(settings["Items_2floor"][2], 1)
						-- d.setf("Pyramid_2floor_monsters", 0);  d.setf("PyramidDungeon_pergamen", 2);
						-- server_timer("PyramidDungeon_2floor_spawner", 12, d.get_map_index())							
					-- end
				-- end
				-- if pergamen == 2 then
					-- d.setf("Pyramid_2floor_monsters", d.getf("Pyramid_2floor_monsters")-1)
					-- if d.getf("Pyramid_2floor_monsters") < 1 then
						-- game.drop_item(settings["Items_2floor"][3], 1)
						-- d.setf("Pyramid_2floor_monsters", 0);  d.setf("PyramidDungeon_pergamen", 3);
						-- server_timer("PyramidDungeon_2floor_spawner", 12, d.get_map_index())							
					-- end
				-- end
				-- if pergamen == 3 then
					-- d.setf("Pyramid_2floor_monsters", d.getf("Pyramid_2floor_monsters")-1)
					-- if d.getf("Pyramid_2floor_monsters") < 1 then
						-- game.drop_item(settings["Items_2floor"][4], 1)
						-- d.setf("Pyramid_2floor_monsters", 0);  d.setf("PyramidDungeon_CanUseSeal", 1);  d.setf("PyramidDungeon_pergamen", 4);

						-- d.notice("<Antik Piramid>: Bütün antik parþomenleri topladýn! Tableti deþifre etmek için yanýna git ->")
					-- end
				-- end
			-- end
		-- end
		
		-- when 8432.kill begin
			-- local settings = PyramidDungeonLIB.Settings();
			-- if pc.getqf("2_kat_metin") == 0 then
				-- game.drop_item(30800, 1)
				-- pc.setqf("2_kat_metin", 1);
				-- d.notice("<Antik Piramid>: Öldürmen gereken son 3 metin kaldý... ->")
			-- elseif pc.getqf("2_kat_metin") == 1 then
				-- game.drop_item(30801, 1)
				-- pc.setqf("2_kat_metin", 2);
				-- d.notice("<Antik Piramid>: Öldürmen gereken son 2 metin kaldý... ->")
			-- elseif pc.getqf("2_kat_metin") == 2 then
				-- game.drop_item(30802, 1)
				-- pc.setqf("2_kat_metin", 3);
				-- d.notice("<Antik Piramid>: Öldürmen gereken son 1 metin kaldý... ->")
			-- elseif pc.getqf("2_kat_metin") == 3 then
				-- game.drop_item(30803, 1)
				-- d.notice("<Antik Piramid>: Bütün antik parþomenleri topladýn! Tableti deþifre etmek için yanýna git ->")
				-- d.setf("Pyramid_2floor_monsters", 0);  d.setf("PyramidDungeon_CanUseSeal", 1);  d.setf("PyramidDungeon_pergamen", 4);
			-- end
		-- end
		
		-- when 8430.kill with PyramidDungeonLIB.isActive() and not npc.is_pc() and d.getf("PyramidDungeon_level") == 2 begin
			-- game.drop_item(settings["Items_2floor"][2], 1)
		-- end
		
		-- when 8431.kill with PyramidDungeonLIB.isActive() and not npc.is_pc() and d.getf("PyramidDungeon_level") == 2 begin
			-- game.drop_item(settings["Items_2floor"][3], 1)
		-- end
		
		-- when 8432.kill with PyramidDungeonLIB.isActive() and not npc.is_pc() and d.getf("PyramidDungeon_level") == 2 begin
			-- game.drop_item(settings["Items_2floor"][4], 1)
		-- end
		
		-- 2. Floor - Monster spawner	
		-- when PyramidDungeon_2floor_spawner.server_timer begin
			-- if d.select(get_server_timer_arg()) then
				-- d.regen_file("data/dungeon/pyramid_dungeon/regen_2f_a.txt");
				-- d.setf("Pyramid_2floor_monsters", d.count_monster())
			-- end
		-- end
		
		-- 2. Floor - Open seal (9222) and spawn of first boss (4153)
		-- when 9222.chat."Parþomeni deþifre et" with PyramidDungeonLIB.isActive() and d.getf("PyramidDungeon_level") == 2 and d.getf("PyramidDungeon_CanUseSeal") == 1 begin
			-- local settings = PyramidDungeonLIB.Settings(); local Items = settings["Items_2floor"];			
			-- if pc.count_item(Items[1]) < 1 or pc.count_item(Items[2]) < 1 or pc.count_item(Items[3]) < 1 or pc.count_item(Items[4]) < 1 then 
				-- setskin(NOWINDOW)
				-- syschat("<Antik Piramid>: Tableti deþifre için 4 antik parþomenin tümüne sahip olmalýsýn!")
			-- else
				-- setskin(NOWINDOW)
				-- for index = 1, table.getn(Items) do
					-- pc.remove_item(Items[index], pc.count_item(Items[index]));
				-- end
				-- npc.kill()
				
				-- d.notice(string.format("<Antik Piramid>: %s geldi!, onu yok et!", mob_name(4153)));
				-- d.spawn_mob(4153, 306, 126)
			-- end
		-- end
		
		-- 2. Floor - Kill first boss and start timer for jump to next floor
		-- when 4153.kill with PyramidDungeonLIB.isActive() and not npc.is_pc() and d.getf("PyramidDungeon_level") == 2 begin
			-- local settings = PyramidDungeonLIB.Settings();			
			-- PyramidDungeonLIB.clearDungeon()
			
			-- d.notice("<Antik Piramid>: Birkaç saniye sonra bir üst kata gönderileceksin!")
			
			-- server_timer("PyramidDungeon_2st_jump", 20, d.get_map_index())
		-- end
		
		-- 2. Floor - Third floor jumper
		-- when PyramidDungeon_2st_jump.server_timer begin
			-- if d.select(get_server_timer_arg()) then
				-- local settings = PyramidDungeonLIB.Settings(); local position = settings["3f_stone_pos"]; local n = number(1,8); 

				-- d.jump_all(settings["insidePos_3f"][1], settings["insidePos_3f"][2]);
				-- d.setf("PyramidDungeon_level", 3); d.setf("PyramidDungeon_3f_stones_q", 0);
				
				-- for i = 1, 8 do
					-- if (i != n) then
						-- d.set_unique("fake"..i, d.spawn_mob(8478, position[i][1], position[i][2]))
					-- end
				-- end
			
				-- local vid = d.spawn_mob(8478, position[n][1], position[n][2])
				-- d.set_unique ("real",vid)
				
				-- d.regen_file("data/dungeon/pyramid_dungeon/regen_3f_a.txt");
				
				-- d.notice(string.format("<Antik Piramid>: Doðru olan %s bul ve yok et! 15 Dakikan var!", mob_name(8478)));
				-- -d.notice("Ancient pyramid: Be careful, something strong is hiding inside of them!")
				
				-- server_timer("PyramidDungeon_3f_stone", 15*60, d.get_map_index())
			-- end
		-- end

		-- 3. Floor - Destroying real stone + timer to spawn next boss is set
		-- when 8478.kill with PyramidDungeonLIB.isActive() and not npc.is_pc() and d.getf("PyramidDungeon_level") == 3 begin
			-- local settings = PyramidDungeonLIB.Settings();
			-- if d.is_unique_dead("real") then	
				-- d.setf("PyramidDungeon_3f_stones_q", 1);
				-- PyramidDungeonLIB.clearDungeon()
				-- d.purge_area(949600, 2260100, 957800, 2272600)				
				-- d.notice("<Antik Piramid>: Doðru olan metini kestin!")
				-- d.notice(string.format("<Antik Piramid>: %s geliyor!", mob_name(4154)));
			
				-- server_timer("PyramidDungeon_3f_bossspawn", 10, d.get_map_index())
			-- else
				-- d.notice("<Antik Piramid>: Sahte metin taþýydý, tekrar dene!")
			-- end
		-- end
		
		-- 3. Floor - Stone timer, if the stones are not destroyed in 21 minutes, players are kicked out			
		-- when PyramidDungeon_3f_stone.server_timer begin
			-- if d.select(get_server_timer_arg()) then
				-- if d.getf("PyramidDungeon_3f_stones_q") == 0 then
					-- d.notice("<Antik Piramid>: Baþarýsýz oldun!")
					-- d.exit_all();
				-- else
					-- return;
				-- end
			-- end
		-- end
		
		-- 3. Floor - Boss spawn	
		-- when PyramidDungeon_3f_bossspawn.server_timer begin
			-- if d.select(get_server_timer_arg()) then
				-- d.spawn_mob(4154, 577, 136)
			-- end
		-- end
		
		-- 3. Floor - Kill second boss  (4154) and start timer for jump to next floor
		-- when 4154.kill with PyramidDungeonLIB.isActive() and not npc.is_pc() and d.getf("PyramidDungeon_level") == 3 begin
			-- local settings = PyramidDungeonLIB.Settings();			
			-- PyramidDungeonLIB.clearDungeon()
			
			-- d.notice("<Antik Piramid>: Birkaç saniye sonra bir üst kata gönderileceksin!")
			
			-- server_timer("PyramidDungeon_3rd_jump", 15, d.get_map_index())
		-- end
		
		-- 3. Floor - Fourth floor jumper (into the maze)
		-- when PyramidDungeon_3rd_jump.server_timer begin
			-- if d.select(get_server_timer_arg()) then
				-- local settings = PyramidDungeonLIB.Settings();
				
				-- d.setf("PyramidDungeon_level", 4);
				-- d.jump_all(settings["insidePos_4f"][1], settings["insidePos_4f"][2]);
				-- d.set_regen_file("data/dungeon/pyramid_dungeon/regen_4f_a.txt");
				-- d.regen_file("data/dungeon/pyramid_dungeon/regen_4f_b.txt");
				-- local Boss3Pos = settings["4f_boss_pos"]; local Boss1Count = table.getn(Boss3Pos); local randomNumber = number(1, table.getn(Boss3Pos))	
				-- for index = 1, Boss1Count, 1 do
					-- local RealBoss3f = d.spawn_mob(4155, Boss3Pos[index][1], Boss3Pos[index][2])
					-- if index == randomNumber then
						-- d.set_unique("real_boss", RealBoss3f)
					-- end
				-- end
				
				-- d.notice("<Antik Piramid>: Labirentin sonuna ýþýnlandýn devam edebilirsin!")			
				-- d.notice(string.format("<Antik Piramid>: Þimdi doðru %s'u bulup öldürmek zorundasýn!", mob_name(4155)));			
			-- end
		-- end
		
		-- 4. Floor - 3rd boss killing
		-- when 4155.kill with PyramidDungeonLIB.isActive() and not npc.is_pc() and d.getf("PyramidDungeon_level") == 4 begin
			-- local settings = PyramidDungeonLIB.Settings();			
			-- if d.is_unique_dead("real_boss") then	
				-- PyramidDungeonLIB.clearDungeon()
			
				-- d.notice(string.format("<Antik Piramid>: Doðru boss'u öldürdün : %s", mob_name(4155)));
				-- d.notice("<Antik Piramid>: Birkaç saniye sonra bir üst kata gönderileceksin")			
			
				-- server_timer("PyramidDungeon_4th_jump", 15, d.get_map_index())
			-- else
				-- d.notice("<Antik Piramid>: Yanlýþ boss'u öldürdün tekrar dene!")			
				-- d.notice(string.format("<Antik Piramid>: Yanlýþ boss'u öldürdün tekrar dene %s!", mob_name(4155)));
			-- end
		-- end
		
		-- 4. Floor - 4th jump + next floor set
		-- when PyramidDungeon_4th_jump.server_timer begin
			-- if d.select(get_server_timer_arg()) then
				-- local settings = PyramidDungeonLIB.Settings();
				
				-- d.setf("PyramidDungeon_level", 5); d.setf("PyramidDungeon_5f_monsters1", 1); d.setf("PyramidDungeon_5f_NpcMech", 1);
				
				-- for i = 1,4 do
					-- d.set_unique("anubis_head_"..i, d.spawn_mob_dir(9221, settings["5f_npc_pos"][i][1], settings["5f_npc_pos"][i][2],settings["5f_npc_pos"][i][3]))
				-- end
				-- d.set_regen_file("data/dungeon/pyramid_dungeon/regen_5f_a.txt");
				
				-- d.jump_all(settings["insidePos_5f"][1], settings["insidePos_5f"][2]);
				-- d.notice(string.format("<Antik Piramid>: Bütün %s, yok et! . <Dikkat et kendi mekanýzmasý vardýr! >", mob_name(9221)))			
				-- d.notice("<Antik Piramid>: Doðru sýrayla yok etmelisin !");			
			-- end
		-- end
		
		-- 5. Floor - Killing first wave of monsters
		-- when kill with PyramidDungeonLIB.isActive() and not npc.is_pc() and d.getf("PyramidDungeon_level") == 5 begin
			-- local settings = PyramidDungeonLIB.Settings();
			
			-- if pc.get_x() > 9063 and pc.get_y() > 23515 and pc.get_x() < 9206 and 23599 then				
				-- if d.getf("PyramidDungeon_5f_monsters1") == 1 then
					-- if number(1,100) == 1 then
						-- d.setf("PyramidDungeon_5f_monsters1", 2);
						-- game.drop_item(settings["Item_5floor"], 1);
						-- d.clear_regen();
						-- d.purge_area(906300, 2351500, 920600, 2359900);
					-- end
				-- elseif d.getf("PyramidDungeon_5f_monsters2") == 1 then
					-- if number(1,150) == 1 then
						-- d.setf("PyramidDungeon_5f_monsters2", 2);
						-- game.drop_item(settings["Item_5floor"], 1);
						-- d.clear_regen();
						-- d.purge_area(906300, 2351500, 920600, 2359900);
					-- end
				-- end
			-- end
		-- end
		
		-- 5. Destroying 9333 (anubis head) by 30804
		-- when 9221.take with item.get_vnum() == 30804 and PyramidDungeonLIB.isActive() and d.getf("PyramidDungeon_level") == 5 begin
			-- if d.getf("PyramidDungeon_5f_NpcMech") == 1 then
				-- if npc.get_vid() == d.get_unique_vid("anubis_head_1") then
					-- npc.kill();
					-- d.kill_unique("anubis_head_1")
					-- item.remove();
					-- d.spawn_mob(8471, 178, 1054);
					-- d.setf("PyramidDungeon_5f_NpcMech", 2); d.setf("PyramidDungeon_5f_Stone1", 1);
					-- d.set_regen_file("data/dungeon/pyramid_dungeon/regen_5f_a.txt");
					-- d.notice("<Antik Piramid>: Doðru olan heykeli yok ettin!");
					-- d.notice(string.format("<Antik Piramid>: Sýradaki tableti bulmak için %s yok etmelisin!", mob_name(8479)));
				-- else
					-- item.remove();
					-- d.setf("PyramidDungeon_5f_monsters1", 1);
					-- d.set_regen_file("data/dungeon/pyramid_dungeon/regen_5f_a.txt");
					
					-- d.notice("<Antik Piramid>: Sýralaman yanlýþ tekrar dene!");
				-- end
			-- elseif d.getf("PyramidDungeon_5f_NpcMech") == 2 then					
				-- if npc.get_vid() == d.get_unique_vid("anubis_head_2") then
					-- item.remove();
					-- d.kill_unique("anubis_head_2")
					
					-- d.setf("PyramidDungeon_5f_NpcMech", 3); d.setf("PyramidDungeon_5f_monsters2", 1);
					-- d.set_regen_file("data/dungeon/pyramid_dungeon/regen_5f_a.txt");
					-- d.notice("<Antik Piramid>: Doðru olan heykeli yok ettin!");
					-- d.notice(string.format("<Antik Piramid>: Sýradaki tableti bulmak için %s yok etmelisin!", mob_name(8479)));
					-- server_timer("PyramidDungeon_5th_monster2", 5, d.get_map_index())
				-- else	
					-- item.remove();
					-- d.setf("PyramidDungeon_5f_Stone1", 1);
					-- -d.spawn_mob(8479, 178, 1054);
					-- d.set_regen_file("data/dungeon/pyramid_dungeon/regen_5f_a.txt");
					-- d.notice("<Antik Piramid>: Sýralaman yanlýþ tekrar dene!");
				-- end
			-- elseif d.getf("PyramidDungeon_5f_NpcMech") == 3 then					
				-- if npc.get_vid() == d.get_unique_vid("anubis_head_3") then
					-- item.remove();
					-- d.kill_unique("anubis_head_3")
					
					-- d.notice("<Antik Piramid>: Doðru olan heykeli yok ettin!");
					-- d.notice(string.format("<Antik Piramid>: Sýradaki tableti bulmak için %s yok etmelisin!", mob_name(8479)));
					
					-- d.setf("PyramidDungeon_5f_NpcMech", 4); d.setf("PyramidDungeon_5f_Stone2", 1);
					-- d.regen_file("data/dungeon/pyramid_dungeon/regen_5f_a.txt");
				-- else
					-- item.remove();
					-- d.setf("PyramidDungeon_5f_monsters2", 1);
					-- d.set_regen_file("data/dungeon/pyramid_dungeon/regen_5f_a.txt");

					-- d.notice("<Antik Piramid>: Sýralaman yanlýþ tekrar dene!");
				-- end
			-- elseif d.getf("PyramidDungeon_5f_NpcMech") == 4 then					
				-- if npc.get_vid() == d.get_unique_vid("anubis_head_4") then
					-- item.remove();
					-- d.kill_unique("anubis_head_4")
					-- d.setf("PyramidDungeon_5f_NpcMech", 0); d.setf("PyramidDungeon_5f_Boss", 1);
					
					-- d.notice("<Antik Piramid>: Harika þimdi sadece uyarmak için geliyor!!!");
					-- d.notice(string.format("<Antik Piramid>: Harika þimdi sadece uyarmak için %s geliyor!", mob_name(4156)));
					-- d.notice("<Antik Piramid>: Çok dikkatli olmalýsýn!");
					
					-- server_timer("PyramidDungeon_5th_boss", 10, d.get_map_index())
				-- else
					-- syschat("<Antik Piramid>: Ters giden birþey mi var ?")
					-- return;
				-- end
			-- end
		-- end
		
		-- 5kat metin öldürüldü
		-- when 8479.kill begin
			-- pc.give_item2(30804, 1)
		-- end
			
				
		-- 5. Floor - Spawner timer for second wave of monsters	
		-- when PyramidDungeon_5th_monster2.server_timer begin
			-- if d.select(get_server_timer_arg()) then
				-- d.set_regen_file("data/dungeon/pyramid_dungeon/regen_5f_a.txt");
			-- end
		-- end
		
				
		-- 5. Floor - Destroying stone to get 30804
		-- when 8479.kill with PyramidDungeonLIB.isActive() and not npc.is_pc() and d.getf("PyramidDungeon_level") == 5 begin
			-- local settings = PyramidDungeonLIB.Settings(); local Stone_count = 6;
			
			-- if d.getf("PyramidDungeon_5f_Stone1") == 1 then
				-- d.setf("PyramidDungeon_5f_Stone1", 2);
				-- game.drop_item(settings["Item_5floor"], 1);
			-- elseif d.getf("PyramidDungeon_5f_Stone2") == 1 then
				-- d.setf("PyramidDungeon_5f_Stone2_k", d.getf("PyramidDungeon_5f_Stone2_k")+1);
				-- if (d.getf("PyramidDungeon_5f_Stone2_k") < Stone_count) then
					-- d.notice(string.format("<Antik Piramid>: %d doðru metin taþýydý!", Stone_count-d.getf("PyramidDungeon_5f_Stone2_k")))
				-- else
					-- d.setf("PyramidDungeon_5f_Stone2", 2);
					-- game.drop_item(settings["Item_5floor"], 1);
				-- end
			-- end
		-- end
				
		-- 5. Floor - Spawner timer for second wave of monsters	
		-- when PyramidDungeon_5th_boss.server_timer begin
			-- if d.select(get_server_timer_arg()) then
				-- d.spawn_mob(4156, 177, 1031);
			-- end
		-- end
			
		-- 5. Floor - 4th boss
		-- when 4156.kill with PyramidDungeonLIB.isActive() and not npc.is_pc() and d.getf("PyramidDungeon_level") == 5 begin
			-- PyramidDungeonLIB.clearDungeon()			
			-- d.notice("<Antik Piramid>: Birkaç saniye sonra bir üst kata gönderileceksin")			
			
			-- server_timer("PyramidDungeon_5th_jump", 15, d.get_map_index())
		-- end
		
		-- 5. Floor - 5th jump to the last floor
		-- when PyramidDungeon_5th_jump.server_timer begin
			-- if d.select(get_server_timer_arg()) then
				-- local settings = PyramidDungeonLIB.Settings();
				
				-- d.regen_file("data/dungeon/pyramid_dungeon/regen_6f_a.txt");
				-- d.regen_file("data/dungeon/pyramid_dungeon/regen_6f_b.txt");
				-- local vid1 = d.spawn_mob_dir(9219, 1110, 1173, 7);
				-- d.set_unique("tastan", vid1);
				
				-- d.setf("PyramidDungeon_level", 6); d.setf("PyramidDungeon_6f_monsters1", 1); d.setf("PyramidDungeon_KeyPickUp", 0); d.setf("PyramidDungeon_CanUseKey", 0); d.setf("PyramidDungeon_6f_monsters1_c", d.count_monster())
				
				-- d.jump_all(settings["insidePos_6f"][1], settings["insidePos_6f"][2]);
				-- d.notice(string.format("<Antik Piramid>: Kadim Sfenks gelmesi için %s yok etmelisin!", mob_name(9217)))			
				-- d.notice("<Antik Piramid>: Þimdi bütün canavarlarý öldürmelisin!");			
			-- end
		-- end
		
		-- 6. Floor - Killing monsters until the key is dropped
		-- when kill with PyramidDungeonLIB.isActive() and not npc.is_pc() and d.getf("PyramidDungeon_level") == 6 begin
			-- local settings = PyramidDungeonLIB.Settings();
			-- if pc.get_x() > 9742 and pc.get_y() > 23584 and pc.get_x() < 10011 and 23764 then				
				-- if d.getf("PyramidDungeon_6f_monsters1") == 1 then
				
					-- d.setf("PyramidDungeon_6f_monsters1_c", d.getf("PyramidDungeon_6f_monsters1_c")-1)
					
					-- if d.getf("PyramidDungeon_6f_monsters1_c") < 1 then
						-- d.setf("PyramidDungeon_6f_monsters1", 2); d.setf("PyramidDungeon_KeyPickUp", 1);
						-- d.clear_regen();
						-- d.purge_area(974200, 2358400, 1001100, 2376400);
						
						-- d.notice(string.format("<Antik Piramid>: Büyü gitti! Büyü çözüldü antik anahtarý al ve %s'in üzerine sürükle!", mob_name(9217)));
					-- end
					
				-- elseif d.getf("PyramidDungeon_6f_monsters2") == 1 then --- Killing all monsters in the second wave 
				
					-- d.setf("PyramidDungeon_6f_monsters2_c", d.getf("PyramidDungeon_6f_monsters2_c")-1);					
					-- if d.getf("PyramidDungeon_6f_monsters2_c") < 1 then
						
						-- d.setf("PyramidDungeon_6f_monsters2", 2); d.setf("PyramidDungeon_6f_monsters2_c", 0); d.setf("PyramidDungeon_KeyPickUp", 2);
											
						-- d.notice(string.format("<Antik Piramid>: Büyü gitti! Büyü çözüldü antik anahtarý al ve %s'in üzerine sürükle!", mob_name(9217)));
					-- end
				-- end
			-- end
		-- end
		
		-- 6. Floor - Picking the ankh key (9335)
		-- when 9218.click with PyramidDungeonLIB.isActive() and d.getf("PyramidDungeon_level") == 6 begin
			-- local settings = PyramidDungeonLIB.Settings();
			
			-- if d.getf("PyramidDungeon_KeyPickUp") == 0 then
				-- syschat("<Antik Piramid>: Dokunman yasaklandý!")
				-- syschat("<Antik Piramid>: Bazý kara büyüler ona dokunmaný yasakladý! Çözmen gerekli")
				
			-- elseif d.getf("PyramidDungeon_KeyPickUp") == 1 then
				-- d.setf("PyramidDungeon_KeyPickUp", 0); d.setf("PyramidDungeon_CanUseKey", 1);
				-- pc.give_item2(settings["Item_6floor"], 1)
				-- npc.purge()
				
			-- elseif d.getf("PyramidDungeon_KeyPickUp") == 2 then
				-- d.setf("PyramidDungeon_KeyPickUp", 0); d.setf("PyramidDungeon_CanUseKey", 2);
				-- pc.give_item2(settings["Item_6floor"], 1)
				-- npc.purge()
			-- end
		-- end
		
		-- 6. Floor - Opening the pillars of wajdet (9217)
		-- when 9217.take with item.get_vnum() == PyramidDungeonLIB.Settings()["Item_6floor"] and PyramidDungeonLIB.isActive() and d.getf("PyramidDungeon_level") == 6 begin
			-- local settings = PyramidDungeonLIB.Settings();
			-- if d.getf("PyramidDungeon_CanUseKey") == 0 then
				-- syschat("<Antik Piramid>: Þžuan iþlem yapamazsýn!")
				
			-- elseif d.getf("PyramidDungeon_CanUseKey") == 1 then
				-- d.setf("PyramidDungeon_CanUseKey", 0); d.setf("PyramidDungeon_6f_stone", 0);
				-- item.remove()
				-- npc.kill()
				
				
				-- d.notice(string.format("<Antik Piramid>: %s geliyor!!.", mob_name(8480)));
				-- d.notice("<Antik Piramid>: Antik anahtardaki büyüyü kaldýrmak Antin Sütunu yok etmelisin !!.");
				-- d.notice("<Antik Piramid>: Dikkatli olmalýsýn içinden yardýmcý canavarlar çýkarabilir!");
				-- d.notice("--------------------------------------------------------------");
				-- d.notice("<Antik Piramid>: 5 Dakika içinde yok edebilirsen diger canavarlarla ugraþmayacaksýn!");
				
				-- server_timer("PyramidDungeon_6th_StoneSpawn", 5, d.get_map_index())
				
			-- elseif d.getf("PyramidDungeon_CanUseKey") == 2 then
				-- d.setf("PyramidDungeon_CanUseKey", 0);
				-- item.remove()
				-- PyramidDungeonLIB.clearDungeon()
				
				-- d.kill_unique("tastan")
				-- local vid = d.spawn_mob_dir(4157, 995, 1143, 7);
				-- d.set_unique("SphinxBoss", vid);
				
				-- server_timer("PyramidDungeon_6th_PillarSpawn", settings["time_until_pillar_is_spawned"], d.get_map_index())
				
			-- end
		-- end
				
		-- 6. Floor - Stone spawner timer
		-- when PyramidDungeon_6th_StoneSpawn.server_timer begin
			-- local settings = PyramidDungeonLIB.Settings();
			
			-- if d.select(get_server_timer_arg()) then
				-- d.spawn_mob(8480, 948, 1142);
				-- d.setf("PyramidDungeon_6f_Pillar_n", 0);
				-- server_timer("PyramidDungeon_6f_stone_k", settings["time_to_destroy_final_stone"], d.get_map_index())
			-- end
		-- end
		
		-- 6. Floor - Stone destroying
		-- when 8480.kill with PyramidDungeonLIB.isActive() and d.getf("PyramidDungeon_level") == 6 begin
			-- if d.getf("PyramidDungeon_6f_stone") == 0 then
				-- d.setf("PyramidDungeon_6f_stone", 2); d.setf("PyramidDungeon_KeyPickUp", 2);
				-- clear_server_timer("PyramidDungeon_6f_stone_k", get_server_timer_arg())
				
				-- d.notice(string.format("<Antik Piramid>: Büyü çözüldü! Kilit çözüldü : %s", mob_name(9218)));
				
			-- elseif d.getf("PyramidDungeon_6f_stone") == 1 then
				-- d.notice("<Antik Piramid>: Çok yavaþ hareket ettigin için canavarlar seni fark etti!")
				-- d.notice("<Antik Piramid>: Tümünü yok etmelisin!")
				
				-- server_timer("PyramidDungeon_6f_monster2", 12, d.get_map_index())
			-- end
		-- end
			
		-- 6. Floor - Stone spawner timer
		-- when PyramidDungeon_6f_stone_k.server_timer begin
			-- if d.select(get_server_timer_arg()) then
				-- if d.getf("PyramidDungeon_6f_stone") == 0 then
					-- d.setf("PyramidDungeon_6f_stone", 1);
				-- else
					-- return;
				-- end
			-- end
		-- end
			
		-- 6. Floor - Stone spawner timer
		-- when PyramidDungeon_6f_monster2.server_timer begin
			-- if d.select(get_server_timer_arg()) then
				-- d.regen_file("data/dungeon/pyramid_dungeon/regen_6f_b.txt");
				-- d.setf("PyramidDungeon_6f_monsters2", 1); d.setf("PyramidDungeon_6f_monsters2_c", d.count_monster())
			-- end
		-- end
		
		-- 6. Floor - Pillar spawn
		-- when PyramidDungeon_6th_PillarSpawn.server_timer begin
			-- local settings = PyramidDungeonLIB.Settings();
			
			-- if d.select(get_server_timer_arg()) then
				-- if d.getf("PyramidDungeon_6f_Pillar_n") == 0 then
					-- d.setf("PyramidDungeon_6f_pillar_k", 0);
					-- d.spawn_mob_dir(8480, 961, 1142, 3);
					
					-- d.notice(string.format("<Antik Piramid>: %s geldi!!", mob_name(8480)));
					-- d.notice("<Antik Piramid>: 3 Dakika içinde yok etmelisin. Yoksa zindan kapanacak!!");
					
					-- server_timer("PyramidDungeon_6f_pillar_d", settings["time_until_pillar_is_killed"], d.get_map_index())
				-- end
			-- end
		-- end
		
		-- 6. Floor - Pillar destroying
		-- when 8480.kill with PyramidDungeonLIB.isActive() and d.getf("PyramidDungeon_level") == 6 begin
			-- d.setf("PyramidDungeon_6f_pillar_k", 1);
			
			-- d.notice(string.format("<Antik Piramid>: %s artýk büyü yapma becerisini kaybetti!", mob_name(4158)));
			-- d.notice("<Antik Piramid>: Onu öldür!!");
		-- end
			
		-- 6. Floor - If the pillar (8471) is not destroyed before this timer, dungeon is closed.
		-- when PyramidDungeon_6f_pillar_d.server_timer begin
			-- local settings = PyramidDungeonLIB.Settings();
			
			-- if d.select(get_server_timer_arg()) then
				-- if d.getf("PyramidDungeon_6f_pillar_k") == 0 then
					-- d.purge_area(974200, 2358400, 1001100, 2376400);
					-- d.notice("<Antik Piramid>: Baþarýsýz oldun!")
					-- d.notice(string.format("<Antik Piramid>: %s baþarýyla öldürüldü!", mob_name(4157)));
					
					-- server_timer("PyramidDungeon_final_exit", 5, d.get_map_index())
				-- else
					-- return
				-- end
			-- end
		-- end
		
		-- 6. Floor - Sphinx kill and final chest spawn
		when 4157.kill with PyramidDungeonLIB.isActive() and d.getf("PyramidDungeon_level") == 1 begin
			-- PyramidDungeonLIB.clearDungeon();
			-- PyramidDungeonLIB.clearTimers();
			pc.setqf("antik_p_giris", 0)
			d.zodiac_notice_clear()
			d.zodiac_notice("Tebrik ediyoruz, zindaný baþarýyla tamamladýn. 3 Dakika sonra zindan kapanacak!")
			-- d.notice("<Epsilon2>: Tebrik ediyoruz, zindaný baþarýyla tamamladýn!");
			-- d.notice("<Epsilon2>: Ödülünü veriyoruz!");
			-- d.notice("<Epsilon2>: 3 Dakika sonra zindan kapanacak!.");
			
			-- d.setf("PyramidDungeon_CanTakeReward", 1); d.setf("PyramidDungeon_6f_Pillar_n", 1);
			-- d.spawn_mob_dir(9220, 992, 1142, 7)
			-- d.spawn_mob_dir(9209, 962, 1142, 3)
			
			server_timer("sfenksbitti", 180, d.get_map_index())
		end
		
		--- 6. Floor - Getting reward
		-- when 9220.chat."Ödüller" with PyramidDungeonLIB.isActive() and d.getf("PyramidDungeon_level") == 6 and d.getf("PyramidDungeon_CanTakeReward") == 1 begin
			-- local settings = PyramidDungeonLIB.Settings();
			-- if pc.getqf("PyramidDungeon_reward") == 0 then
				-- pc.setqf("PyramidDungeon_reward", 1)
				-- pc.give_item2(settings["Item_reward"], 1)
				-- addimage(25, 10, "pyramid_dungeon_bg1.tga"); addimage(225, 150, "pyramid_npc7.tga")
				-- say("[ENTER][ENTER]")
				-- say_title("Ödüllerin[ENTER]")
				-- say_reward("Alýnan ödüller :")
				-- say_item(""..item_name(settings["Item_reward"]).."", settings["Item_reward"], "")
				-- return
			-- else
				-- setskin(NOWINDOW)
				-- syschat("Ancient pyramid: Ödülünü zaten aldýn!")
			-- end
		-- end
		
		--- 6. Floor - PLayers can teleport out of dungeon before its closed
		-- when 9209.chat."Zindandan Çýk" with PyramidDungeonLIB.isActive() and d.getf("PyramidDungeon_level") == 6 begin
			-- say_size(350,350); addimage(25, 10, "pyramid_dungeon_bg1.tga"); addimage(220, 200, "pyramid_guard.tga")
			-- say("[ENTER][ENTER]")
			-- say_title(string.format("%s:[ENTER]", mob_name(npc.get_race())))
			-- say("Zor bir iþti deðil mi?[ENTER]Ä°yi iþ çýkardýn tekrar görüþmek üzere!")			
			-- wait()
			-- setskin(NOWINDOW)
			-- pc.warp(731300, 2310400)
		-- end
		
		--- After the full dungeon time is up, this timer notice you and set 3 seconds timer for exit
		-- when PyramidDungeon_full_timer.server_timer begin
			-- if d.select(get_server_timer_arg()) then
				-- d.notice("<Antik Piramid>: Baþarýsýz oldun!")
				
				-- server_timer("PyramidDungeon_final_exit", 3, d.get_map_index())
			-- end
		-- end
		
		--- After that timer, whole dungeon is closed
		-- when PyramidDungeon_final_exit.server_timer begin
			-- if d.select(get_server_timer_arg()) then
				-- d.exit_all()
			-- end
		-- end
	
		------------
		--Dungeon enter
		------------
		when 9209.chat."Piramide Gir" with not PyramidDungeonLIB.isActive() begin
			local settings = PyramidDungeonLIB.Settings();
			say_size(350,350); addimage(25, 10, "pyramid_dungeon_bg1.tga"); addimage(220, 200, "pyramid_guard.tga")
			say("[ENTER][ENTER]")
			say_title(string.format("%s:[ENTER]", mob_name(npc.get_race())))
			say("Ýnsanlar görkemli tanrýlarý unuttu[ENTER]þimdiye kadar var olan en büyük güç! Geri döndü![ENTER]Karanlýk bir güç onlarý yeraltý dünyasýndan geri getirdi.[ENTER]Hâlâ bu piramidin içindeler ama gücümün sýnýrlarý var.[ENTER]Onlarý hissediyorum, her gün daha güçlüler ve deniyorlar[ENTER]dýþarý çýkýp dünyayý yok etmek için.")
			wait()
			if party.is_party() then
				say_reward("Bu zindana girmek istiyorsanýz [ENTER] bir grubun parçasý olamazsýnýz.")
				return
			else
			
				if game.get_event_flag("antik_piramid") == 0 then
					say("Þuanda zindan bakým modunda. Açýlýnca bilgi verilecek.")
					return
				end
				if get_time() < pc.getqf("piramid_zindan_sure") then
					say("Soðuma süren hala bitmedi.[ENTER]")
					say_reward("Beklemen gereken süre: "..dungeon_get_duration(pc.getqf("piramid_zindan_sure") - get_global_time()).."")
					return
				end
				if (pc.get_level() < settings["minimumLevel"]) then
					say(string.format("Zindana girmek için en az  %d level olmalýsýn.", settings["minimumLevel"]))
					return
				end
				if (pc.count_item(settings["pyramid_ticket"]) < 1) then
					say("Antik Piramide girmek istiyorsan:[ENTER]")
					say_item(""..item_name(settings["pyramid_ticket"]).."", settings["pyramid_ticket"], "")
					say("itemine sahip olmalýsýn.")
					return
				end
				say_size(350,350); addimage(25, 10, "pyramid_dungeon_bg1.tga"); addimage(220, 200, "pyramid_guard.tga")
				say("[ENTER][ENTER]")
				say_title(string.format("%s:[ENTER]", mob_name(npc.get_race())))
				say("Ýçeri girmek son derece tehlikelidir. Keþfedilmemiþ kuvvetler oraya hükmediyor.")
				say_reward("Onu durdurabileceðini düþünüyor musun?")
				if (select("Evet", "Hayýr, o kadar güçlü degilim!") == 1) then
					say_size(350,350); addimage(25, 10, "pyramid_dungeon_bg1.tga"); addimage(225, 200, "pyramid_guard.tga")
					say_reward("[ENTER]Zindaný 1 saat içinde bitirmelisiniz.[ENTER]Aksi takdirde dýþarý atýlýrsýnýz.[ENTER][ENTER]Ýyi þanslar dileriz!")
					wait()
					pc.remove_item(30799, 1);	
					pc.setqf("piramid_zindan_sure", get_time()+60*60*3)
					pc.setqf("antik_p_giris", 1)
					return d.new_jump(settings["inside_index"], settings["insidePos_1f"][1]*100, settings["insidePos_1f"][2]*100); 
				end
			end
		end
		
		when 9209.chat."Admin" with pc.is_gm() and not PyramidDungeonLIB.isActive() begin
			local settings = PyramidDungeonLIB.Settings();
			say_size(350,350); addimage(25, 10, "pyramid_dungeon_bg1.tga"); addimage(220, 200, "pyramid_guard.tga")
			say("[ENTER][ENTER]")
			say_title(string.format("%s:[ENTER]", mob_name(npc.get_race())))
			say("Ýnsanlar görkemli tanrýlarý unuttu[ENTER]þimdiye kadar var olan en büyük güç! Geri döndü![ENTER]Karanlýk bir güç onlarý yeraltý dünyasýndan geri getirdi.[ENTER]Hâlâ bu piramidin içindeler ama gücümün sýnýrlarý var.[ENTER]Onlarý hissediyorum, her gün daha güçlüler ve deniyorlar[ENTER]dýþarý çýkýp dünyayý yok etmek için.")
			wait()
			if party.is_party() then
				say_reward("Bu zindana girmek istiyorsanýz [ENTER] bir grubun parçasý olamazsýnýz.")
				return
			else
			
				-- if game.get_event_flag("antik_piramid") == 1 then
					-- say("Þuanda zindan bakým modunda. Açýlýnca bilgi verilecek.")
					-- return
				-- end
				-- if get_time() < pc.getqf("piramid_zindan_sure") then
					-- say("Soðuma süren hala bitmedi.[ENTER]")
					-- say_reward("Beklemen gereken süre: "..dungeon_get_duration(pc.getqf("piramid_zindan_sure") - get_global_time()).."")
					-- return
				-- end
				-- if (pc.get_level() < settings["minimumLevel"]) then
					-- say(string.format("Zindana girmek için en az  %d level olmalýsýn.", settings["minimumLevel"]))
					-- return
				-- end
				-- if (pc.count_item(settings["pyramid_ticket"]) < 1) then
					-- say("Antik Piramide girmek istiyorsan:[ENTER]")
					-- say_item(""..item_name(settings["pyramid_ticket"]).."", settings["pyramid_ticket"], "")
					-- say("itemine sahip olmalýsýn.")
					-- return
				-- end
				say_size(350,350); addimage(25, 10, "pyramid_dungeon_bg1.tga"); addimage(220, 200, "pyramid_guard.tga")
				say("[ENTER][ENTER]")
				say_title(string.format("%s:[ENTER]", mob_name(npc.get_race())))
				say("Ýçeri girmek son derece tehlikelidir. Keþfedilmemiþ kuvvetler oraya hükmediyor.")
				say_reward("Onu durdurabileceðini düþünüyor musun?")
				if (select("Evet", "Hayýr, o kadar güçlü degilim!") == 1) then
					say_size(350,350); addimage(25, 10, "pyramid_dungeon_bg1.tga"); addimage(225, 200, "pyramid_guard.tga")
					say_reward("[ENTER]Zindaný 1 saat içinde bitirmelisiniz.[ENTER]Aksi takdirde dýþarý atýlýrsýnýz.[ENTER][ENTER]Ýyi þanslar dileriz!")
					wait()
					pc.remove_item(30799, 1);	
					pc.setqf("piramid_zindan_sure", get_time()+60*60*3)
					pc.setqf("antik_p_giris", 1)
					return d.new_jump(settings["inside_index"], settings["insidePos_1f"][1]*100, settings["insidePos_1f"][2]*100); 
				end
			end
		end
		
		
		------------
		--Time reset - ONLY FOR GM 
		------------
		when 9209.chat."Zamaný Sýfýrla" with pc.is_gm() and not PyramidDungeonLIB.isActive() begin
			local settings = PyramidDungeonLIB.Settings();
			addimage(25, 10, "pyramid_dungeon_bg1.tga"); addimage(225, 150, "pyramid_guard.tga")
			say("[ENTER][ENTER]")
			if select("Sýfýrla","Close") == 2 then return end
				addimage(25, 10, "pyramid_dungeon_bg1.tga"); addimage(225, 150, "pyramid_guard.tga")
				say("[ENTER][ENTER]")
				say_title(string.format("%s:[ENTER]", mob_name(npc.get_race())))
				pc.setqf("piramid_zindan_sure", 0)
				say("[ENTER]Zaman sýfýrlandý.")
				
		end
		
		------------
		-- Set waiting time for next enter (1 hour - 3600 seconds)
		------------
		
		when logout with PyramidDungeonLIB.isActive() begin
			local settings = PyramidDungeonLIB.Settings();
			if not pc.is_gm() then
				pc.setf("pyramid_dungeon","exit_pyramid_dungeon_time", get_global_time())
				pc.setqf("pyramid_dungeon", get_time() + settings["dungeon_cooldown"])
			end
		end
	end
end	
		
		
