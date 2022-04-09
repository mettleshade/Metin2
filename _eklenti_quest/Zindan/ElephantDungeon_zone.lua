quest ElephantDungeon_zone begin
	state start begin
		when login with ElephantDungeonLIB.isActive() begin
			local settings = ElephantDungeonLIB.Settings();
			
			--ElephantDungeonLIB.setOutCoords()
			-- d.setf("ElephantDungeon_level", 1); d.setf("ElephantDungeon_KeyCollect", 0); d.setf("ElephantDungeon_SmallDoorOpen", 0); d.setf("ElephantDungeon_CanDestroy_stone1", 0);
			-- d.regen_file("/usr/home/game/share/data/dungeon/elephant_dungeon/regen_1a.txt");
			-- d.regen_file("/usr/home/game/share/data/dungeon/elephant_dungeon/regen_1b.txt");
			-- d.setf("Elephant_phase1_monsters", d.count_monster());
			
			-- server_timer("ElephantDungeon_full_timer", settings["dungeon_timer"], d.get_map_index())
			
			if pc.getqf("ganesha_giris_aktif") > 0 then
				pc.setqf("ganesha_giris_aktif", 0)
				d.setf("ElephantDungeon_level", 12);
				d.setf("ElephantDungeon_SpecialDamageTime", 0)
				server_timer("ElephantDungeon_GaneshaSpawner", 10, d.get_map_index())
				
				d.notice("Ganesha Tapýnaðý: Hoþgeldin bizde seni bekliyorduk..!")
			end
		end
		
		-- Stage 1 - Phase 1 - kill first wave of monsters to be able get a key
		-- when kill with ElephantDungeonLIB.isActive() and not npc.is_pc() and d.getf("ElephantDungeon_level") == 1 begin
			-- local settings = ElephantDungeonLIB.Settings();
			
			-- d.setf("Elephant_phase1_monsters", d.getf("Elephant_phase1_monsters")-1)
			-- if d.getf("Elephant_phase1_monsters") < 1 then
				-- d.notice("Ganesha Tapýnaðý: Tüm Canavarlarý Alt Ettin.")
				-- d.notice(string.format("Ganesha Tapýnaðý: Þimdi %s alabilirsin!", mob_name(9330)))
				
				-- d.setf("ElephantDungeon_KeyCollect", 1); d.setf("ElephantDungeon_level", 2);
			-- end
		-- end
		
		-- Stage 1 - All phases - Takes the gold key (30975) to be able open the door
		-- when 9330.click with ElephantDungeonLIB.isActive() begin
			-- local settings = ElephantDungeonLIB.Settings();
			-- if d.getf("ElephantDungeon_KeyCollect") == 1 then
				-- npc.purge()
				-- pc.give_item2(settings["key"], 1)
				-- d.setf("ElephantDungeon_KeyCollect", 0); d.setf("ElephantDungeon_SmallDoorOpen", 1);
			-- else
				-- chat("Ganesha Tapýnaðý: Þu anda alamazsýn.")
			-- end
		-- end
		
		-- Stage 1 - All phases - Opening the door		
		-- when 9322.take with ElephantDungeonLIB.isActive() begin
			-- local settings = ElephantDungeonLIB.Settings();
			-- if item.get_vnum() == settings["key"] then
				-- if d.getf("ElephantDungeon_SmallDoorOpen") == 1 then -- Phase 1
					-- item.remove()
					-- npc.kill()
					-- d.setf("KapiAcikmi", 1)
					-- d.setf("ElephantDungeon_SmallDoorOpen", 0);
				-- else
					-- chat("Ganesha Tapýnaðý: Þu anda kapýyý açamazsýn.")
				-- end
			-- end
		-- end
		
		-- Stage 1 - All phases - Destroy crystal by clicking it and spawn metin (8467) - spawn of stone is set in mob_proto
		-- when 9324.click with ElephantDungeonLIB.isActive() begin
			-- if d.getf("KapiAcikmi") == 1 then
				-- npc.kill()
				-- d.setf("ElephantDungeon_CanDestroy_stone1", 1);
				-- d.notice(string.format("Ganesha Tapýnaðý: %s'i þimdi yok et!", mob_name(8467)))
				-- d.setf("KapiAcikmi", 0)
			-- else
				-- chat("Ganesha Tapýnaðý: Kilidi çözmek için kapýyý açman gerekli.")
			-- end
		-- end
		
		-- Stage 1 - All phases - Destroying meitn(8467) which comes from evil crystal(9324), drop item 30796 (piece of statue) and go to build the statue
		-- when kill with ElephantDungeonLIB.isActive() and not npc.is_pc() and npc.get_race() == 8467 begin
			-- local settings = ElephantDungeonLIB.Settings();
			-- if d.getf("ElephantDungeon_CanDestroy_stone1") == 1 then -- All phases
				-- d.setf("ElephantDungeon_CanDestroy_stone1", 0);
				-- pc.give_item2(settings["statue_piece"], 1)
				
				-- d.notice("Ganesha Tapýnaðý: Aferin! Þimdi bir heykel inþa etmeye git!")
			-- end
		-- end
		
		-- Stage 1 - All phases - Building the statues (from 9235 to 9239)
		-- when 9325.take with ElephantDungeonLIB.isActive() begin
			-- local settings = ElephantDungeonLIB.Settings();
			-- if item.get_vnum() == settings["statue_piece"] then
				-- if d.getf("ElephantDungeon_level") == 2 then
					-- item.remove()
					-- d.spawn_mob_dir(settings["statue1"], settings["statues_pos"][1], settings["statues_pos"][2], settings["statues_pos"][3])
					-- npc.kill()
					-- d.setf("ElephantDungeon_level", 3);
					
					-- server_timer("ElephantDungeon_2ndwave_spawner", 7, d.get_map_index())
				-- end
			-- end
		-- end
		
		-- Stage 1 - Phase 2 - Timer for spawning second wave of monsters
		-- when ElephantDungeon_2ndwave_spawner.server_timer begin
			-- if d.select(get_server_timer_arg()) then
				-- d.regen_file("/usr/home/game/share/data/dungeon/elephant_dungeon/regen_1c.txt");
				-- d.setf("Elephant_phase2_monsters", d.count_monster())
			-- end
		-- end
		
		-- Stage 1 - Phase 2 - Killing all monsters in the area, after that you can take next key
		-- when kill with ElephantDungeonLIB.isActive() and not npc.is_pc() and d.getf("ElephantDungeon_level") == 3 begin
			-- local settings = ElephantDungeonLIB.Settings();
			
			-- d.setf("Elephant_phase2_monsters", d.getf("Elephant_phase2_monsters")-1)
			-- if d.getf("Elephant_phase2_monsters") < 1 then
				-- d.notice("Ganesha Tapýnaðý: Tüm Canavarlarý Alt Ettiniz.")
				-- d.notice(string.format("Ganesha Tapýnaðý: Artýk %s alabilirsin!", mob_name(9330)))
				
				-- d.setf("ElephantDungeon_KeyCollect", 1); d.setf("ElephantDungeon_level", 4);
			-- end
		-- end
		
		-- Stage 1 - Phase 2 - Building of second phase of statue
		-- when 9326.take with ElephantDungeonLIB.isActive() begin
			-- local settings = ElephantDungeonLIB.Settings();
			-- if item.get_vnum() == settings["statue_piece"] then
				-- if d.getf("ElephantDungeon_level") == 4 then
					-- item.remove()
					-- d.spawn_mob_dir(settings["statue2"], settings["statues_pos"][1], settings["statues_pos"][2], settings["statues_pos"][3])
					-- npc.kill()
					-- d.setf("ElephantDungeon_level", 5);
					
					-- server_timer("ElephantDungeon_3rdwave_spawner", 7, d.get_map_index())
				-- end
			-- end
		-- end
		
		-- Stage 1 - Phase 3 - Timer for spawning second wave of monsters
		-- when ElephantDungeon_3rdwave_spawner.server_timer begin
			-- if d.select(get_server_timer_arg()) then
				-- d.regen_file("/usr/home/game/share/data/dungeon/elephant_dungeon/regen_1c.txt");
				-- d.setf("Elephant_phase3_monsters", d.count_monster())
			-- end
		-- end
		
		-- Stage 1 - Phase 3 - Killing all monsters in the area, after that you can take next key
		-- when kill with ElephantDungeonLIB.isActive() and not npc.is_pc() and d.getf("ElephantDungeon_level") == 5 begin
			-- local settings = ElephantDungeonLIB.Settings();
			
			-- d.setf("Elephant_phase3_monsters", d.getf("Elephant_phase3_monsters")-1)
			-- if d.getf("Elephant_phase3_monsters") < 1 then
				-- d.notice("Ganesha Tapýnaðý: Tüm Canavarlarý Öldürdünüz.")
				-- d.notice(string.format("Ganesha Tapýnaðý: Artýk %s alabilirsin!", mob_name(9330)))
				
				-- d.setf("ElephantDungeon_KeyCollect", 1); d.setf("ElephantDungeon_level", 6);
			-- end
		-- end
		
		-- Stage 1 - Phase 3 - Building of second phase of statue
		-- when 9327.take with ElephantDungeonLIB.isActive() begin
			-- local settings = ElephantDungeonLIB.Settings();
			-- if item.get_vnum() == settings["statue_piece"] then
				-- if d.getf("ElephantDungeon_level") == 6 then
					-- item.remove()
					-- d.spawn_mob_dir(settings["statue3"], settings["statues_pos"][1], settings["statues_pos"][2], settings["statues_pos"][3])
					-- npc.kill()
					-- d.setf("ElephantDungeon_level", 7);
					
					-- server_timer("ElephantDungeon_4thwave_spawner", 7, d.get_map_index())
				-- end
			-- end
		-- end
		
		-- Stage 1 - Phase 4 - Timer for spawning second wave of monsters
		-- when ElephantDungeon_4thwave_spawner.server_timer begin
			-- if d.select(get_server_timer_arg()) then
				-- d.regen_file("/usr/home/game/share/data/dungeon/elephant_dungeon/regen_1d.txt");
				-- d.setf("Elephant_phase4_monsters", d.count_monster())
			-- end
		-- end
		
		-- Stage 1 - Phase 4 - Killing all monsters in the area, after that you can take next key
		-- when kill with ElephantDungeonLIB.isActive() and not npc.is_pc() and d.getf("ElephantDungeon_level") == 7 begin
			-- local settings = ElephantDungeonLIB.Settings();
			
			-- d.setf("Elephant_phase4_monsters", d.getf("Elephant_phase4_monsters")-1)
			-- if d.getf("Elephant_phase4_monsters") < 1 then
				-- d.notice("Ganesha Tapýnaðý: Bütün canavarlarý öldürdün.")
				-- d.notice(string.format("Ganesha Tapýnaðý: Artýk %s alabilirsin!", mob_name(9330)))
				
				-- d.setf("ElephantDungeon_KeyCollect", 1); d.setf("ElephantDungeon_level", 8);
			-- end
		-- end
		
		-- Stage 1 - Phase 4 - Building of second phase of statue
		-- when 9328.take with ElephantDungeonLIB.isActive() begin
			-- local settings = ElephantDungeonLIB.Settings();
			-- if item.get_vnum() == settings["statue_piece"] then
				-- if d.getf("ElephantDungeon_level") == 8 then
					-- item.remove()
					-- d.spawn_mob_dir(settings["statue4"], settings["statues_pos"][1], settings["statues_pos"][2], settings["statues_pos"][3])
					-- npc.kill()
					
					-- d.notice("Ganesha Tapýnaðý: Harika iþ!")
					-- d.notice(string.format("Ganesha Tapýnaðý: %s'in tümünü hemen 5 dakika içinde öldür!", mob_name(4108)))
					-- d.notice("Ganesha Tapýnaðý: Eðer baþarýsýz olursan zindandan atýlýrsýn.")
					
					-- d.setf("ElephantDungeon_level", 9); d.setf("ElephantDungeon_KillBosses1", 1);
					-- d.regen_file("/usr/home/game/share/data/dungeon/elephant_dungeon/regen_1e.txt");
					-- server_timer("ElephantDungeon_1stBosses_counter", settings["time_to_beat_first_boss"], d.get_map_index())
				-- end
			-- end
		-- end
		
		-- Stage 1 - Phase 5 - Killing first wave of 4 bosses (4104)	
		-- when kill with ElephantDungeonLIB.isActive() and not npc.is_pc() and npc.get_race() == 4108 and d.getf("ElephantDungeon_level") == 9 begin
			-- local settings = ElephantDungeonLIB.Settings(); local BossCount_1 = 4;
			
			-- d.setf("ElephantDungeon_KillBoss1", d.getf("ElephantDungeon_KillBoss1")+1);
			-- if (d.getf("ElephantDungeon_KillBoss1") < BossCount_1) then
				-- d.notice(string.format("Ganesha Tapýnaðý: %d patron kaldý!", BossCount_1-d.getf("ElephantDungeon_KillBoss1")))
			-- else
				-- d.setf("ElephantDungeon_level", 10); d.setf("ElephantDungeon_KillBosses1", 0);
				-- clear_server_timer("ElephantDungeon_1stBosses_counter", get_server_timer_arg())
				-- pc.give_item2(settings["key2"], 1)
				
				-- d.notice("Ganesha Tapýnaðý: Ýyi Ýþ!")
				-- d.notice(string.format("Ganesha Tapýnaðý: Finali açalým %s!", mob_name(9323)))
			-- end
		-- end
		
		-- Stage 1 - Phase 5 - 5 minutes timer for kill first wave of bosses (4x 4104). If its failed, players will be teleported back to set coordinates
		-- when ElephantDungeon_1stBosses_counter.server_timer begin
			-- if d.select(get_server_timer_arg()) then
				-- clear_server_timer("ElephantDungeon_1stBosses_counter", get_server_timer_arg())
				-- if d.getf("ElephantDungeon_KillBosses1") == 1 then -- Killing is still active
					-- d.kill_all();
					-- ElephantDungeonLIB.clearTimers();
					
					-- d.notice("Ganesha Tapýnaðý: Baþarýsýz oldun!")
					-- d.notice("Ganesha Tapýnaðý: Zindandan ýþýnlanacaksýn.")
					
					-- server_timer("ElephantDungeon_final_exit", 3, d.get_map_index())
				-- else  -- Bosses are already killed
					-- return
				-- end
			-- end
		-- end
		
		-- Stage 1 - Final Phase - Opening of big door to Boss place. It will also spawn boss 4109 and set regen of monsters
		-- when 9323.take with ElephantDungeonLIB.isActive() and d.getf("ElephantDungeon_level") == 10 begin
			-- local settings = ElephantDungeonLIB.Settings();
			
			-- if item.get_vnum() == settings["key2"] then
				-- item.remove()
				-- d.kill_all()
				
				-- d.notice("Ganesha Tapýnaðý: Harika Ýþ!")
				-- d.notice(string.format("Ganesha Tapýnaðý: Hemen %s öldürmelisin!", mob_name(4109)))
				
				-- d.set_regen_file("/usr/home/game/share/data/dungeon/elephant_dungeon/regen_2a.txt");
				-- d.setf("ElephantDungeon_level", 11);
			-- end
		-- end

		-- Stage 2 - PLayers kill first boss here, after its killed, regen is automatically cleared and all monsters are killed. Main boss will be spawned in 10 seconds
		-- when kill with ElephantDungeonLIB.isActive() and not npc.is_pc() and npc.get_race() == 4109 and d.getf("ElephantDungeon_level") == 11 begin
			-- ElephantDungeonLIB.clearDungeon()
			
			-- d.notice("Ganesha Tapýnaðý: Zemin titriyor!")
			-- d.notice(string.format("Ganesha Tapýnaðý: %s geliyor!", mob_name(4110)))
			
			-- d.setf("ElephantDungeon_level", 12); d.setf("ElephantDungeon_SpecialDamageTime", 0)
			-- server_timer("ElephantDungeon_GaneshaSpawner", 10, d.get_map_index())
		-- end
		
		-- Stage 2 - Spawn of Main boss (4110), timer for spawn metin stones is also set (60 seconds)
		when ElephantDungeon_GaneshaSpawner.server_timer begin
			local settings = ElephantDungeonLIB.Settings();
			if d.select(get_server_timer_arg()) then
				local vid = d.spawn_mob(settings["final_boss"], settings["final_boss_pos"][1], settings["final_boss_pos"][2]);
				d.set_unique("Final_boss", vid);
				if d.getf("ElephantDungeon_SpecialDamageTime") == 0 then
					server_timer("ElephantDungeon_GaneshaDefence", settings["time_after_boss_high_defense"], d.get_map_index()) --- Normal timer. After that time the boss has increased defense.
				else
					server_timer("ElephantDungeon_GaneshaDefence", settings["special_damage_timer_effect"], d.get_map_index()) --- Special timer with using item 30798. After that time the boss has increased defense.
				end
			end
		end
		
		-- Stage 2 - Metin stones are spawned, Def bonus of ganesha is increased to 65535 until the metins are not destroyed
		when ElephantDungeon_GaneshaDefence.server_timer begin
			local settings = ElephantDungeonLIB.Settings();
			if d.select(get_server_timer_arg()) then
				d.regen_file("/usr/home/game/share/data/dungeon/elephant_dungeon/regen_2b.txt");
				d.unique_set_def_grade("Final_boss", settings["final_boss_defense_high"])
				
				d.notice(string.format("Ganesha Tapýnaðý: %s's savunma arttý!", mob_name(4110)))
				d.notice(string.format("Ganesha Tapýnaðý: Bu etkiyi önlemek için tüm %s'leri yok et!", mob_name(8468)))
			end
		end
		
		-- Stage 2 - After players destroy all stones, defense value comes back to normal again
		when kill with ElephantDungeonLIB.isActive() and not npc.is_pc() and npc.get_race() == 8468 and d.getf("ElephantDungeon_level") == 12 begin
			local settings = ElephantDungeonLIB.Settings(); local StoneCount = 4;
			
			d.setf("ElephantDungeon_StoneDestroy", d.getf("ElephantDungeon_StoneDestroy")+1);
			if (d.getf("ElephantDungeon_StoneDestroy") < StoneCount) then
				d.notice(string.format("Ganesha Tapýnaðý: %d taþ kaldý!", StoneCount-d.getf("ElephantDungeon_StoneDestroy")))
			else
				d.unique_set_def_grade("Final_boss", settings["final_boss_defense_basic"]) --- Defense is set to normal value
				
				d.notice(string.format("Ganesha Tapýnaðý: %s'nin savunmasý normale döndü!", mob_name(4110)))
				d.notice("Ganesha Tapýnaðý: Acele Et! Taþlar yakýnda geri dönecek!")
				
				if d.getf("ElephantDungeon_SpecialDamageTime") == 0 then
					server_timer("ElephantDungeon_GaneshaDefence", settings["time_after_boss_high_defense"], d.get_map_index()) --- Normal timer. After that time the boss has increased defense.
				else
					server_timer("ElephantDungeon_GaneshaDefence", settings["special_damage_timer_effect"], d.get_map_index()) --- Special timer with using item 30798. After that time the boss has increased defense.
				end
				d.setf("ElephantDungeon_StoneDestroy", 0) --- Stone counter si set to 0 again
			end
		end

		-- Stage 2 - Ganesha is killed
		when kill with ElephantDungeonLIB.isActive() and not npc.is_pc() and npc.get_race() == 4110 and d.getf("ElephantDungeon_level") == 12 begin
			local settings = ElephantDungeonLIB.Settings();
			ElephantDungeonLIB.clearDungeon();
			ElephantDungeonLIB.clearTimers();
			
			pc.setqf("ganesha_giris_aktif", 0)
			d.notice("Ganesha Tapýnaðý: Onu öldürdün!")
			
			
			server_timer("ElephantDungeon_final_exit", settings["exit_timer"], d.get_map_index())
		end
		
		-- Stage 2 - Item used for extend the time until "protect stones" are spawned again
		-- when 30798.use begin
			-- local settings = ElephantDungeonLIB.Settings();
			-- if ElephantDungeonLIB.isActive() then
				-- if d.getf("ElephantDungeon_level") == 12 then
					-- if d.getf("ElephantDungeon_SpecialDamageTime") == 0 then
						-- item.remove()
						-- d.setf("ElephantDungeon_SpecialDamageTime", 1)
						-- server_timer("ElephantDungeon_SpecialItemDuration", settings["special_damage_timer_duration"], d.get_map_index()) --- Timer of item duration
					-- else
						-- syschat("Eþyayý þuan kullanamazsýnýz.")
					-- end
				-- else
					-- syschat("Bu ürün sadece Ganesha Tapýnaðýnýn son aþamasýnda kullanýlabilir.")
				-- end
			-- else
				-- syschat("Bu eþyayý sadece Ganesha Tapýnaðýnda kullanabilirsiniz.")
			-- end
		-- end

		-- Stage 2 - When this timer comes, effect of Item 30798 will end
		-- when ElephantDungeon_SpecialItemDuration.server_timer begin
			-- if d.select(get_server_timer_arg()) then
				-- d.notice(string.format("Ganesha Tapýnaðý: %s'nýn efektinin süresi doldu.", item_name(30798)))
			-- end
		-- end

		-- Stage 2 - End of dungeon, all players are teleported to the cities
		when ElephantDungeon_final_exit.server_timer begin
			if d.select(get_server_timer_arg()) then
				-- ElephantDungeonLIB.clearDungeon()
				d.exit_all()
			end
		end
		------------
		--Dungeon enter
		------------
		when 9321.chat."Ganesha Tapýnaðý " with not ElephantDungeonLIB.isActive() begin
			say_size(350,350)
			addimage(25, 10, "elephant_bg1.tga"); addimage(225, 200, "elephant_guard.tga")
			say("[ENTER][ENTER]")
			say_title(string.format("%s:[ENTER]", mob_name(npc.get_race())))
			say("Merhaba![ENTER]Sanýrým o yaratýðý size tanýtmak zorunda deðilim [ENTER]. Her evin, her yerin koruyucusu [ENTER] Þimdiye kadar uzun bir süre sonra. [ENTER] Kötü kristal Ganesha'nin yaþadýðý yere geldi [ENTER] ve orada tüm canlýlara hükmetti. [ENTER]")
			say_reward("Oraya gidip ilgilenir misin??")
			if (select("Evet", "Hayýr") == 1) then
				if ElephantDungeonLIB.checkEnter() then
					addimage(25, 10, "elephant_bg1.tga"); addimage(225, 200, "elephant_guard.tga")
					say_reward("[ENTER]Zindaný 40 dakika içinde bitirmelisin. [ENTER] Aksi takdirde zindandan [ENTER] ýþýnlanacaksýn. [ENTER] [ENTER] Size iyi þanslar diliyorum!")
					wait()
					if pc.get_animasfer() < 14 then
						say("Giriþ yapabilmek için 14 animasfer gerekli.")
						return
					else
						pc.set_animasfer(-14)
					end
					ElephantDungeonLIB.CreateDungeon();
				end
			end
		end
		
		------------
		--Time reset - ONLY FOR GM 
		------------
		when 9321.chat."Soðuma Süresini Sýfýrla" with pc.is_gm() and not ElephantDungeonLIB.isActive() begin
			addimage(25, 10, "elephant_bg1.tga"); addimage(225, 150, "elephant_guard.tga")
			say("[ENTER][ENTER]")
			if select("Sýfýrla","Kapat") == 2 then return end
				addimage(25, 10, "elephant_bg1.tga"); addimage(225, 150, "elephant_guard.tga")
				say("[ENTER][ENTER]")
				say_title(string.format("%s:[ENTER]", mob_name(npc.get_race())))
				say("[ENTER]Sýfýrlandý.")
				pc.setf("elephant_dungeon","exit_elephant_dungeon_time", 0)
				pc.setqf("rejoin_time", get_time() - 3600)
		end
		
		when 9321.chat."Admin" with pc.is_gm() and not ElephantDungeonLIB.isActive() begin
			say_size(350,350)
			addimage(25, 10, "elephant_bg1.tga"); addimage(225, 200, "elephant_guard.tga")
			say("[ENTER][ENTER]")
			say_title(string.format("%s:[ENTER]", mob_name(npc.get_race())))
			say("Merhaba![ENTER]Sanýrým o yaratýðý size tanýtmak zorunda deðilim [ENTER]. Her evin, her yerin koruyucusu [ENTER] Þimdiye kadar uzun bir süre sonra. [ENTER] Kötü kristal Ganesha'nin yaþadýðý yere geldi [ENTER] ve orada tüm canlýlara hükmetti. [ENTER]")
			say_reward("Oraya gidip ilgilenir misin??")
			if (select("Evet", "Hayýr") == 1) then
				-- if ElephantDungeonLIB.checkEnter() then
					addimage(25, 10, "elephant_bg1.tga"); addimage(225, 200, "elephant_guard.tga")
					say_reward("[ENTER]Zindaný 40 dakika içinde bitirmelisin. [ENTER] Aksi takdirde zindandan [ENTER] ýþýnlanacaksýn. [ENTER] [ENTER] Size iyi þanslar diliyorum!")
					wait()
					-- if pc.get_animasfer() < 14 then
						-- say("Giriþ yapabilmek için 14 animasfer gerekli.")
						-- return
					-- else
						-- pc.set_animasfer(-14)
					-- end
					ElephantDungeonLIB.CreateDungeon();
				-- end
			end
		end
		
		------------
		-- Set waiting time for next enter (1 hour - 3600 seconds)
		------------
		
		when logout with ElephantDungeonLIB.isActive() begin
			local settings = ElephantDungeonLIB.Settings();
			if not pc.is_gm() then
				pc.setf("elephant_dungeon","exit_elephant_dungeon_time", get_global_time())
				pc.setqf("elephant_dungeon", get_time() + settings["dungeon_cooldown"])
			end
		end
	end
end