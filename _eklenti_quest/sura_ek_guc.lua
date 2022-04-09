quest sura_ek_guc begin
	state start begin

		function check_pc()
			if pc.is_busy() == true then 
				return false 
			end
			return true
		end


		when login with pc.getqf("sura_ek_guc") == 0 and pc.get_skill_group() == 1 and pc.get_job() == 2 and game.get_event_flag("sura_guc_durum") == 1 begin
			if pc.count_item(42211) > 0 then
				syschat("Uyarý : Dengeleme Gücü Kapalý.")
			end
		end

		when 42211.use with pc.getqf("sura_ek_guc") == 0 begin
			if game.get_event_flag("sura_guc_durum") == 1 then
				if pc.get_job() == 2 then
					if get_time() > pc.getqf("sura_guc_sure") then
						
						if pc.get_weapon() == 0 then
							syschat("Eline bir silah takmalýsýn.!")
							return
						end
						
						if pc.get_skill_group() == 2 then
							syschat("Sistemi kullanabilmek için Büyülü Silah eðitimini almýþ olmalýsýnýz...")
							return
						elseif pc.get_skill_group() == 0 then
							syschat("Sistemi kullanabilmek için Büyülü Silah eðitimini almýþ olmalýsýnýz...")
							return
						end
						
						cleartimer("silah_kontrol")
						
						pc.setqf("sura_ek_guc", 1)
						
						timer("silah_kontrol", 1)
						
						if pc.get_skill_level(63) == 40 then
							if pc.get_weapon() == 6219 then
								verilecek_guc = 400
							elseif pc.get_weapon() == 319 then
								verilecek_guc = 360
							elseif pc.get_weapon() == 41939 then
								verilecek_guc = 320
							elseif pc.get_weapon() == 189 then
								verilecek_guc = 200
							else
								verilecek_guc = 250
							end
						else
							if pc.get_weapon() == 319 or pc.get_weapon() == 6219 then
								verilecek_guc = 400
							else
								verilecek_guc = 300
							end
						end
						
						pc.setqf("sura_verilen_guc", verilecek_guc)
						affect.add_collect(apply.ATT_GRADE_BONUS,verilecek_guc,60*60*24*365*60)
						affect.add_collect_point(POINT_ATTBONUS_HUMAN,-200,60*60*24*365*60)
						
						-- syschat("Sura Eklenen Güç : "..verilecek_guc.."")
						syschat("Karakterine ek güç eklendi.")
						
						pc.setqf("sura_guc_sure", get_time()+10)
					else
						syschat("Bunu tekrar yapmak için "..pc.getqf("sura_guc_sure") - get_global_time().." saniye beklemelisin..")
					end
				else
					syschat("Bu özelligi kullanabilmen için doðru karaktere sahip deðilsin..")
				end
			else
				syschat("Sistem þuanda devredýþý...")
			end
		end
		
		when silah_kontrol.timer with pc.getqf("sura_ek_guc") == 1 begin
			if pc.get_weapon() == 0 then
				if get_time() > pc.getqf("sura_guc_sure") then
					syschat("Sura Kaldýrýlan Güç : "..pc.getqf("sura_verilen_guc").."")
					affect.remove_collect(apply.ATT_GRADE_BONUS,pc.getqf("sura_verilen_guc"),60*60*24*365*60)
					affect.add_collect_point(POINT_ATTBONUS_HUMAN,200,60*60*24*365*60)
					pc.setqf("sura_verilen_guc", 0)
					syschat("Karakterinden ek güçler kaldýrýldý.")
					pc.setqf("sura_guc_sure", get_time()+10)
					pc.setqf("sura_ek_guc", 0)
					cleartimer("silah_kontrol")
				else
					syschat("<Hasar Dengeleme> Sistemin Kapanmasýna : "..pc.getqf("sura_guc_sure") - get_global_time().."...")
				end
			end
		end
		
		when 42211.use with pc.getqf("sura_ek_guc") == 1 begin
			if game.get_event_flag("sura_guc_durum") == 1 then
				if get_time() > pc.getqf("sura_guc_sure") then
					-- syschat("Sura Kaldýrýlan Güç : "..pc.getqf("sura_verilen_guc").."")
					affect.remove_collect(apply.ATT_GRADE_BONUS,pc.getqf("sura_verilen_guc"),60*60*24*365*60)
					affect.add_collect_point(POINT_ATTBONUS_HUMAN,200,60*60*24*365*60)
					pc.setqf("sura_verilen_guc", 0)
					syschat("Karakterinden ek güçler kaldýrýldý.")
					pc.setqf("sura_guc_sure", get_time()+10)
					pc.setqf("sura_ek_guc", 0)
				else
					syschat("Bunu tekrar yapmak için "..pc.getqf("sura_guc_sure") - get_global_time().." saniye beklemelisin..")
				end
			else
				syschat("Sistem þuanda devredýþý...")
			end
		end

		when logout with pc.getqf("sura_ek_guc") == 1 begin
			affect.remove_collect(apply.ATT_GRADE_BONUS,pc.getqf("sura_verilen_guc"),60*60*24*365*60)
			affect.add_collect_point(POINT_ATTBONUS_HUMAN,200,60*60*24*365*60)
			pc.setqf("sura_verilen_guc", 0)
			pc.setqf("sura_ek_guc", 0)
		end

	end
end