quest IcGuduBec begin
	state start begin
		when login begin
			cmdchat("ic_gudu_bec "..q.getcurrentquestindex())
		end
		when info or button begin
		local pc_job = pc.get_job () 
		if pc_job ~= 4 then 
		--say_title ("Yanl�� E�itim ") 
		--say ("") 
		--say ("�z�r Dilerim.") 
		--say ("Sadece Sava���lar Zihinsel Sava�� ") 
		--say ("se�ebilir.") 
		--say ("") 
		if pc_job == 0 then 
		--say_reward ("Bir Sava��� , Zihinsel Sava�� ") 
		--say_reward ("veya Bedensel Sava�� ") 
		--say_reward ("se�ebilir.") 
		elseif pc_job == 1 then 
		--say_reward ("Bir Ninja, Yak�n D�v�� veya") 
		--say_reward ("Uzak D�v�� e�itimini") 
		--say_reward ("se�ebilir.") 
		elseif pc_job == 2 then 
		--say_reward ("Bir Sura, B�y�l� Silah") 
		--say_reward ("veya Kara B�y� e�itimini") 
		--say_reward ("se�ebilir.") 
		elseif pc_job == 3 then 
		--say_reward ("Bir saman ,Ejderha G�c� e�itimini") 
		--say_reward ("veya iyilestirme e�itimini") 
		--say_reward ("se�ebilir.") 
		end 
		--say ("") 
		return 
		end 
		--say_title ("Zihinsel Sava� e�itimi") 
		--say ("") 
		--say ("Zihinsel sava� e�itimi sana d��manlar�na nas�l") 
		--say ("g��l� chi-sald�r�lar� yapabilece�ini ve kendini") 
		--say ("d��man sald�r�lar�ndan koruyabilece�ini ��retir.") 
		--say_reward ("Gereksinim: Seviye 5 ve �st� bir sava��� olmak") 
		--say ("") 
		--local s = select ("Ba�la" , "Daha sonra") 
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
		char_log (0 , "CLEAR_SKILL" , "�gretmen silindikten sonraki dogal yetenek") 
		--say_title ("Zihinsel sava� e�itimini se�tin.") 
		--say ("Ho�geldin!") 
		if not pc.is_clear_skill_group () then 
		--say ("Ders almay� se�ti�in i�in 4 yetenek puan� ") 
		--say ("kazand�n. Bu puanlar� diledi�in herhangi bir") 
		--say ("yetene�ini geli�tirmek i�in kullabilirsin.") 
		--say_title ("Bilgi:") 
		--say_reward ("4 yetenek puan� kazand�n.") 
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
		--say_reward ("Yeni bir ders se�tiginde,") 
		--say_reward ("daha fazla tecr�be puani almayacaksin.") 
		--say ("") 
		end 
		clear_letter ()
		end
	end
end