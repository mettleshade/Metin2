quest devilcatacomb_zone begin
	state start begin
		when 20367.chat."Şeytan Catacomb " begin
			addimage(35,35,'catacomb.tga')
			if party.is_leader() or party.is_party() then
				say_reward_center("Bu zindana grup halinde giremezsin")
				say_reward_center("lütfen önce bulundugun grupdan ayril !")
				return
			end
			-- sys_log(0,"midgard_dungeon quest open")
			
			say_title_center(mob_name(20367))
			addimage(35,35,'catacomb.tga')
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center("Şeytan Catacomb yeraltındaki en tehlikeli[ENTER]yaratıkların bulundugu bir yeraltı zindanı[ENTER]giriş yapabilmek için 75 seviyenin üstünde olman gerekiyor")
			say_item(item_name(30319),30319, "")
			wait()
			say_title_center(mob_name(20367))
			addimage(35,35,'catacomb.tga')
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center("")
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
					say_title_center(mob_name(20367))
					addimage(35,35,'catacomb.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Henüz ışınlanamazsın.")
					say_center("")
					return
				elseif pc.count_item(30319) < 1 then
					say_title_center(mob_name(20367))
					addimage(35,35,'catacomb.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Envanterinde yeterli miktarda yok:")
					say_center(string.format("%s.", item_name(30319)))
					say_center("")
					return
				elseif pc.level < 75 or pc.level > 120 then
					say_title_center(mob_name(20367))
					addimage(35,35,'catacomb.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Seviyen giriş gereksinimlerini karşılamıyor. ")
					say_center("Gereksinimler:")
					say_center(string.format("Minimum Seviye: %d.",75))
					say_center(string.format("Maksimum Seviye: %d.",120))
					say_center("")
					return
				elseif (pc.get_channel_id() == 2 or pc.get_channel_id() == 3 or pc.get_channel_id() == 4 or pc.get_channel_id() == 5 or pc.get_channel_id() == 6) then
					addimage(35,35,'catacomb.tga')
					say("")
					say("")
					say("")
					say("")
					say("")
					say_center("Sadece 1. kanaldan giriş yapabilirsin.")
					return
				elseif get_time() < pc.getqf("devil_cata_sure") then
					say_title_center(mob_name(20367))
					addimage(35,35,'catacomb.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Soguma sureniz henuz dolmadi!")
					say_center("Kalan süre: "..dungeon_get_duration(pc.getqf("devil_cata_sure") - get_global_time()).."")
					say_center("")
					return
				else
					pc.remove_item(30319, 1)
					pc.setqf("devil_cata_sure", get_time()+60*15)
					pc.setqf("join_devil_cata", 1)
					d.new_jump(216, 3145 * 100, 13188 * 100)
				end
			end
		end
		
		when 20367.chat."Mağara Süre sıfırla " with pc.is_gm() begin
			local select_timer = select("Sıfırla", "Sıfırlama")
			if select_timer == 1 then
				pc.setqf("devil_cata_sure", 0)
			end
		end
		
		-------------------------
		when login with pc.get_map_index() == 216 begin
			d.exit_all_to_start_position()
		end
		
		when logout with pc.get_map_index() >= 2160000 and pc.get_map_index() < 2169999 begin
			------------ Dungeon Turn Back System ----------------------
			pc.setf("devilcatacomb_zone","last_exit_time",get_global_time())
			------------------------------------------------------------
		end
		
		---------------------------- Floor 1 Start ------------------------------

		when login with pc.get_map_index() >= 2160000 and pc.get_map_index() < 2169999 begin
			if pc.getqf("join_devil_cata") > 0 then
				pc.setqf("join_devil_cata", 0)
				d.setqf2("devilcatacomb_zone","last_exit_time",d.get_map_index())
				d.spawn_mob(2598,74,1103)
				d.zodiac_notice_clear()
				d.zodiac_notice("Merhaba Epsilon2'ye Özel Şeytan Catacomba Hoşgeldin. 10 Dakika zamanın var.")
				server_loop_timer('sureyi_baslat', 10*60, d.get_map_index())
			end
		--	cmdchat("OpenMidgardCoolTime")
			--cmdchat("MidgardCoolTimeSetFloor 1")
		end

			
		when kill with pc.get_map_index() >= 2160000 and pc.get_map_index() < 2169999 and npc.get_race() == 2598 begin
			clear_server_timer("sureyi_baslat",d.get_map_index())
			d.zodiac_notice_clear()
			pc.setqf("join_devil_cata", 0)
			d.zodiac_notice("Şeytan Catacombu başarılı şekilde fethedildi! 1 dakika içerisinde dışarı gönderileceksiniz.")
			timer("exit_cata", 60*1)
		end
		
		when sureyi_baslat.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindanı tamamlamakta başarısız oldun. 10 saniye içerisinde dışarı ışınlanıyorsun.")
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

		when exit_cata.timer begin
			d.setqf2("devilcatacomb_zone","last_exit_time",d.get_map_index())
			d.exit_all_to_start_position()
		end
		----------------- Dungeon Time Control ---------------------
	end
end