quest grand_ek_guc begin
	state start begin
		function check_pc()
			if pc.is_busy() == true then 
				return false 
			end
			return true
		end
		
		when login with pc.getqf("grand_ek_guc") == 0 and game.get_event_flag("grand_guc_durum") == 1 begin
			if pc.count_item(42205) > 0 then
				if pc.get_job() == 1 or pc.get_job() == 3 then
					syschat("Uyarý : Dengeleme Gücü Kapalý.")
					return
				end
			end
		end
		
		when 42205.use with pc.getqf("grand_ek_guc") == 0 begin
			if game.get_event_flag("grand_guc_durum") == 1 then
				if pc.get_job() == 1 or pc.get_job() == 3 then
					if get_time() > pc.getqf("grand_guc_sure") then
						
						
						if pc.get_weapon() == 0 then
							syschat("Eline bir silah takmalýsýn.!")
							return
						end
						
						pc.setqf("grand_ek_guc", 1)
						
						
						local guc = math.floor(pc.get_st() * 0.82)
						local level = pc.get_level()
						local level2 = math.floor(pc.get_level() * 2.46)
						local silah_guc = 0
						
						-- ÞAMAN SÝLAH AYARLARI
						if pc.get_job() == 3 then
							if pc.get_weapon() == 41979 then
								silah_guc = 100
							elseif pc.get_weapon() == 6259 then
								silah_guc = 80
							elseif pc.get_weapon() == 5169 then
								silah_guc = 60
							elseif pc.get_weapon() == 5129 then
								silah_guc = 40
							elseif pc.get_weapon() == 559 then
								silah_guc = 20
							end
						end
						
						-- NÝNJA SÝLAH AYARLARI
						if pc.get_job() == 1 then
							if pc.get_weapon() == 189 then
								silah_guc = -100
							elseif pc.get_weapon() == 319 then
								silah_guc = 40
							elseif pc.get_weapon() == 6219 then
								silah_guc = 50
							elseif pc.get_weapon() == 41939 then
								silah_guc = 20
							end
						end
						
						local verilecek_guc = 0
						
						if pc.get_job() == 1 or pc.get_job() == 3 then
							verilecek_guc = 82 + guc + level2 + level + silah_guc
						elseif pc.get_job() == 2 then
							if pc.get_weapon() == 319 or pc.get_weapon() == 6219 then
								verilecek_guc = 400
							else
								verilecek_guc = 300
							end
								
						end

						
						pc.setqf("grand_verilen_guc", verilecek_guc)
						affect.add_collect(apply.ATT_GRADE_BONUS,verilecek_guc,60*60*24*365*60)
						affect.add_collect_point(POINT_ATTBONUS_HUMAN,-200,60*60*24*365*60)
						
						-- syschat("Eklenen Güç : "..verilecek_guc.."")
						syschat("Karakterine ek güç eklendi.")
						
						
						pc.setqf("grand_guc_sure", get_time()+10)
						
					else
						syschat("Bunu tekrar yapmak için "..pc.getqf("grand_guc_sure") - get_global_time().." saniye beklemelisin..")
					end
				else
					syschat("Bu özelligi kullanabilmen için doðru karaktere sahip deðilsin..")
				end
			else
				syschat("Sistem þuanda devredýþý...")
			end
		end

		when 42205.use with pc.getqf("grand_ek_guc") == 1 begin
			if game.get_event_flag("grand_guc_durum") == 1 then
				if get_time() > pc.getqf("grand_guc_sure") then
					-- syschat("Kaldýrýlan Güç : "..pc.getqf("grand_verilen_guc").."")
					affect.remove_collect(apply.ATT_GRADE_BONUS,pc.getqf("grand_verilen_guc"),60*60*24*365*60)
					affect.add_collect_point(POINT_ATTBONUS_HUMAN,200,60*60*24*365*60)
					pc.setqf("grand_verilen_guc", 0)
					syschat("Karakterinden ek güçler kaldýrýldý.")
					pc.setqf("grand_guc_sure", get_time()+10)
					pc.setqf("grand_ek_guc", 0)
				else
					syschat("Bunu tekrar yapmak için "..pc.getqf("grand_guc_sure") - get_global_time().." saniye beklemelisin..")
				end
			else
				syschat("Sistem þuanda devredýþý...")
			end
		end

		when logout with pc.getqf("grand_ek_guc") == 1 begin
			affect.remove_collect(apply.ATT_GRADE_BONUS,pc.getqf("grand_verilen_guc"),60*60*24*365*60)
			affect.add_collect_point(POINT_ATTBONUS_HUMAN,200,60*60*24*365*60)
			pc.setqf("grand_verilen_guc", 0)
			pc.setqf("grand_ek_guc", 0)
		end

	end
end