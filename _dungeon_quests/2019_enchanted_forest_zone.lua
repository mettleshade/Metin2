quest enchanted_forest_zone begin
    state start begin
		function setting()
			return
			{
				["map_index"] = 353,
				["ticket_vnum"] = 30613,
				["dungeon_entry_pos"] = {7824, 15021},
				["boss1"] = 6408,
				["boss2"] = 6192,
				["spawn"] = {70, 941},
			}
		end
		
		function make_dungeon(ld_vid, channel)
			local setting = enchanted_forest_zone.setting()
			local event_flag = string.format("frt_dungeon_status_%d", channel)
			game.set_event_flag(event_flag, get_time() + 60 * 60)
			
			-- d.new_jump_party(setting.map_index, setting.dungeon_entry_pos[1], setting.dungeon_entry_pos[2])
			d.new_jump(353, setting.dungeon_entry_pos[1] * 100, setting.dungeon_entry_pos[2] * 100)
			d.setf("frt_party_leader_pid", ld_vid)
			party.setf("frt_dungeon_index", d.get_map_index())
			
			d.spawn_mob(setting.boss1, setting.spawn[1], setting.spawn[2])
			clear_server_timer("frt_2h_left_timer", get_server_timer_arg())
			clear_server_timer("frt_exit_timer", get_server_timer_arg())
			server_timer("frt_2h_left_timer", 60 * 60, d.get_map_index())
		end
		
		when login begin
			local idx = pc.get_map_index()
			local setting = enchanted_forest_zone.setting()
			if idx >= (setting.map_index * 10000) and idx < (setting.map_index * 10000 + 10000) then
				pc.setf("enchanted_forest", "limit_activity", 0)
				if pc.getqf("dungeon_enter") > 0 then
					pc.setqf("dungeon_enter", 0)
					return
				end
				
				pc.warp(816700, 1505000)
			end
		end
		
		when logout begin
			local idx = pc.get_map_index()
			local setting = enchanted_forest_zone.setting()
			if idx >= (setting.map_index * 10000) and idx < (setting.map_index * 10000 + 10000) then
				pc.setqf("exit_time_logout", get_global_time() + 5 * 60)
				if pc.getqf("dungeon_enter") > 0 then
					pc.setqf("dungeon_enter", 0)
				end
				
				pc.setf("enchanted_forest", "limit_activity", get_time() + 10 * 60)
			end
		end
		
		when 6408.kill with pc.in_dungeon() begin
			local setting = enchanted_forest_zone.setting()
			d.spawn_mob(setting.boss2, setting.spawn[1], setting.spawn[2])
		end
		
		when 6192.kill with pc.in_dungeon() begin
			local setting = enchanted_forest_zone.setting()
			d.set_warp_location(353, 8288, 14186)
			
			d.notice("�vg�ler, Efsunlu Orman'a Bar�� Getirdiniz.. ")
			d.notice("Birazdan I��nlanacaks�n�z.. ")
			
			server_timer("frt_exit_timer", 30, d.get_map_index())
		end
		
		when frt_2h_left_timer.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.set_warp_location(353, 8288, 14186)
				d.notice("Zaman Doldu I��nlanacaks�n�z.. ")
				
				server_timer("frt_exit_timer", 3, get_server_timer_arg())
			end
		end
		
		when frt_exit_timer.server_timer begin
			if d.select(get_server_timer_arg()) then
				clear_server_timer("frt_exit_timer", get_server_timer_arg())
				clear_server_timer("frt_2h_left_timer", get_server_timer_arg())
				d.setf("frt_party_leader_pid", 0)
				d.exit_all()
			end
		end
		
		when 20412.chat."Bagjanamu Odas� " begin
			addimage(35,35,'jotun.tga')
			local setting = enchanted_forest_zone.setting()
			
			say_title_center(mob_name(20412))
			say("")
			say("")
			say("")
			say("")
			say("")
			say_center("Bagjanamu'ya kar�� sava�mak ister misin? ")
			local agree = select("Evet. ", "Hay�r ")
			if agree == 1 then
				say_title_center(mob_name(20412))
				say("")
				if party.is_party() then
					addimage(35,35,'jotun.tga')
					say("")
					say("")
					say("")
					say_center("Bu odaya eri�ebilmek i�in ")
					say_center("grup �yesi olmaman gerekmektedir. ")
					return
				end
				
				-- local party_check = 0
				-- if d.find(party.getf("frt_dungeon_index")) then
					-- party_check = (d.getf_from_map_index("frt_party_leader_pid", party.getf("frt_dungeon_index")) == party.get_leader_pid())
				-- end
				
				-- if d.find(party.getf("frt_dungeon_index")) and party_check then
					-- if get_global_time() > pc.getqf("exit_time_logout") then
						-- addimage(35,35,'jotun.tga')
						-- say("")
						-- say("")
						-- say("")
						-- say("")
						-- say("")
						-- say_center("Maalesef �ok ge� geliyorsun, giri�i k�s�tl�yorsun ")
						-- say_center("Zindana d�n�� 5 dak�kal�k. ")
						-- return
					-- end
					
					-- pc.setf("enchanted_forest_zone", "dungeon_enter", 1)
					-- addimage(35,35,'jotun.tga')
					-- say("")
					-- say("")
					-- say("")
					-- say("")
					-- say("")
					-- say_center("��eriye al�yorum seni. ")
					-- say("")
					-- wait()
					-- pc.warp(setting.dungeon_entry_pos[1] * 100, setting.dungeon_entry_pos[2] * 100, party.getf("frt_dungeon_index"))
				-- end
				
				local event_flag = string.format("frt_dungeon_status_%d", pc.get_channel_id())
				if game.get_event_flag(event_flag) > get_time() then
					local next_time = (game.get_event_flag(event_flag) - get_time())
					addimage(35,35,'jotun.tga')
					say("")
					say("")
					say("")
					say("")
					say("")
					say_center("Giri� �uanda Kapal�.")
					if next_time < 60 then
						say(string.format("%d Saniye(s) Sonra Tekrar Deneyiniz. ", tonumber(next_time)))
					else
						say(string.format("%d Dakika(s) Sonra Tekrar Deneyiniz. ", tonumber(next_time / 60)))
					end
					
					return
				end
				
				-- if party.get_near_count() > 1 then
					-- addimage(35,35,'jotun.tga')
					-- say("")
					-- say("")
					-- say("")
					-- say("")
					-- say("")
					-- say_center("Bu odaya eri�ebilmek i�in ")
					-- say_center("bir grupta olmaman gerekli. ")
					-- return
				-- end
				
				-- local pids = {party.get_member_pids()}
				-- local ticketCheck = true
				-- local notEnoughTicketMembers = {}
				
				-- for i, pid in next, pids, nil do
					-- q.begin_other_pc_block(pid)
					-- if pc.count_item(setting.ticket_vnum) < 1 then
						-- table.insert(notEnoughTicketMembers, pc.get_name())
						-- ticketCheck = false
					-- end
					
					-- q.end_other_pc_block()
				-- end
				
				if pc.count_item(30613) < 1 then
					addimage(35,35,'jotun.tga')
					say("")
					say("")
					say("")
					say("")
					say_center("Bu odaya eri�ebilmek i�in ")
					say_center(string.format("Olmas� Gereken E�ya - %s. ", item_name(setting.ticket_vnum)))
					say_center("")
					return
				end
				
				-- for i, pid in next, pids, nil do
					-- q.begin_other_pc_block(pid)
					-- pc.remove_item(setting.ticket_vnum, 1)
					-- pc.setf("enchanted_forest_zone", "dungeon_enter", 1)
					-- q.end_other_pc_block()
				-- end
				
				addimage(35,35,'jotun.tga')
				say("")
				say("")
				say("")
				say("")
				say("")
				say_center("Devam ettikten sonra t�m ")
				say_center("i�eriye alaca��m seni. ")
				wait()
				enchanted_forest_zone.make_dungeon(party.get_leader_pid(), pc.get_channel_id())
			end
		end
	end
end