quest mushroom_dungeon begin
	state start begin
		function setting()
		return {
				["base"]={
					["x"] = 21000,
					["y"]= 1000
				},
				["final_boss"] = {
					["x"] = 739,
					["y"] = 831
				}
			}
		end

		when login begin
			if (pc.get_map_index() >= 2440000 and pc.get_map_index() < 2450000) then
				if pc.getqf("join_mashroom_dung") > 0 then
					pc.setqf("join_mashroom_dung", 0)
					d.zodiac_notice_clear()
					timer("seventh", 5)
					d.zodiac_notice("Büyülü Mantar Efsanesini 10 dakikada öldür.")
					server_timer('mushroom5', 10*60,d.get_map_index())
				end
			end
			local idx = pc.get_map_index()
			if idx >= (244 * 10000) and idx < ((244 + 1) * 10000) then
				local level = d.getf("level")
				--d.set_warp_location (0, 0, 0)
			end
			if idx == 244 then
				pc.setf("mashroom_dung","last_exit_time", get_global_time())
				pc.warp(1114400,53400)
			end
		end

		when logout begin
			local idx = pc.get_map_index()
			if idx == 244 or idx >= (244 * 10000) and idx < ((244 + 1) * 10000) then
				--pc.setf("mashroom_dung","last_exit_time", get_global_time())
				------------ Dungeon Turn Back System ----------------------
				pc.setf("mushroom","dungeon_turn",1)
				------------------------------------------------------------
			end
		end
		when 20410.chat."Lanetli Orman (Bireysel)" begin
			addimage(35,35,'mantar.tga')
			if party.is_party() then
				say_center("")
				say_center("")
				say_center("")
				say_center("")
				say_center("")
				say_reward_center("Bu zindana grup halinde giremezsin")
				say_reward_center("lütfen önce bulundugun grupdan ayril !")
				return
			end
			-- sys_log(0,"mushroom_dungeon quest open")

			say_title_center(mob_name(20410))
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center("Lanetli Orman karanlık güçlerin tapınağı")
			say_center("haline gelmiş büyülü bir mekan. Giriş yapabilmek")
			say_center("için 100. seviyenin üzerinde olman gerekiyor.")
			say_center("")
			say_item(item_name(31322),31322, "")
			wait()
			say_title_center(mob_name(20410))
			addimage(35,35,'mantar.tga')
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center(string.format("%s:", item_name(31322)))
			say_center("Giriş yaptığında eşya yok olacak. ")
			say_center("")
			say_reward_center("Devam etmek istiyor musun?")
			say_center("")
			local s = select("Evet", "Hayır")
			-- ------------ Dungeon Turn Back System ----------------------
			-- pc.remove_turn_back_dungeon()
			-- ------------------------------------------------------------
			if s == 1 then
				if not pc.can_warp() then
					say_title_center(mob_name(20410))
					addimage(35,35,'mantar.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Henüz ışınlanamazsın.")
					say_center("")
					return
				end
				if get_time() < pc.getqf("player_dung_65") then
					if pc.is_gm() then
						say_center("Beta Server; süreyi sıfırlamak mı istiyorsun?")
						say_center("Kalan süre: "..dungeon_get_duration(pc.getqf("player_dung_65") - get_global_time()).."")
						if select("Evet","Hayır") == 1 then
							pc.setqf("player_dung_65",0)
							return
						end
					end
					say_title_center(mob_name(20410))
					addimage(35,35,'mantar.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Soguma süren henüz dolmadi !")
					say_center("Kalan süre: "..dungeon_get_duration(pc.getqf("player_dung_65") - get_global_time()).."")
					return
				end
				if pc.get_level() < 100 or pc.get_level() > 120 then
					say_title_center(mob_name(20410))
					addimage(35,35,'mantar.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Giris yapmak için seviyen yetersiz.")
					say_center(string.format("Minimum Seviye: %d.",100))
					say_center(string.format("Maksimum Seviye: %d.",120))
					return
				end	
				
				if pc.count_item(31322) < 1 then
					say_title_center(mob_name(20410))
					addimage(35,35,'mantar.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Envanterinde yeterli miktarda yok:")
					say_reward_center(string.format("%s.", item_name(31322)))
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
					say_center("Lanetli Orman henüz aktif durumda değildir.")
					say_center("")
					return
				else
					pc.setqf("player_dung_65", get_time()+60*60*2)
					pc.remove_item(31322, 1)
					pc.setqf("join_mashroom_dung", 1)
					--d.join(244)
					d.new_jump(244, 21740 * 100, 1730 * 100)
				end
			end
		end -- when
		
		when 20410.chat."Süre sıfırla " with (game.get_event_flag("mashroom_dung_time") == 1) begin
			local select_timer = select("Sıfırla", "Sıfırlama")
			if select_timer == 1 then
				pc.setqf("player_dung_65", 0)
			end
		end

		when seventh.timer begin
			local setting = mushroom_dungeon.setting()
			d.spawn_mob(4969,setting.final_boss.x,setting.final_boss.y)
			cmdchat("MashRoomCoolTimeSetFloor 7")
			d.setf("level", 1)
		end

		when kill with npc.get_race() == 4969 and pc.get_map_index() >= 2440000 and pc.get_map_index() < 2450000 and d.getf("level") == 1 begin
			timer("exitmsh", 3*60)
			d.zodiac_notice_clear()
			pc.setqf("join_mashroom_dung", 0)
			d.zodiac_notice("Tebrikler zindan tamamlandı 3 dakika içerisinde dışarı gönderileceksin.")
		end

		when mushroom5.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindanı tamamlamak için 5 dakika vaktin kaldı.")
				server_timer('mushroom6', 5*60,d.get_map_index())
				clear_server_timer("mushroom5",d.get_map_index())
			end
		end

		when mushroom6.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindanı tamamlamak için 1 dakika vaktin kaldı.")
				server_timer('mushroomend', 60,d.get_map_index())
				clear_server_timer("mushroom6",d.get_map_index())
			end
		end
		when mushroomend.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindanı tamamlamakta başarısız oldun. 10 saniye içerisinde dışarı ışınlanıyorsun.")
				server_timer('mushroomfail', 10,d.get_map_index())
				clear_server_timer("mushroomend",d.get_map_index())
			end
		end
		when mushroomfail.server_timer begin
			if d.select(get_server_timer_arg()) then
				clear_server_timer("mushroomfail",d.get_map_index())
				d.exit_all_to_start_position()
			end
		end

		when exitmsh.timer begin
			d.setqf2("mashroom_dung","last_exit_time", get_global_time())
			d.exit_all_to_start_position()
		end
	end
end