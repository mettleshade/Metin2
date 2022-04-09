quest devil_tower2_plechito begin
	state start begin
		--[[ FUNCTION STATEMENT BEGIN ]]
		function spawn_boss(level)
			local boss_settings = {
				[1] = {816, 564, 613}};
			
			return d.spawn_mob(boss_settings[level][1], boss_settings[level][2], boss_settings[level][3])
		end
		
		function settings()
			return
			{
				["map_index"] = 18,
				["spawm_pos"] = {
					[1] = {560+21000, 546+22000}
				},
				["level_check1"] = {
					["minimum"] = 40,
					["maximum"] = 120
				},
				["keys"] = {30330, 30330}
			}
		end
		
		
		-- function make_dungeon()
			-- local setting = devil_tower2_plechito.settings()
			-- pc.setqf("mavi_olum_giris", 1)
			-- devil_tower2_plechito.spawn_boss(1)
		-- end
		--[[ FUNCTION STATEMENT END ]]
		
		--[[ TOWER STATEMENT BEGIN ]]
		
		when login begin
			local mid = pc.get_map_index()
			local setting = devil_tower2_plechito.settings()

			if (pc.get_map_index() >= 180000 and pc.get_map_index() < 189999) then
				if pc.getqf("mavi_olum_giris") > 0 then
					pc.setqf("mavi_olum_giris", 0)
					devil_tower2_plechito.spawn_boss(1)
					d.zodiac_notice_clear()
					d.zodiac_notice("Merhaba Epsilon2'ye Özel Mavi Ölüm Zindanına Hoşgeldin. 10 Dakika zamanın var.")
					server_loop_timer('sureyi_baslat', 60*10, d.get_map_index())
				end
			end

			if mid == setting["map_index"] then
				if not pc.in_dungeon() then
					warp_to_village()
				end
			end
		end
		
		when logout with pc.get_map_index() >= 180000 and pc.get_map_index() < 189999 begin
			------------ Dungeon Turn Back System ----------------------
			pc.setf("devil_tower2","dungeon_turn",1)
			------------------------------------------------------------
		end
		
		when kill with npc.get_race() == 816 and pc.in_dungeon() begin
			d.zodiac_notice_clear()
			pc.setqf("mavi_olum_giris", 0)
			d.zodiac_notice(string.format("%s Mağlub edildi , Tebrikler!", mob_name(816)))
			notice_all(string.format("%s grubu Mavi Ölüm Kulesini başarı ile tamamladı!", pc.get_name()))
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
		when 9201.chat."Mavi Ölüm Kulesi " begin
			-- Quest window dungeon image
			addimage(35,35,'deneme31.tga')
			local settings = devil_tower2_plechito.settings()
			
			say_title_center(mob_name(20348))
			say("")
			
			if not pc.can_warp() then
				addimage(35,35,'deneme31.tga')say("")say("")say("")say("")
				say_center("Henüz ışınlanamazsın.")
				say_center("")
				return
			end
			if get_time() < pc.getqf("bt_player_time_duration") then
				if pc.is_gm() then
					say_center("Beta Server; süreyi sıfırlamak mı istiyorsun?")
					say_center("Kalan süre: "..dungeon_get_duration(pc.getqf("bt_player_time_duration") - get_global_time()).."")
					if select("Evet","Hayır") == 1 then
						pc.setqf("bt_player_time_duration",0)
						return
					end
				end
				say_title_center(mob_name(20410))
				addimage(35,35,'deneme31.tga')say("")say("")say("")say("")
				say_center("Soguma süren henüz dolmadi !")
				say_center("Kalan süre: "..dungeon_get_duration(pc.getqf("bt_player_time_duration") - get_global_time()).."")
				return
			end
			if pc.get_level() < 40 or pc.get_level() > 120 then
				say_title_center(mob_name(20410))
				addimage(35,35,'deneme31.tga')say("")say("")say("")say("")
				say_center("Giris yapmak için seviyen yetersiz.")
				say_center(string.format("Minimum Seviye: %d.",40))
				say_center(string.format("Maksimum Seviye: %d.",120))
				return
			end	
			
			if pc.count_item(55035) < 1 then
				say_title_center(mob_name(20410))
				addimage(35,35,'deneme31.tga')say("")say("")say("")say("")
				say_center("Envanterinde yeterli miktarda yok:")
				say_reward_center(string.format("%s.", item_name(55035)))
				say_center("")
				return
			end
			
			
			-- Quest window dungeon image
			addimage(35,35,'deneme31.tga')say("")say("")say("")say("")say("")
			pc.remove_item(55035, 1)
			pc.setqf("bt_player_time_duration", get_time()+60*60*2)
			pc.setqf("mavi_olum_giris", 1)
			say_center("Mavi ölüm kalesine ışınlanıyorsun,")
			say_center("'Devam' dedikten sonra bütün üyeler ışınlanacaklar .")
			wait()
			d.new_jump(18, 21560 * 100, 22546 * 100)
			--devil_tower2_plechito.make_dungeon()
		end
		when 9201.chat."Mağara Süre sıfırla " with pc.is_gm() begin
			local select_timer = select("Sıfırla", "Sıfırlama")
			if select_timer == 1 then
				pc.setqf("bt_player_time_duration", 0)
			end
		end
		--[[ CHAT END ]]
	end
end