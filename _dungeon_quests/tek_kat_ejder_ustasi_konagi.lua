quest ejderha_ustasi_konagi begin
	state start begin
		function setting()
		return {
				["boss"] = 6500,
				["boss_konum"] = {372,109},
			}
		end

		when login begin
			if (pc.get_map_index() >= 600000 and pc.get_map_index() < 609999) then
				if pc.getqf("ejderha_konagi_giris") > 0 then
					pc.setqf("ejderha_konagi_giris", 0)
					d.spawn_mob (6500, 372, 109)
					d.zodiac_notice_clear()
					d.zodiac_notice("Merhaba Epsilon2'ye �zel Ejdeha Kona��na Ho�geldin !")
					d.setqf2("ejderha_konagi","zaman", get_global_time())
					d.setf("level", 1)
					server_loop_timer('edjer_konagi1', 5, d.get_map_index())
					server_loop_timer("ejder_konagi_zindan_basla", 3, d.get_map_index())
				end
			end

			local idx = pc.get_map_index()
			if idx >= (60 * 10000) and idx < ((60 + 1) * 10000) then
				local level = d.getf("level")
			end

			if idx == 60 then
				pc.setf("ejderha_konagi","zaman", get_global_time())
				pc.warp(432000,165000)
			end
		end

		when logout begin
			local idx = pc.get_map_index()
			if idx == 60 or idx >= (60 * 10000) and idx < ((60 + 1) * 10000) then
				pc.setf("ejderha_konagi","zindan_bitis",1)
			end
		end

		when 9267.chat."Ejderha Kona�� " begin
			if party.is_party() then
				say_title_center("Ejderha Kona��:")
				say_reward_center("Bu zindana grup halinde giremezsin")
				say_reward_center("l�tfen �nce bulundugun grupdan ayril !")
				return
			end

			say_title_center(mob_name(9267))
			addimage(35,35,'usta.tga')
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center("Ejderha Kona�� karanl�k g��lerin ele")
			say_center("Ge�irdi�i Bir Diyard�r. Giri� yapabilmek")
			say_center("i�in 110. seviyenin �zerinde olman gerekiyor.")
			say_center("")
			say_item(item_name(42198),42198, "")
			wait()
			say_title_center(mob_name(9267))
			addimage(35,35,'usta.tga')
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center("")
			say_center(string.format("%s:", item_name(42198)))
			say_center("Giri� yapt���nda e�ya yok olacak. ")
			say_center("")
			say_reward_center("Devam etmek istiyor musun?")
			say_center("")
			local s = select("Evet", "Hay�r")
			if s == 1 then
				if not pc.can_warp() then
					say_title_center(mob_name(9267))
					addimage(35,35,'usta.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Hen�z ���nlanamazs�n.")
					say_center("")
					return
				end

				if get_time() < pc.getqf("ejderha_zindan_zaman") then
					say_title_center(mob_name(9267))
					addimage(35,35,'usta.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Soguma s�ren hen�z dolmadi !")
					say_center("Kalan s�re: "..dungeon_get_duration(pc.getqf("ejderha_zindan_zaman") - get_global_time()).."")
					return
				end

				if pc.get_level() < 110 or pc.get_level() > 120 then
					say_title_center(mob_name(9267))
					addimage(35,35,'usta.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Giris yapmak i�in seviyen yetersiz.")
					say_center(string.format("Minimum Seviye: %d.",110))
					say_center(string.format("Maksimum Seviye: %d.",120))
					return
				end	
				
				if pc.count_item(42198) < 1 then
					say_title_center(mob_name(9267))
					addimage(35,35,'usta.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Envanterinde yeterli miktarda yok:")
					say_reward_center(string.format("%s.", item_name(42198)))
					say_center("")
					return
				end
				if game.get_event_flag("ejderha_ustasi_konagi") == 1 then
					say_title_center(mob_name(9267))
					addimage(35,35,'nemere.tga')
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("")
					say_center("Nemere Hen�z Aktif De�il.")
					say_center("")
					return
				else
					pc.setqf("ejderha_zindan_zaman", get_time()+60*60*2)
					pc.remove_item(42198, 1)
					pc.setqf("ejderha_konagi_giris", 1)
					d.new_jump(60, 4962 * 100, 11659 * 100)
				end
			end
		end
		
		when 9267.chat."S�re s�f�rla " with pc.is_gm() begin
			local select_timer = select("S�f�rla", "S�f�rlama")
			if select_timer == 1 then
				pc.setqf("ejderha_zindan_zaman", 0)
			end
		end

		when ejder_konagi_zindan_basla.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Ejderha Kral� Akzadur'u yok edin.")
				clear_server_timer("ejder_konagi_zindan_basla",d.get_map_index())
			end	
		end

		when kill with npc.get_race() == 6500 and pc.get_map_index() >= 600000 and pc.get_map_index() < 609999 and d.getf("level") == 1 begin
			timer("exitmsh", 1*60)
			pc.setqf("ejderha_konagi_giris", 0)
			d.zodiac_notice_clear()
			d.zodiac_notice("Tebrikler zindan� tamamlad�n�z 1 dakika i�erisinde d��ar� g�nderileceksin.")
		end

		when edjer_konagi1.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindan� tamamlamak i�in 15 dakika vaktin kald�.")
				server_loop_timer('edjer_konagi2', 10*60,d.get_map_index())
				clear_server_timer("edjer_konagi1",d.get_map_index())
			end
		end
		when edjer_konagi2.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindan� tamamlamak i�in 5 dakika vaktin kald�.")
				server_loop_timer('edjer_konagi3', 5*60,d.get_map_index())
				clear_server_timer("edjer_konagi2",d.get_map_index())
			end
		end

		when edjer_konagi3.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindan� tamamlamak i�in 1 dakika vaktin kald�.")
				server_loop_timer('edjer_konagi_son', 60,d.get_map_index())
				clear_server_timer("edjer_konagi3",d.get_map_index())
			end
		end
		when edjer_konagi_son.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.zodiac_notice_clear()
				d.zodiac_notice("Zindan� tamamlamakta ba�ar�s�z oldun. 10 saniye i�erisinde d��ar� ���nlan�yorsun.")
				server_loop_timer('edjer_konagi_basarisiz', 10,d.get_map_index())
				clear_server_timer("edjer_konagi_son",d.get_map_index())
			end
		end
		when edjer_konagi_basarisiz.server_timer begin
			if d.select(get_server_timer_arg()) then
				clear_server_timer("edjer_konagi_basarisiz",d.get_map_index())
				d.exit_all_to_start_position()
			end
		end

		when exitmsh.timer begin
			d.setqf2("ejderha_konagi","zaman", get_global_time())
			d.exit_all_to_start_position()
		end
	end
end