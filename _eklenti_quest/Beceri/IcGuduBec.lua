quest IcGuduBec begin
	state start begin
		when login begin
			cmdchat("ic_gudu_bec "..q.getcurrentquestindex())
		end
		when info or button begin
		local pc_job = pc.get_job () 
		if pc_job ~= 4 then 
		--say_title ("Yanlýþ Eðitim ") 
		--say ("") 
		--say ("Özür Dilerim.") 
		--say ("Sadece Savaþçýlar Zihinsel Savaþý ") 
		--say ("seçebilir.") 
		--say ("") 
		if pc_job == 0 then 
		--say_reward ("Bir Savaþçý , Zihinsel Savaþý ") 
		--say_reward ("veya Bedensel Savaþý ") 
		--say_reward ("seçebilir.") 
		elseif pc_job == 1 then 
		--say_reward ("Bir Ninja, Yakýn Dövüþ veya") 
		--say_reward ("Uzak Dövüþ eðitimini") 
		--say_reward ("seçebilir.") 
		elseif pc_job == 2 then 
		--say_reward ("Bir Sura, Büyülü Silah") 
		--say_reward ("veya Kara Büyü eðitimini") 
		--say_reward ("seçebilir.") 
		elseif pc_job == 3 then 
		--say_reward ("Bir saman ,Ejderha Gücü eðitimini") 
		--say_reward ("veya iyilestirme eðitimini") 
		--say_reward ("seçebilir.") 
		end 
		--say ("") 
		return 
		end 
		--say_title ("Zihinsel Savaþ eðitimi") 
		--say ("") 
		--say ("Zihinsel savaþ eðitimi sana düþmanlarýna nasýl") 
		--say ("güçlü chi-saldýrýlarý yapabileceðini ve kendini") 
		--say ("düþman saldýrýlarýndan koruyabileceðini öðretir.") 
		--say_reward ("Gereksinim: Seviye 5 ve üstü bir savaþçý olmak") 
		--say ("") 
		--local s = select ("Baþla" , "Daha sonra") 
		if 2 == s then 
		return 
		end 
		if pc.get_job () ~= 4 or pc.get_skill_group () ~= 0 then 
			test_chat ("npc_is_same_job:"..bool_to_str (npc_is_same_job ())) 
			test_chat ("pc.get_skill_group:"..pc.get_skill_group ()) 
			test_chat ("pc_job:"..pc.get_job ()) 
		return 
		end 
		set_state ("start") 
		pc.set_skill_group (1) 
		pc.clear_skill () 
		char_log (0 , "CLEAR_SKILL" , "Ögretmen silindikten sonraki dogal yetenek") 
		--say_title ("Zihinsel savaþ eðitimini seçtin.") 
		--say ("Hoþgeldin!") 
		if not pc.is_clear_skill_group () then 
		--say ("Ders almayý seçtiðin için 4 yetenek puaný ") 
		--say ("kazandýn. Bu puanlarý dilediðin herhangi bir") 
		--say ("yeteneðini geliþtirmek için kullabilirsin.") 
		--say_title ("Bilgi:") 
		--say_reward ("4 yetenek puaný kazandýn.") 
		--say ("") 
		pc.set_skill_level (170,30)
		pc.set_skill_level (171,30)
		pc.set_skill_level (172,30)
		pc.set_skill_level (173,30)
		pc.set_skill_level (174,30)
		pc.set_skill_level (175,30)
		
		pc.set_skill_level(122,1)
		pc.set_skill_level(123,20)
		pc.set_skill_level(124,20)
		pc.set_skill_level(126,20)
		pc.set_skill_level(127,20)
		pc.set_skill_level(128,20)
		pc.set_skill_level(130,21)
		pc.set_skill_level(131,20)
		pc.set_skill_level(137,20)
		pc.set_skill_level(138,20)
		pc.set_skill_level(139,20)
		horse.unride () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance ()
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance () 
		horse.advance ()  
		else 
		--say_reward ("Yeni bir ders seçtiginde,") 
		--say_reward ("daha fazla tecrübe puani almayacaksin.") 
		--say ("") 
		end 
		clear_letter ()
		end
	end
end