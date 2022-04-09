quest spider_dungeon_3floor_boss begin
	state start begin
		when spider_end_timer.server_timer with game.get_event_flag("spider_dead"..get_channel_id()) == 0 begin  --
			warp_all_in_area_to_area(82700, 612700, 93700,625700, 68700, 610800, 68700, 610800)
			game.set_event_flag("spider_lair_ongoing_"..get_channel_id(),0)
			game.set_event_flag("spider_lair_leader_"..get_channel_id(), 0)
			game.set_event_flag("spider_dead"..get_channel_id(),0)
			game.set_event_flag("spider_key_dropped"..get_channel_id(), 0)

			purge_area(82700, 612700, 93700,625700)
		end
		
		when spider_dead_timer.server_timer begin
			warp_all_in_area_to_area(82700, 612700, 93700,625700, 68700, 610800, 68700, 610800)
			game.set_event_flag("spider_lair_ongoing_"..get_channel_id(), 0)
			game.set_event_flag("spider_lair_leader_"..get_channel_id(), 0)
			game.set_event_flag("spider_dead"..get_channel_id(),0)
			game.set_event_flag("spider_key_dropped"..get_channel_id(), 0)
			purge_area(82700, 612700, 93700,625700)
		end

		when login or levelup or enter with pc.get_level() >= 50 begin
			set_state( boss_ok )
		end
		
		when 30130.chat." Yuvaya giri� " begin
			say("Bu kap� sadece Archadia Anahtar�[ENTER]a��l�r.")
		end
	end


	state boss_ok begin
		when 20011.chat." Arachnida Anahtar� " begin
			if pc.count_item(30025) > 0 and pc.count_item(30056) > 0 and pc.count_item(30057) > 0 and pc.count_item(30058) > 0 and pc.count_item(30059) > 0 and pc.count_item(30326) > 0 then
				say_title(mob_name(20011))
				say("Harika! Arachnida anahtar� �retmek i�in gerekli[ENTER]olan t�m malzemeler haz�r. Bir saniye bekle. Fazla[ENTER]uzun s�rmeyecek...")
				pc.remove_item(30025, 1)
				pc.remove_item(30056, 1)
				pc.remove_item(30057, 1)
				pc.remove_item(30058, 1)
				pc.remove_item(30059, 1)
				pc.remove_item(30326, 1)
				if math.random(1,2000) <= 1000 then
					say("Ah, evet ba�ard�m! Arachnida anahtar� �rettim. Bu[ENTER]�r�mcek Barones'e inmenizi sa�layacak.Uzun[ENTER]bacakl� d��manlar�n�za kar�� sana ve silah[ENTER]arkada�lar�na iyi �anslar dilerim! Ama acele edin[ENTER]anahtar �ok k�r�lgan. 24 saat sonra par�alara[ENTER]ayr�lacakt�r.")
					pc.give_item2(30324, 1)
				else
					say("Ah, hay�r... Korkar�m ki bu sefer ba�aramad�m. Bu[ENTER]anahtar�n �retimi son derece kar���k. En k���k hata[ENTER]pahal�ya mal oluyor. Ne yaz�k ki anahtar �retmek[ENTER]i�in toplad���n t�m malzemeler bo�a gitti. Ama[ENTER]eminim bir dahaki sefere ba�araca��z!")
				end
			else
				say_title(mob_name(20011))
				say("Bir �ey eksik, Arachnida Anahtar�'n� bu �ekilde[ENTER]�retmem m�mk�n de�il. Laz�m olanlar� bir kez daha[ENTER]hat�rlatay�m: bir �r�mcek zehir kesesi, bir �r�mcek[ENTER]yumurta kesesi, bir �r�mcek a��, �r�mcek g�zleri[ENTER]�r�mcek bacaklar� ve krali�e �r�mcek zehri.")
			end
		end

		when 30130.chat." Yuvaya giri� " begin
			addimage(35,35,'barones.tga')
			if (pc.get_channel_id() == 2 or pc.get_channel_id() == 3 or pc.get_channel_id() == 4 or pc.get_channel_id() == 5 or pc.get_channel_id() == 6) then
				say_title_center("Baronesin ini:")
				addimage(35,35,'barones.tga')
				say("")
				say("")
				say("")
				say("")
				say("")
				say_center("Sadece 1. kanaldan giri� yapabilirsin.")
				return
			end
		
			if game.get_event_flag("spider_lair_ongoing_"..get_channel_id()) == 1 then
			
				local starttime = game.get_event_flag("spider_lair_start_time_"..get_channel_id())
				local current_time = get_global_time()
				
				if party.get_leader_pid() == game.get_event_flag("spider_lair_leader_"..get_channel_id()) then
				
					if  starttime +  300 >= current_time  and party.get_leader_pid() == game.get_event_flag("spider_lair_leader_"..get_channel_id()) and game.get_event_flag("spider_lair_ongoing_"..get_channel_id()) == 1 then
						say_title_center("Baronesin ini:")
						addimage(35,35,'barones.tga')
						say("")
						say("")
						say("")
						say("")
						say("")
						say_center("Grup liderin yuvaya girdi. Sen de i�eriye[ENTER]girip Barones ile sava�mak istiyor musun? ") -- �׽�Ʈ��
						local warp =  select(locale.confirm,locale.cancel)
						if warp == 1 then
							pc.setqf("firstIn",1)
							pc.setqf("retry_limit_time", starttime + 1200 + 3600 )
							set_state(inLair)
							pc.warp(88100,614800)
							return
						end
					else
						say_title_center("Baronesin ini:")
						addimage(35,35,'barones.tga')
						say("")
						say("")
						say("")
						say("")
						say("")
						say_center("S�re bitti. Anahtar par�aland�.[ENTER]Yeniden Anahtar �retmelisin. ") -- �׽�Ʈ��
						return
					end
				else
					local remain_time = (game.get_event_flag("spider_lair_end_time_"..get_channel_id() ) - get_global_time()) / 60
					if remain_time < 0 then
						say_title_center("Baronesin ini:")
						addimage(35,35,'barones.tga')
						say("")
						say("")
						say("")
						say("")
						say("")
						say_center("Bu i�e yaramad�. L�tfen tekrar deneyin!")
						game.set_event_flag("spider_lair_ongoing_"..get_channel_id(),0)
						game.set_event_flag("spider_lair_leader_"..get_channel_id(), 0)
						game.set_event_flag("spider_dead"..get_channel_id(),0)
						return
					end
					say_title_center("Baronesin ini:")
					addimage(35,35,'barones.tga')
					say("")
					say("")
					say("")
					say("")
					say("")
					say_center("�u an ba�ka bir grup yuvada Barones ile[ENTER]sava��yor. Onlar�n sava�� bitirmesini bekle. ")
					say_center(string.format("�nceki grup i�eriden ��kt�ktan sonra girebilirsin: Kalan zaman %s[ENTER]dakika. ", math.ceil(remain_time)))
					return
				end	
			elseif  pc.getqf("retry_limit_time") > get_global_time() then
								local access_limit = (pc.getqf("retry_limit_time") - get_global_time()) / 60
				say_title_center("Baronesin ini:")
				addimage(35,35,'barones.tga')
				say("")
				say("")
				say("")
				say("")
				say("")
				say_center("Son sava��n �zerinden en az bir saat ge�meesi[ENTER]gerekiyor. Bu s�ree i�esinde tekrar Barones'in[ENTER]yuvas�na giremezsin.Kalan zaman:")
				-- here we should also change to string.format %s key
				say_center(string.format("%s dakika ", math.ceil(access_limit)))
				return
			elseif party.is_leader()   then
				 if false == pc.can_warp() then
					say_title_center("Baronesin ini:")
					addimage(35,35,'barones.tga')
					say("")
					say("")
					say("")
					say("")
					say("")
					say_center("�u anda bu alana giremezsin.[ENTER]L�tfen biraz bekleyin.")
					return
				 end
				if pc.count_item(30324) > 0 then
					say_title_center("Baronesin ini:")
					addimage(35,35,'barones.tga')
					say("")
					say("")
					say("")
					say("")
					say("")
					say("Fetih mi ba�latmak istiyorsun? Bunu yapmaya 20[ENTER]dakika zaman�n var. Bu s�re bitmeden �nce hi�[ENTER]kimse Barones'in yuvas�n� terk edemez. Yeni bir[ENTER]fetih bir saat sonra ger�ekle�tirilebilir.")
					local warp = select(locale.confirm,locale.cancel)
					if warp == 1 then
						
						set_state(inLair)
						
						pc.remove_item(30324, 1)
						
						mob.spawn(2094,369,551,0,0)
						
						game.set_event_flag("spider_lair_ongoing_"..get_channel_id()		,			1)
						game.set_event_flag("spider_lair_start_time_"..get_channel_id()	, get_global_time())
						game.set_event_flag("spider_lair_end_time_"..get_channel_id()		, get_global_time() + 1200)
						game.set_event_flag("spider_lair_leader_"..get_channel_id()			, party.get_leader_pid())
						
						pc.setqf("retry_limit_time", get_global_time() + 1200 + 3600 )
						pc.setqf("firstIn",1)
						
						
						server_timer("spider_end_timer", 1200 )
						
						
						pc.warp(88100,614800)
					end
					return
				else
					say_title_center("Baronesin ini:")
					addimage(35,35,'barones.tga')
					say("")
					say("")
					say("")
					say("")
					say("")
					say("Bu kap�y� sadece Arachnida anahtar� a�ar.")
					return
				end
			else
				say_title_center("Baronesin ini:")
				addimage(35,35,'barones.tga')
				say("")
				say("")
				say("")
				say("")
				say("")
				say("Bu kap�y� ancak bir grup lideri a�abilir.")
				return
			end
			
		end
		

	end

	state inLair begin
		when 20011.chat." �Z3 G�rev " with is_test_server() begin   --�׽�Ʈ��
			set_state(start)
			say("Anahtar �retimi ")
		end
		


		when login  begin 
			if get_global_time() < pc.getqf("retry_limit_time") -  3600 and party.get_leader_pid() == game.get_event_flag("spider_lair_leader_"..get_channel_id()) then
				pc.setqf("firstIn",0)
			elseif pc.getx() >= 827 and pc.getx() <= 937 and pc.gety() >= 6127 and  pc.gety() <= 6257 then 
				pc.warp(95900,571000)
				pc.remove_item(30327, 1)
			else
				pc.remove_item(30327, 1)
				set_state( boss_ok )
				local limit = pc.getqf("retry_limit_time")
				
				if limit > ( get_global_time() + 3600 ) then
					limit = ( get_global_time() + 3600 )
				end
				pc.setqf("retry_limit_time", limit )
				
				local duration = limit - get_global_time()
			end
		end

		when 30130.chat." Yuvaya giri� " begin
			if game.get_event_flag("spider_lair_ongoing_"..get_channel_id()) == 1 then
				local starttime = game.get_event_flag("spider_lair_start_time_"..get_channel_id())
				local current_time = get_global_time()
				
				if party.get_leader_pid() == game.get_event_flag("spider_lair_leader_"..get_channel_id()) then
					if  starttime +  300 >= current_time  and party.get_leader_pid() == game.get_event_flag("spider_lair_leader_"..get_channel_id()) and game.get_event_flag("spider_lair_ongoing_"..get_channel_id()) == 1 then
						say("Grup liderin yuvaya girdi. Sen de i�eriye[ENTER]girip Barones ile sava�mak istiyor musun? ")
						local warp =  select(locale.confirm,locale.cancel)
						if warp == 1 then
							pc.warp(88100,614800)
							return
						end
					end
				end
			end
		end
 
		when 2092.kill begin
			server_timer("spider_dead_timer", 180)
			game.set_event_flag("spider_dead"..get_channel_id(), 1)
			game.set_event_flag("spider_key_dropped"..get_channel_id(), 0)
			notice_multiline("�r�mcek Barones yok edildi! T�m sava���lar ��[ENTER]dakika i�inde yuvadan d��ar� ���nlanacak",notice_in_map)
			notice_all(string.format("%s Grubu �r�mcek Baronesi �ld�rd�!", pc.get_name()))
		end

		when 2094.kill begin
			if game.get_event_flag("spider_key_dropped"..get_channel_id()) == 0 then
				game.drop_item(30327, 1)
				game.set_event_flag("spider_key_dropped"..get_channel_id(), 1)
			end
		end

		when 2095.kill begin
			local kingVid = game.get_event_flag("king_vid"..get_channel_id())
			local remain_egg = game.get_event_flag("remain_egg"..get_channel_id())
			notice_multiline("Dikkat: �r�mcek Barones sinirleniyor! Sald�r�s� g��leniyor ama savunmas� azal�yor.",notice_in_map)
			
			if remain_egg > 0 then
				remain_egg = remain_egg - 1
				game.set_event_flag("remain_egg"..get_channel_id(), remain_egg)
			end
			
			 npc.set_vid_attack_mul(kingVid, 10/(remain_egg + 1))
			 
			 npc.set_vid_damage_mul(kingVid, 10/(remain_egg + 1))
			 
			 pc.aggregate_monster()
		end
		
		when 30327.use with pc.getx() >= 827 and pc.get_map_index() == 217 and pc.getx() <= 937 and pc.gety() >= 6127 and  pc.gety() <= 6257 begin
			pc.remove_item(30327, 1)
			i = mob.spawn(2095,400,566,0,0)
			mob.spawn(2095,400,594,0,0)
			mob.spawn(2095,362,600,0,0)
			mob.spawn(2095,337,599,0,0)
			mob.spawn(2095,335,581,0,0)
			mob.spawn(2095,344,562,0,0)
			mob.spawn(2095,364,588,0,0)
			mob.spawn(2095,379,562,0,0)
			mob.spawn(2095,368,525,0,0)
			
			local kingVid = mob.spawn(2092,367,588,0,0)
			game.set_event_flag("king_vid"..get_channel_id(),kingVid)
			game.set_event_flag("remain_egg"..get_channel_id(), 9)
		end
		
	end
end
