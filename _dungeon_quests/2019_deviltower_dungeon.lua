quest deviltower_zone begin
    state start begin
        when login begin
            if pc.get_map_index() == 66 then
                if pc.get_x() < 2048+88 or pc.get_y() < 6656+577 or pc.get_x() > 2048+236 or pc.get_y() > 6656+737 then
                    --pc.warp(590500, 110500)
                end
                -- pc.set_warp_location(65, 5905, 1105)
            elseif pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 then
                -- pc.set_warp_location(65, 5905, 1105)				
               -- deviltower_zone.register_player(pc.get_vid())
            end
        end

	when logout begin
		if pc.count_item(30300) >= 1 then
			pc.remove_item(30300, pc.count_item(30300))
		end
		if pc.count_item(30302) >= 1 then
			pc.remove_item(30302, pc.count_item(30302))
		end				
		if pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 then
			-- deviltower_zone.unregister_player(pc.get_vid())		
			------------ Dungeon Turn Back System ----------------------
			pc.setf("devil_tower","dungeon_turn",1)
			------------------------------------------------------------
		end
	end
    when 20348.chat."�eytan Kulesi " begin
	    if pc.get_level() < 40 then
			say_title_center("�eytan Kulesi Bek�isi:")
			say(locale.deviltower_man_say_you_cant)
	    else
			say_title_center("�eytan Kulesi Bek�isi:")
			addimage(35,35,'kule.tga')
			say("")
			say("")
			say("")
			say("")
			say(locale.deviltower_man_say)
			local secim = select(locale.kulesecim,locale.kulesecimiki,locale.kulesecimuc,"Vazge�tim")
			if secim == 1 then
				------------ Dungeon Turn Back System ----------------------
				pc.remove_turn_back_dungeon()
				------------------------------------------------------------
				pc.warp(216500,727000)
			elseif secim == 2 then
			
				say_npc()
				say("E�er 50.000.000 yang verirsen seni hi�bir")
				say("�eyle u�ra�t�rmadan 2.Kat'a g�nderebilirim.")
				say("ister misin?")
				local icsecimiki = select("Girmek istiyorum","Girmek istemiyorum.")
				if icsecimiki ==1 then
					if pc.get_money() < 50000000 then
						say_npc()
						say_reward("Hay aksi!") 
						say("Seni i�eri alamam envanterinde yeterli") 
						say("yang bulamad�m bana 50.000.000 yang getirmelisin.") 
						return 
					end
					--[[if pc.is_busy() then
						say_npc()
						say_reward("Hay aksi!")							
						say("Di�er penceleri kapatmadan buraya giremezsin.")
						say("Ticaret, NPC, Depo gibi.")
						say("Ek olarak 10 saniye beklemen gerekebilir.")
						return
					end		--]]
					pc.change_money(-50000000) 
					--d.new_jump(66, special.devil_tower[1][1], special.devil_tower[1][2])
					------------ Dungeon Turn Back System ----------------------
					pc.remove_turn_back_dungeon()
					------------------------------------------------------------
					d.new_jump(66, special.devil_tower[1][1] * 100, special.devil_tower[1][2] * 100)
					d.regen_file("data/dungeon/deviltower2_regen.txt")
					d.set_warp_at_eliminate(4, d.get_map_index(), special.devil_tower[2][1], special.devil_tower[2][2], "data/dungeon/deviltower3_regen.txt")
				end
			elseif secim == 3 then
				say_npc()
				say("E�er 75.000.000 yang verirsen seni ve grubunu hi�bir")
				say("�eyle u�ra�t�rmadan 2.Kat'a g�nderebilirim.")
				say("�ster misin?")
				local icsecimgrup = select("Girmek �stiyorum","Girmek �stemiyorum.")
				if icsecimgrup ==1 then
					if pc.get_money() < 75000000 then
						say_npc()
						say_reward("Hay aksi!") 
						say("Seni i�eri alamam envanterinde yeterli") 
						say("yang bulamad�m bana 75.000.000 yang getirmelisin.") 
						return 
					end
					if not party.is_party() then
						say_npc()
						say_reward("Heey "..pc.get_name().."")
						say("Bu i�lemi yapmak istiyorsan �nce grup olmal�s�n")
						say("unutma kulede insanlar de�i�ebilir kendine")
						say("g�venilir bir grup kurman� tavsiye ederim")
						return
					end
					if not party.is_leader() then
						say_npc()
						say_reward("Heey "..pc.get_name().."")
						say("Cesaretini takdir ediyorum ama")
						say("yaln�zca grup lideri giri� talebi yapabilir.")
						return
					end
					--[[if pc.is_busy() then
						say_npc()
						say_reward("Hay aksi!")							
						say("Di�er penceleri kapatmadan buraya giremezsin.")
						say("Ticaret, NPC, Depo gibi.")
						say("Ek olarak 10 saniye beklemen gerekebilir.")
						return
					end		--]]
					------------ Dungeon Turn Back System ----------------------
					pc.remove_turn_back_dungeon()
					------------------------------------------------------------
					pc.change_money(-75000000) 
					d.new_jump_party(66, special.devil_tower[1][1], special.devil_tower[1][2])
					d.regen_file("data/dungeon/deviltower2_regen.txt")
					d.set_warp_at_eliminate(4, d.get_map_index(), special.devil_tower[2][1], special.devil_tower[2][2], "data/dungeon/deviltower3_regen.txt")
				end
			end
	    end
    end
        when kill with npc.get_race() == 8015  begin
            timer("devil_stone1_1", 8)
        end
        when devil_stone1_1.timer begin
            d.new_jump_all(66, special.devil_tower[1][1], special.devil_tower[1][2])
            d.regen_file("data/dungeon/deviltower2_regen.txt")
            d.set_warp_at_eliminate(4, d.get_map_index(), special.devil_tower[2][1], special.devil_tower[2][2], "data/dungeon/deviltower3_regen.txt")
        end
        when kill with npc.get_race() == 1091 begin
            d.set_warp_at_eliminate(4, d.get_map_index(), special.devil_tower[3][1], special.devil_tower[3][2], "data/dungeon/deviltower4_regen.txt")
            d.check_eliminated()
        end
        function get_4floor_stone_pos()
	    local positions = 
			{
				{368, 629}, {419, 630}, {428, 653}, {422, 679},
				{395, 689}, {369, 679}, {361, 658},
			}
            for i = 1, 6 do
                local j = number(i, 7)
                if i != j then
                    local t = positions[i];
                    positions[i] = positions[j];
                    positions[j] = t;
                end
            end
            return positions
        end
        when kill with pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 and npc.get_race() == 8016 begin
            d.setf("level", 4)
            local positions = deviltower_zone.get_4floor_stone_pos()
            for i = 1, 6 do
                d.set_unique("fake" .. i , d.spawn_mob(8017, positions[i][1], positions[i][2]))
            end
            local vid = d.spawn_mob(8017, positions[7][1], positions[7][2])
            d.set_unique("real", vid)
	    server_loop_timer('devil_stone4_update', 10, pc.get_map_index())
	    server_timer('devil_stone4_fail1', 5*60, pc.get_map_index())

            d.notice("4. Kat Se�enek Kap�s�ndas�n.");
			d.notice("G�zlerini ve kulaklar�n� aldatacak bir �ok sahte");
			d.notice("Metin Ta�� mevcut. 15 dakika i�erisinde");
			d.notice("ger�ek Metin Ta��'n� bul ve yok et!");
			d.notice("Kap�dan ge�menin tek yolu budur.");
        end

        when devil_stone4_fail1.server_timer begin
            if d.select(get_server_timer_arg()) then
                d.notice("10 dakika kald� ")
		server_timer('devil_stone4_fail2', 5*60, get_server_timer_arg())
            end
        end

        when devil_stone4_fail2.server_timer begin
            if d.select(get_server_timer_arg()) then
               d.notice("5 dakika kald� ")
		server_timer('devil_stone4_fail', 5*60, get_server_timer_arg())
            end
        end

        when devil_stone4_fail.server_timer begin
            if d.select(get_server_timer_arg()) and d.getf("level") == 4 then
                d.notice("Zaman doldu! ")
                d.exit_all()
            end
        end

        when devil_stone4_update.server_timer begin
            if d.select(get_server_timer_arg()) then
                if not d.is_unique_dead("real") then
                    for i = 1, 6 do
                        if d.getf("fakedead" .. i) == 0 then
                            if d.unique_get_hp_perc("fake" .. i) < 50 then
                                d.purge_unique("fake" .. i)
                                d.setf("fakedead" .. i, 1)
                                d.notice("Sahte Metin ta�lar� yok oldu...");
                            end
                        end
                    end
                else
                    server_timer("devil_stone4_end", 5, get_server_timer_arg())
                    
                    d.notice("M�kemmel bir duyma yetene�ine ve iyi bir");
					d.notice("i�g�d�ye sahip oldu�unu kan�tlayarak");
					d.notice("ger�ek Metin Ta��'n� yok ettin!");
					d.notice("�imdi 5.kata gireceksin.")
                    d.purge()
                end
            else
		server_timer('devil_stone4_stop_timer', 1, get_server_timer_arg())
            end
        end

        when devil_stone4_stop_timer.server_timer begin
	    clear_server_timer('devil_stone4_update', get_server_timer_arg())
        end

        when devil_stone4_end.server_timer begin
            if d.select(get_server_timer_arg()) then
			clear_server_timer('devil_stone4_update', get_server_timer_arg())
			clear_server_timer('devil_stone4_fail1', get_server_timer_arg())
			clear_server_timer('devil_stone4_fail2', get_server_timer_arg())
			clear_server_timer('devil_stone4_fail', get_server_timer_arg())

                d.setf("level", 5)
                d.setf("stone_count", 5)
                
                d.jump_all(special.devil_tower[4][1], special.devil_tower[4][2])
                d.notice("5.Kattaki M�h�rl� Kap�'das�n. Bir sonraki kata ")
				d.notice("��kmak i�in be� Eski M�h�r'� a�man gerek. Bu alan ")
				d.notice("sana sald�rmak i�in bekleyen canavarlarla dolu.")
				d.notice("Baz�lar�n�n �zerinde anahtar var. Yeteri kadar ")
				d.notice("Kilit A�ma Ta�� elde eder ve t�m m�h�rleri ")
				d.notice("a�arsan 6. kata ��kabilirsin. Ama bil ki sadece ")
				d.notice("20 dakikan var!")

                
		server_timer('devil_stone5_fail1', 5*60, get_server_timer_arg())
		clear_server_timer('devil_stone4_update', get_server_timer_arg())

                d.set_regen_file("data/dungeon/deviltower5_regen.txt")

                d.spawn_mob(20073, 421, 452)
                d.spawn_mob(20073, 380, 460)
                d.spawn_mob(20073, 428, 414)
                d.spawn_mob(20073, 398, 392)
                d.spawn_mob(20073, 359, 426)
            end
        end
        when devil_stone5_fail1.server_timer begin
            if d.select(get_server_timer_arg()) then
               d.notice("15 dakika kald� ")
		server_timer('devil_stone5_fail2', 5*60, get_server_timer_arg())
            end
        end

        when devil_stone5_fail2.server_timer begin
            if d.select(get_server_timer_arg()) then
                d.notice("10 dakika kald� ")
		server_timer('devil_stone5_fail3', 5*60, get_server_timer_arg())
            end
        end

        when devil_stone5_fail3.server_timer begin
            if d.select(get_server_timer_arg()) then
                d.notice("5 dakika kald� ")
		server_timer('devil_stone5_fail', 5*60, get_server_timer_arg())
            end
        end

        when devil_stone5_fail.server_timer begin
            if d.select(get_server_timer_arg()) and d.getf("level") == 5 then
		d.notice("Zaman doldu!")
		d.exit_all()
            end
        end

		when kill with npc.get_race() == 8023 begin
			game.drop_item(50084, 1)
		end
		
        when kill with pc.in_dungeon() and d.getf("level") == 5 and npc.get_race() == 1062 begin
            local KILL_COUNT_FOR_DROP_KEY = 50
            local n =d.getf("count") + 1
            d.setf("count", n)
            if n == KILL_COUNT_FOR_DROP_KEY then
                game.drop_item(50084, 1)
                d.setf("count", 0)
            end
        end
        when devil_stone5.take with item.vnum == 50084 begin
            npc.purge()
            item.remove()
            d.setf("stone_count", d.getf("stone_count") - 1)
            if d.getf("stone_count") <= 0 then
            	d.clear_regen()
            	d.kill_all()
                d.notice("M�hr� a�t�n. 6. Kata ��k�yorsunuz!")

		clear_server_timer('devil_stone5_fail1', get_server_timer_arg())
		clear_server_timer('devil_stone5_fail2', get_server_timer_arg())
		clear_server_timer('devil_stone5_fail3', get_server_timer_arg())
		clear_server_timer('devil_stone5_fail', get_server_timer_arg())
		
                d.setf("level", 6)
                d.jump_all(special.devil_tower[5][1], special.devil_tower[5][2])
				d.regen_file("data/dungeon/deviltower6_regen.txt")
		
                d.notice("�eytan Krala ula�mak i�in t�m ")
                d.notice("�eytanlar� �ld�r!")

            else
                d.notice("M�hr� a�t�n! "..d.getf("stone_count").." kald�.")
            end
        end

        when kill with npc.get_race() == 1092 begin
            d.kill_all()
            d.check_eliminated()
            local reward_alchemist = {20074, 20075, 20076}
            d.spawn_mob(reward_alchemist[number(1,3)], 425, 216);
            d.setqf("can_refine", 1)
        end

   
	when 20074.chat."�st katlar" or 20075.chat."�st katlar" or 20076.chat."�st katlar" with pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 begin
		if not npc.lock() then
            say("")
            say("�u anda ba�ka biriyle konu�uyorum!")
            say("Biraz bekle ya da sonra tekrar gel!")
            return
        end
		say_title(mob_name(npc.get_race()))
		say("Kulenin 7. kat�na girmek mi istiyorsun?")
		say("Bu katla m�cadele etmek muhte�em beceriler ve")
		say("b�y�k bir yazg� gerektirir.")
		say("Sadece 75. seviyeye ula�t�ysan")
		say("seni oraya ���nlayabilirim.")
		wait()
			if pc.level >=75 then
			say_title(mob_name(npc.get_race()))
			say("�st kata ��kmak i�in")
			say("yeterli deneyime ve g�ce sahipsin.")
			say("Girebilirsin!")
			say("")
			local gec = select("Git!","Vazge� ","Kuleyi terket!")
				if gec == 1 then
				timer("devil_jump_7",6)
				npc.unlock()
				npc.purge()
				return
				elseif gec == 2 then
					npc.unlock()
				return
				elseif gec == 3 then
				npc.unlock()
				pc.warp(590500, 110500)
				end
			else
			say_title(mob_name(npc.get_race()))
			say("�zg�n�m sadece")
			say("75. seviyeye ula�anlar� bir")
			say("�st kata alabilirim.")
			say("")
			npc.unlock()
			wait()
			pc.warp(590500, 110500)
			return
			end
		end

   when devil_jump_7.timer begin
		d.clear_regen()

		d.spawn_mob(8018, 639, 658)
		d.spawn_mob(8018, 611, 637)
		d.spawn_mob(8018, 596, 674)
		d.spawn_mob(8018, 629, 670)

		d.setf("level", 7)

		d.jump_all(2048+590, 6656+638)
	end
	
	when kill with pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 and npc.get_race() == 8018 begin
		local cont = d.getf("7_stone_kill") + 1
		d.setf("7_stone_kill", cont)

		if cont >= 4 then
			d.setf("7_stone_kill", 0)
			d.set_regen_file("data/dungeon/deviltower7_regen.txt")
        end
	end

	when kill with pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 and npc.get_race() == 8019 begin
		game.drop_item(30300, 1)
	end

	when 30300.use with pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 begin
		pc.remove_item("30300", 1)

		local pct = number(1,8)

		if pct == 1 then
			game.drop_item(30302, 1)
			d.clear_regen()
		else
			game.drop_item(30301, 1)
			
		end
	end

	when 30302.use with pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 begin
		-- 8������ ����

			if d.getf( "level" ) != 7 then
				pc.remove_item( "30302", 1)
				return
			end
			
		say("Bu haritayla bir sonraki kata ��kabilirim!")
		pc.remove_item("30302", 1)
	    timer("devil_jump_8", 6)
		d.clear_regen()
	end
						
	--------------------------------------------
	-- 8�� ���Ժ��� 9�� ����
	--------------------------------------------
	when devil_jump_8.timer begin
		d.setf("level", 8)
		d.jump_all(2048+590, 6656+403)
		d.set_regen_file("data/dungeon/deviltower8_regen.txt")
		d.spawn_mob(20366, 640, 460)
		local _count = pc.count_item(30302)
		pc.remove_item(30302,_count)
		
	end

	when kill with pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 and npc.get_race() == 1040 begin
		if d.getf("level") < 9 then
			local pct1 = number(1, 10)
			if pct1 == 1 then
				local pct2 = number(1, 4)
				if pct2 == 1 then
					-- ��¥ ���� ���
					game.drop_item(30304, 1)
				else
					-- ��¥ ���� ���
					game.drop_item(30303, 1)
				end
			else
				return
			end
		end
	end

	when 20366.take with item.vnum == 30304 begin
		-- ���� ��ü 9�� ����
		npc.purge()
		item.remove()
		timer("devil_jump_9", 8)
	end

	---------------------------------------------
	-- 9�� ���Ժ��� �Ϸ����
	---------------------------------------------
	when devil_jump_9.timer begin
		d.setf("level", 9)
		d.jump_all(2048+590, 6656+155)
		d.regen_file("data/dungeon/deviltower9_regen.txt")
	end

	when kill with pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 and npc.get_race() == 1093 begin
		d.kill_all()
		timer("devil_end_jump", 30)
	end

	when devil_end_jump.timer begin
	    d.exit_all()
	end
	function register_player(vid)
		local player_count = d.getf("player_count")
		player_count = player_count + 1
		d.setf("player_count", tonumber(player_count))
		d.setf(string.format("player%d", player_count), tonumber(vid))
	end	
	function unregister_player(vid)
		local player_count = d.getf("player_count")
		local found = false
		for i = 1, player_count, 1 do
			if found == true then
				d.setf(string.format("player%d", tonumber(i)), d.getf(string.format("player%d", i+1)))
			end
			p = d.getf("player"..tostring(i))
			if p == vid then
				i = i -1
				found = true
			end
		end	
		if found == true then
			d.setf("player_count", tonumber(player_count - 1))
		end
	end	
	function get_players()
		local players = {}
		local player_count = d.getf("player_count")
		for i = 1, player_count, 1 do
			players[i] = d.getf("player"..tostring(i))
		end
		return players
	end
	function give_dc_access(pindex)
		local self_checked = false
		local self = pc.select(d.getf("player"..tostring(pindex)))
		--pc.setqf("dcenter", 1)
		pc.setf("deviltower_zone", "dcenter", 1)
		pc.select(self)
	end
end
end
