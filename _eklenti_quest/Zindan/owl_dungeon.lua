-- define OWL_GHOST 9225
-- define FIRST_TOTEM 9226
-- define OWL_METIN1 8425
-- define OWL_METIN2 8426
-- define OWL_HURT 9227
-- define SURAN 718
-- define FEATHER 9228
-- define OWL_STATUE 8427
-- define RU_TAIG 719

quest owl_dungeon begin
	state start begin
	--QUEST FUNCTIONS
		function settings()
			return
			{
				["owl_map_index"] = 251,
				["owl_map_index_out"] = 68,
				["out_pos"] = {1686, 6137},
				["level_pos"] = {
					[1] = {1594300, 118700},
					[2] = {1618700, 117600},
					[3] = {1581600, 168500},
					[4] = {1625100, 160200}
				},
				["level_check"] = {
					["minimum"] = 120,
					["maximum"] = 120
				},
				["keys"] = {30301, 30302}, 
				["ticket"] = 30704, 
				-- First floor
				["owl_ghost"] = 9225, --Main npc
				["owl_ghost_pos"] = {
					[1] = {318, 162},
					[2] = {200, 156},
					[3] = {562, 158},
					[4] = {190, 650},
					[5] = {201, 581},
					[6] = {628, 570}
				},
				["feather_pos"] = {
					[1] = {122, 604},
					[2] = {161, 619},
					[3] = {150, 569},
					[4] = {167, 512},
					[5] = {191, 505},
					[6] = {209, 505},
					[7] = {225, 525},
					[8] = {221, 542},
					[9] = {244, 565},
					[10] = {257, 524},
					[11] = {277, 582},
					[12] = {254, 639},
					[13] = {216, 633}
				},
				["first_totem_pos"] = {215, 165},
				["key_1thfloor"] = 30707,
				["key_1bthfloor"] = 30705,				
				["owl_gemstone"] = 30709,				
				["suran_blood"] = 30710,				
				["owl_feather"] = 30711,				
				["healing_potion"] = 30712,				
				["owl_metin_pos"] = {564, 203},
				["suran_pos"] = {
					[1] = {200, 576},
					[2] = {578, 553},
					[3] = {586, 544}
				},
				["rutaig_pos"] = {582, 548},
				["owl_hurt_pos"] = {196, 630}
			};
		end
		
		function get_regens(level)
			local regens = {
				[1] = "data/dungeon/owl_dungeon/floor_1.txt",
				[2] = "data/dungeon/owl_dungeon/floor_1b.txt"};
			return d.set_regen_file(regens[level])
		end
		
		function is_owled()
			local pMapIndex = pc.get_map_index();
			local data = owl_dungeon.settings();
			local map_index = data["owl_map_index"];

			return pc.in_dungeon() and pMapIndex >= map_index*10000 and pMapIndex < (map_index+1)*10000;
		end
		
		function clear_owldungeon()
			d.clear_regen();
			d.kill_all();
		end
		
		function check_enter()
			addimage(25, 10, "owl_dungeon00.tga")
			addimage(238, 75, "owlghost.tga")
			say("")
			say("")
			say("")
			say_title(mob_name(9225))
			local settings = owl_dungeon.settings()

			if pc.get_level() < settings["level_check"]["minimum"] then
				say("Eðer ormana girmek istiyorsan,")
				say("En az 120 seviyeye sahip olmalisin.")
				say("")
				return
			end
			
			if pc.get_level() > settings["level_check"]["maximum"] then
				say("Eðer ormana girmek istiyorsan,")
				say("En fazla 120 seviyeye sahip olmalisin.")
				say("")
				return
			end
			
			if pc.count_item(settings.ticket) < 1 then
				say("Eðer ormana girmek istiyorsan,")
				say(string.format("%s Sahip Olmalisin", item_name(settings.ticket)))
				say("")
				return
			end
			
			if get_time() < pc.getqf("baykus_soguma") then
				say_title_center(mob_name(9308))
				say_center("")
				say_center("")
				say_center("")
				say_center("")
				say_center("")
				say_center("Soguma süren henüz dolmadi !")
				say_center("Kalan süre: "..dungeon_get_duration(pc.getqf("baykus_soguma") - get_global_time()).."")
				return
			end

			pc.remove_item(settings.ticket, 1)

			say("Butona bastýkdan sonra,")
			say("Grubun her bir üyesi ýþýnlanacak!")
			say("Dikkatli olun! Hepiniz!")
			wait()
			owl_dungeon.create_dungeon()
		end
				
		function create_dungeon()
			local setting = owl_dungeon.settings()
			
			d.new_jump(setting["owl_map_index"], setting["level_pos"][1][1], setting["level_pos"][1][2])
			d.setf("owl_level", 1)
			d.spawn_mob(setting["owl_ghost"], setting["owl_ghost_pos"][1][1], setting["owl_ghost_pos"][1][2])
			pc.setqf("baykus_soguma", get_time()+60*60*1)
			server_timer("owl_dungeon_45min_left", 45*60, d.get_map_index())
		end
		--FUNCTIONS END
		
		--LOGIN IN MAP
		when login begin
			local indx = pc.get_map_index()
			local settings = owl_dungeon.settings()
						
			if indx == settings["owl_map_index"] then
				if not pc.in_dungeon() then
					warp_to_village()
				end
			end
		end


		--DUNGEON ENTER
		when 9225.chat."Baykuþ Tapýnaðý "  with not owl_dungeon.is_owled() begin
			local settings = owl_dungeon.settings()
			addimage(25, 10, "owl_dungeon00.tga")
			addimage(238, 75, "owlghost.tga")
			say("")
			say("")
			say("")
			say_title(mob_name(9225))
			say("")
			say("Baykuþ ormaný ....")
			say("Güzel ve barýþçýl bir yerdi.")
			say("Bu ormaný kimse bilmiyor, güçlü ")
			say("sihir korumalý!")
			say("Ama olanlarý saklý tutmadýk.")
			say("Bizden biri, Ru-Taig bir devrim yaptý ")
			say("ve bir güce kavuþtu.")
			say("orasý artýk onun tapýnaðý!")
			wait()
			addimage(25, 10, "owl_dungeon00.tga")
			addimage(238, 75, "owlghost.tga")
			say("")
			say("")
			say("")
			say_title(mob_name(9225))
			say("")
			say("Buraya girmek istediðinize emin misiniz")
			say("burasý? Artýk güvenli deðil!")
			say("Ru-Taig'in savaþçýlarý her yerdeler.")
			say("Herkesi öldürüyorlar!")
			say("")
			say_title("Bu yere gerçekten girmek istiyor musun? ")
			if (select ("Evet", "Hayýr") == 1) then
				owl_dungeon.check_enter()
			end
		end
		
		when 9225.chat."Soðuma Süresini Sýfýrla" with pc.is_gm() and not owl_dungeon.is_owled() begin
			addimage(25, 10, "owl_dungeon00.tga")
			addimage(238, 75, "owlghost.tga")
			say("[ENTER][ENTER]")
			if select("Sýfýrla","Kapat") == 1 then
				pc.setqf("baykus_soguma", 0)
			end
		end
		
		when 9225.chat."Neden Buradasýn?" with owl_dungeon.is_owled() and d.getf("owl_level") == 1 begin
			local settings = owl_dungeon.settings()
			addimage(25, 10, "owl_dungeon01.tga")
			addimage(238, 75, "owlghost.tga")
			say("")
			say("")
			say("")
			say_title(mob_name(9225))
			say("")
			say("Burada senin yanýnda olacaðým!")
			say("Ben sadece hayaletim, sana yardým edemem")
			say("fiziksel olarak, ama sana verebilirim")
			say("bu yer hakkýnda bilgi")
			say("Hadi baþlayalým!")
			say("Ru-Taig'e ulaþmak kolay deðil.")
			say_reward("Bütün zindan için sadece 45 dakikanýz var!")
			wait()
			owl_dungeon.get_regens(1)
			npc.purge()
			d.notice("Baykuþ Tapýnaðý: Tüm metinleri öldür")
			d.setf("totem", 1)
			-- loop_timer("owldungeon_1bthfloor", 20);
			d.spawn_mob(9226, settings["first_totem_pos"][1], settings["first_totem_pos"][2])
		end

		when kill with owl_dungeon.is_owled() and not npc.is_pc() and npc.get_race() == 8424 and d.getf("owl_level") == 1 begin
			-- local settings = owl_dungeon.settings()
			if (d.count_monster() <= 1) then
				-- cleartimer("owldungeon_1bthfloor");
				d.notice("Baykuþ Tapýnaðý: Tüm metinleri öldürdün.");
				pc.give_item2(30705,1)
				d.notice(string.format("Baykuþ Tapýnaðý: Þimdi %s'yi totem'e yerleþtir ve onu yok et!", item_name(30705)));
				d.setf("owl_level", 2)
			else
				d.notice(string.format("Baykuþ Tapýnaðý: Anahtar almak için hala %d metin öldürmek zorundasýn.", d.count_monster()-1));
			end
		end

		when 9226.take with item.get_vnum() == 30705 and owl_dungeon.is_owled() and d.getf("totem") == 1 and d.getf("owl_level") == 2 begin
			local settings = owl_dungeon.settings()
			pc.remove_item(30705, 1)
			npc.kill(9226)
			owl_dungeon.clear_owldungeon()
			-- timer("owlghost_spawn1floor", 5)
			d.spawn_mob(9225, settings["owl_ghost_pos"][2][1], settings["owl_ghost_pos"][2][2])
			d.setf("owl_level", 3)
		end

		when 9225.chat."Son Kat"  with owl_dungeon.is_owled() and d.getf("owl_level") == 3 begin
			local settings = owl_dungeon.settings()
				addimage(25, 10, "owl_dungeon00.tga")
				addimage(238, 75, "owlghost.tga")
				say("")
				say("")
				say("")
				say_title(mob_name(9225))
				say("")
				say("Harika!")
				say("Ru-Taig geliyor.")
				say("Onu baþarýlý bir þekilde öldürmelisin!")
				say("")
				say_reward("Onu baþarýlý bir þekilde öldürmelisin")
				wait()
				npc.purge()
				d.setf("owl_level", 4)
				-- d.setf("kill_statue", 1)
				owl_dungeon.get_regens(2)
				server_timer("final_owl", 3*60, d.get_map_index())
		end
		
		
		when kill with owl_dungeon.is_owled() and not npc.is_pc() and npc.get_race() == 719 and d.getf("owl_level") == 4 begin
			owl_dungeon.clear_owldungeon()
			d.notice("Baykuþ Tapýnaðý: Zindaný baþarýyla bitirdin!")
			d.notice("Baykuþ Tapýnaðý: 2 dakika sonra ýþýnlanacaksýnýz")
			d.notice("Baykuþ Tapýnaðý: zindanýn dýþýna.")
			server_timer("final_succes_owl", 115, d.get_map_index())
			d.setf("owl_level", 5)
		end
		
		when statue_succes.server_timer begin
			if d.select(get_server_timer_arg()) then
				clear_server_timer('final_owl', get_server_timer_arg())
			end
		end
		
		when owl_dungeon_45min_left.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.notice("Baykuþ Tapýnaðý: 30 dakika kaldý!")
				server_timer("owl_dungeon_0min_left", 160, d.get_map_index())
			end
		end

		when owl_dungeon_0min_left.server_timer begin
			if d.select(get_server_timer_arg()) then
				server_timer("final_owl", 1, d.get_map_index())
			end
		end
		
		when final_owl.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.notice("Baykuþ Tapýnaðý: Zaman doldu!")
				d.notice("Baykuþ Tapýnaðý: Baþarýsýz oldun!")
				owl_dungeon.clear_owldungeon()
				d.set_warp_location(41, 9694, 2786)
			end
			
			server_timer("final_exit_owl", 5, d.get_map_index())
		end
		
		when final_succes_owl.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.notice("Baykuþ Tapýnaðý: Zidanýn dýþýna ýþýnlanacaksýnýz!")
				owl_dungeon.clear_owldungeon()
				d.set_warp_location(41, 9694, 2786)
			end
			
			server_timer("final_exit_owl", 5, d.get_map_index())
		end
		
		when final_exit_owl.server_timer begin
			if d.select(get_server_timer_arg()) then								
				d.exit_all()
			end
		end									
	end
end
