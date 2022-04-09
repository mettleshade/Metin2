quest enfekte_bahce begin
	state start begin
		when 6501.chat."Enfekte Bah�e " with game.get_event_flag("enfekte_bahce") == 0 begin
			if party.is_leader() or party.is_party() then
				say_reward_center("Bu zindana grup halinde giremezsin")
				say_reward_center("l�tfen �nce bulundugun grupdan ayril !")
				return
			end
			-- sys_log(0,"midgard_dungeon quest open")
			
			say_title_center(mob_name(6501))
			say_center("")
			say_center("")
			say_center("")
			say_center("Enfete Bah�e yeralt�ndaki en tehlikeli[ENTER]yarat�klar�n bulundugu bir yeralt� zindan�[ENTER]giri� yapabilmek i�in 120 seviyenin �st�nde olman gerekiyor")
			wait()
			say_title_center(mob_name(6501))
			say_center("")
			say_center("")
			say_center("")
			say_center("Giri� yapt���nda e�ya yok olacak. ")
			say_center("")
			say_reward_center("Devam etmek istiyor musun?")
			say_center("")
			local s = select("Evet", "Hay�r")
			-- ------------ Dungeon Turn Back System ----------------------
			-- pc.remove_turn_back_dungeon()
			-- ------------------------------------------------------------
			if s == 1 then
				if not pc.can_warp() then
					say_title_center(mob_name(6501))
					say_center("")
					say_center("")
					say_center("")
					say_center("Hen�z ���nlanamazs�n.")
					say_center("")
					return
				elseif pc.count_item(42358) < 1 then
					say_title_center(mob_name(6501))
					say_center("")
					say_center("")
					say_center("")
					say_center("Envanterinde yeterli miktarda yok:")
					say_center(string.format("%s.", item_name(42358)))
					say_center("")
					return
				elseif pc.level < 120 then
					say_title_center(mob_name(6501))
					say_center("")
					say_center("")
					say_center("")
					say_center("Seviyen giri� gereksinimlerini kar��lam�yor. ")
					say_center("Gereksinimler:")
					say_center(string.format("Minimum Seviye: %d.",120))
					say_center("")
					return
				elseif get_time() < pc.getqf("enfekte_bekleme_zamani") then
					say_title_center(mob_name(6501))
					say_center("")
					say_center("")
					say_center("")
					say_center("Soguma sureniz henuz dolmadi!")
					say_center("Kalan s�re: "..dungeon_get_duration(pc.getqf("enfekte_bekleme_zamani") - get_global_time()).."")
					say_center("")
					return
				elseif game.get_event_flag("enfekte_bahce") == 1 then
					say_title_center(mob_name(6501))
					say_center("")
					say_center("")
					say_center("")
					say_center("Enfekte hen�z aktif durumda de�ildir.")
					say_center("")
					return
				else
					pc.remove_item(42358, 1)
					pc.setqf("enfekte_bekleme_zamani", get_time()+60*60*2)
					pc.setqf("enfekte_giris", 1)
					--d.new_jump(507, 21144 * 100, 17115 * 100)
					d.new_jump (201 ,4261 * 100, 4993 * 100)
				end
			end
		end
		
		when 6501.chat."Ma�ara S�re s�f�rla " with pc.is_gm() begin
			local select_timer = select("S�f�rla", "S�f�rlama")
			if select_timer == 1 then
				pc.setqf("enfekte_bekleme_zamani", 0)
			end
		end
		
		-------------------------
		when login with pc.get_map_index() == 201 begin
			pc.set_warp_location(67, 2894, 66)
			d.exit()
		end
		
		when logout with pc.get_map_index() >= 2010000 and pc.get_map_index() < 2019999 begin
			------------ Dungeon Turn Back System ----------------------
			pc.setf("enfekte","enfekte_turn",1)
			------------------------------------------------------------
		end
		
		---------------------------- Floor 1 Start ------------------------------

		when login with pc.get_map_index() >= 2010000 and pc.get_map_index() < 2019999 begin
			if pc.getqf("enfekte_giris") > 0 then
				pc.setqf("enfekte_giris", 0)
				d.spawn_mob(6502,496,223)
				d.zodiac_notice_clear()
				d.zodiac_notice("Merhaba Epsilon2'ye �zel Enfekte Bah�eye Ho�geldin. 10 Dakika zaman�n var.")
				server_loop_timer('sureyi_baslat', 10*60, d.get_map_index())
			end
		--	cmdchat("OpenMidgardCoolTime")
			--cmdchat("MidgardCoolTimeSetFloor 1")
		end

			
		when kill with pc.get_map_index() >= 2010000 and pc.get_map_index() < 2019999 and npc.get_race() == 6502 begin
			clear_server_timer("sureyi_baslat",d.get_map_index())
			pc.setqf("enfekte_giris", 0)
			d.zodiac_notice_clear()
			d.zodiac_notice("Enfekte Bah�e ba�ar�l� �ekilde fethedildi! 3 dakika i�erisinde d��ar� g�nderileceksiniz.")
			timer("exit_enfekte", 60*3)
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


		when exit_enfekte.timer begin
			-- d.setqf2("midgard_dungeon","last_exit_time",d.get_map_index())
			clear_server_timer("exit_enfekte",d.get_map_index())
			d.exit_all_to_start_position()
		end
		----------------- Dungeon Time Control ---------------------
	end
end