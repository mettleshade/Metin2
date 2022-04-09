quest Nephrit_dungeon begin
	state start begin
		when 9258.chat."Nefrit Magaras� " begin
			addimage(35,35,'nefrit.tga')
			if party.is_leader() or party.is_party() then
				say_title_center("Nefrit Ma�aras�:")
				say("")
				say("")
				say("")
				say("")
				say("")
				say_reward_center("Bu zindana grup halinde giremezsin")
				say_reward_center("l�tfen �nce bulundugun grupdan ayril !")
				return
			end
			
			say_title_center(mob_name(9258))
			say("")
			say("")
			say("")
			say("")
			say("")
			say_center("Nefrit Magaras� yeralt�ndaki en tehlikeli[ENTER]yarat�klar�n bulundugu bir yeralt� zindan�[ENTER]giri� yapabilmek i�in 110 seviyenin �st�nde olman gerekiyor")
			say_item(item_name(55036),55036, "")
			wait()
			say_title_center(mob_name(9258))
			addimage(35,35,'nefrit.tga')
			say("")
			say("")
			say("")
			say("")
			say_center("Giri� yapt���nda e�ya yok olacak. ")
			say("")
			say_reward_center("Devam etmek istiyor musun?")
			say("")
			local s = select("Evet", "Hay�r")
			-- ------------ Dungeon Turn Back System ----------------------
			-- pc.remove_turn_back_dungeon()
			-- ------------------------------------------------------------
			if s == 1 then
				if not pc.can_warp() then
					say_title_center(mob_name(9258))
					addimage(35,35,'nefrit.tga')
					say("")
					say("")
					say("")
					say("")
					say("")
					say_center("Hen�z ���nlanamazs�n.")
					say("")
					return
				elseif pc.count_item(55036) < 1 then
					say_title_center(mob_name(9258))
					addimage(35,35,'nefrit.tga')
					say("")
					say("")
					say("")
					say("")
					say("")
					say_center("Envanterinde yeterli miktarda yok:")
					say_center(string.format("%s.", item_name(55036)))
					say("")
					return
				elseif pc.level < 110 or pc.level > 120 then
					say_title_center(mob_name(9258))
					addimage(35,35,'nefrit.tga')
					say("")
					say("")
					say("")
					say("")
					say("")
					say_center("Seviyen giri� gereksinimlerini kar��lam�yor. ")
					say_center("Gereksinimler:")
					say_center(string.format("Minimum Seviye: %d.",110))
					say_center(string.format("Maksimum Seviye: %d.",120))
					say("")
					return
				elseif get_time() < pc.getqf("nc_player_time_110") then
					say_title_center(mob_name(9258))
					addimage(35,35,'nefrit.tga')
					say("")
					say("")
					say("")
					say("")
					say("")
					say_center("Soguma sureniz henuz dolmadi!")
					say_center("Kalan s�re: "..dungeon_get_duration(pc.getqf("nc_player_time_110") - get_global_time()).."")
					say("")
					if (game.get_event_flag("enable_time_Nephrit") == 1) then
						say("Beta Server; s�reyi s�f�rlamak m� istiyorsun?")
						if select("Evet","Hay�r") == 1 then
							pc.setqf("nc_player_time_110",0)
							return
						end
					end
					return
				elseif game.get_event_flag("enable_Nephrit_dungeon") == 1 then
					say_title_center(mob_name(9258))
					addimage(35,35,'nefrit.tga')
					say("")
					say("")
					say("")
					say("")
					say("")
					say("Nefrit Magaras� hen�z aktif durunca de�ildir.")
					say("")
					return
				else
					pc.remove_item(55036, 1)
					pc.setqf("nc_player_time_110", get_time()+60*60*2)
					pc.setqf("join_Nephrit_dung", 1)
					d.join(249)
					--d.new_jump(249, 21144 * 100, 17115 * 100)
				end
			end
		end
		
		when 9258.chat."Ma�ara S�re s�f�rla " with pc.is_gm() begin
			local select_timer = select("S�f�rla", "S�f�rlama")
			if select_timer == 1 then
				pc.setqf("nc_player_time_110", 0)
			end
		end
		
		-------------------------
		when login with pc.get_map_index() == 249 begin
			pc.set_warp_location(67, 2894, 66)
			d.exit()
		end
		
		when logout with pc.get_map_index() >= 2490000 and pc.get_map_index() < 2499999 begin
			------------ Dungeon Turn Back System ----------------------
			pc.setf("Nephrit","dungeon_turn",1)
			------------------------------------------------------------
		end
		
		---------------------------- Floor 1 Start ------------------------------

		when login with pc.get_map_index() >= 2490000 and pc.get_map_index() < 2499999 begin
			if pc.getqf("join_Nephrit_dung") > 0 then
				pc.setqf("join_Nephrit_dung", 0)
				d.setqf2("Nephrit_dungeon","last_exit_time",d.get_map_index())
				d.spawn_mob(4972,609,629)
				d.zodiac_notice_clear()
				d.zodiac_notice("Merhaba Epsilon2'ye �zel Nefrit Ma�aras�na Ho�geldin. 10 Dakika zaman�n var.")
				server_loop_timer('sureyi_baslat', 60*10, d.get_map_index())
			end
		--	cncchat("OpenNephritCoolTime")
			--cncchat("NephritCoolTimeSetFloor 1")
		end

		---------------------------- Dungeon End ------------------------------
			
		when kill with pc.get_map_index() >= 2490000 and pc.get_map_index() < 2499999 and npc.get_race() == 4972 begin
			clear_server_timer('sureyi_baslat',d.get_map_index())
			pc.setqf("join_Nephrit_dung", 0)
			d.zodiac_notice_clear()
			d.zodiac_notice("Nefrit Magarasi ba�ar�l� �ekilde fethedildi! 3 dakika i�erisinde d��ar� g�nderileceksiniz.")
			timer("exit_Nephrit", 60*3)
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

		when exit_Nephrit.timer begin
			d.setqf2("Nephrit_dungeon","last_exit_time",d.get_map_index())
			d.exit_all_to_start_position()
		end
		----------------- Dungeon Time Control ---------------------
	end
end