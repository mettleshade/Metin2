--------------------------------------------------------------
--SiberDizayn OneHeda Server Files
--OneHeda Quests
--www.siberdizayn.com.tr
--------------------------------------------------------------
quest meleylair begin
	state start begin
		when 20419.chat."Sung Mahi'nin Ejderhalar� m�? " with pc.get_map_index() == MeleyLair.GetSubMapIndex() begin
			say_title(mob_name(20419))
			say("")
			say("Korkar�m �o�u yar�n hayatta olmayacak. T�m ")
			say("iblislerin tanr�s� Sung Mahi tekrar uyand�.. ve ")
			say("onunla birlikte �� ejderhas� da. �nsanlar�n ruhlar�yla ")
			say("besleniyolar. Yeterince yedikten sonra Sung Mahi'nin ")
			say("g�c�ne g�� kat�yolar. Bu da.. son demek. Hepimiz i�in. ")
			say("Buna izin veremeyiz!. ")
			say("Ama cesur bir sava���dan �ok daha fazlas�na ihtiya� var. ")
			say("Sadece loncalar bu pullu hayvanla y�zle�ebilir. Yard�m edebilir misin? ")
			say("Senin kadar cesur macerac�lar tan�yor musun? ")
			wait()
			say_title(mob_name(20419))
			say("")
			say("Ama seni uyar�yorum: ")
			say("Ejderhalara kar�� ��kanlarla ilgili �rk�t�c� hikayeler ")
			say("anlat�l�yor. Asla geri d�nmediler... ")
		end
		
		when 20419.chat."Sung Mahi'nin Ejderhalar� ile sava�! " with pc.get_map_index() == MeleyLair.GetSubMapIndex() and pc.is_guild_master() begin
			say_title(mob_name(20419))
			say("")
			local registered, channel = MeleyLair.IsRegistered()
			if registered then
				say(string.format("Zaten loncan�z kay�tl�.[ENTER] CH %d.[ENTER]'den giri� yapabilirsiniz. ", channel))
				return
			end
					
			local requirment1, requirment2 = MeleyLair.GetRequirments()
			say("Sung Mahi'nin Ejderhalar� sava�mak i�in loncan�z kay�t ")
			say("olmal�d�r. ")
			say("")
			say("Kay�t olmak i�in �unlar gerekir: ")
			say(string.format("- Loncan�z en az %d seviyede olmal�d�r. ", requirment1))
			say(string.format("- Loncan�z en az %d lonca puan� olmal�d�r. ", requirment2))
			say("")
			say("Kay�t yapt�rmak istiyor musun? ")
			local menu = select("Evet ", "Hay�r ")
			if menu == 1 then
				local result1, result2 = MeleyLair.Register()
				if result1 == 0 then
					setskin(NOWINDOW)
					return
				end
				
				local resultMsg = {
								[1] = "Zaten loncan�z kay�tl�.[ENTER] CH %d.[ENTER]'den giri� yapabilirsiniz. ",
								[2] = "Ba�ka loncadas�n�z,[ENTER]daha sonra deneyiniz ",
								[3] = "Loncan�z en az %d seviye olmal�d�r. ",
								[4] = "Loncan�z en az %d lonca puan� olmal�d�r. ",
								[5] = "Lonca kay�tl� de�il, [ENTER]Yetkili ki�ilerle g�r���n. ",
								[6] = "Ejderhalar� yenerseniz,[ENTER]%d lonca puan� iade edilcektir. ",
								[7] = "Sadece bulundu�unuz loncay� kay�t edebilirsiniz. %s. ",
				}
				
				say_title(mob_name(20419))
				say("")
				if result1 != 2 and result1 != 5 then
					if result1 == 7 then
						local hours = string.format("%02.f", math.floor(result2 / 3600));
						local minutes = string.format("%02.f", math.floor(result2 / 60 - (hours * 60)));
						local seconds = string.format("%02.f", math.floor(result2 - hours * 3600 - minutes * 60));
						local timeConv = string.format(hours..":"..minutes..":"..seconds)
						say(string.format(resultMsg[result1], timeConv))
					else
						say(string.format(resultMsg[result1], result2))
					end
				else
					say(resultMsg[result1])
				end
			else
				setskin(NOWINDOW)
				return
			end
		end
		
		when 20419.chat."GM: ODAYI BUGDAN KURTAR " with pc.is_gm() begin
			local sec = select("Meley Bugdan Kurtar","Kapat")
			if sec == 1 then
				say_title(mob_name(20419))
				say_reward("Meley giri�leri tekrar a��ld�.")
				game.set_event_flag("meley_lair_dungeon_status",0)
				game.set_event_flag("meley_lair_dungeon_guild",0)
			end
		end
		
		when 20419.chat."�n'e Gir! " with pc.get_map_index() == MeleyLair.GetSubMapIndex() and pc.has_guild() begin
			say_title(mob_name(20419))
			say("")
			say("�n'e Girmek istiyor musun? ")
			say("")
			local agree = select("Evet ", "Hay�r ")
			
			if agree == 1 then
				local registered, limit = MeleyLair.Enter()
				if not registered and limit == 0 then
					say_title(mob_name(20419))
					say("")
					if pc.is_guild_master() then
						say("�n'e girebilmek i�in [ENTER]loncan�z� kay�t etmeniz gerekmektedir. ")
					else
						say("Lonca lideriniz in'e kay�t ettirmelidir.[ENTER]�n'e eri�emiyorsunuz. ")
					end
					
					return
				elseif pc.get_level() < 75 then
					say_title(mob_name(20419))
					say("")
					say(string.format("Giri� yapabilmek i�in seviyeniz %s olmal�d�r.", 75))
					return
				elseif not registered and limit > 0 then
					say_title(mob_name(20419))
					say("")
					say(string.format("�n'e Bu CH %d.'den eri�ebilirsiniz. ", limit))
					return
				elseif limit == 1 then
					say_title(mob_name(20419))
					say("")
					say(string.format("�uanda odada %d lonca �yesi mevcut.[ENTER]�n'e eri�emiyorsun. ", MeleyLair.GetPartecipantsLimit()))
					return
				elseif limit == 2 then
					say_title(mob_name(20419))
					say("")
					say("Bir Hata Olu�tu. L�tfen Yetkili Ki�ilere Ula��n. ")
					return
				elseif limit == 3 then
					say_title(mob_name(20419))
					say("")
					say("Zindan Zaten Bitti. ")
					return
				elseif limit == 4 then
					say_title(mob_name(20419))
					say("")
					say("Sava�a kat�lmak i�in; ")
					say("oyun se�eneklerinden lonca se�ene�ine al�n. ")
					return
				elseif limit == 5 then
					say_title(mob_name(20419))
					say("")
					say("Senden �nce bir lonca giri� yapt�; ")
					say("Odada �uanda bir ekip bulunuyor.")
					return
				end
				

				
				
				return
			else
				setskin(NOWINDOW)
				return
			end
		end
    end
end