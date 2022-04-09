quest perfect_ek_guc begin
	state start begin
		function check_pc()
			if pc.is_busy() == true then 
				return false 
			end
			return true
		end
		
		when login with game.get_event_flag("perfect_guc_durum") == 1 and pc.getqf("perfect_ek_guc") == 0  begin
			--PERFECT
			if pc.count_item(42206) > 0 then
				if pc.get_job() == 1 or pc.get_job() == 2 or pc.get_job() == 3 then
					syschat("Uyarý : Dengeleme Gücü Kapalý.")
					return
				end
			end
		end
		
		--------------------------------------------------------------------------------------------
		
		---PERFECT
		when 42206.use with pc.getqf("perfect_ek_guc") == 0 begin
			if game.get_event_flag("perfect_guc_durum") == 1 then
				if pc.get_job() == 1 or pc.get_job() == 3 then
					if get_time() > pc.getqf("perfect_guc_sure") then
						
						if pc.get_weapon() == 0 then
							syschat("Eline bir silah takmalýsýn.!")
							return
						end
						
						-- timer("kontrol",1)
						
						pc.setqf("perfect_ek_guc", 1)
						local guc = math.floor(pc.get_st() * 1.1)
						local level = pc.get_level()
						local level2 = math.floor(pc.get_level() * 3.8)
						local silah_guc = 0
						
						-- ÞAMAN SÝLAH AYARLARI
						if pc.get_job() == 3 then
							if pc.get_weapon() == 41979 then
								silah_guc = 50
							elseif pc.get_weapon() == 6259 then
								silah_guc = 60
							elseif pc.get_weapon() == 5169 then
								silah_guc = 60
							elseif pc.get_weapon() == 559 then
								silah_guc = 20
							end
						end
						
						-- NÝNJA SÝLAH AYARLARI
						if pc.get_job() == 1 then
							if pc.get_weapon() == 189 then
								silah_guc = -100
							elseif pc.get_weapon() == 319 then
								silah_guc = 60
							elseif pc.get_weapon() == 6219 then
								silah_guc = 130
							elseif pc.get_weapon() == 41939 then
								silah_guc = 20
							end
						end
						
						local verilecek_guc = 121 + guc + level2 + level + silah_guc
						
						pc.setqf("perfect_verilen_guc", verilecek_guc)
						affect.add_collect(apply.ATT_GRADE_BONUS,verilecek_guc,60*60*24*365*60)
						affect.add_collect_point(POINT_ATTBONUS_HUMAN,-200,60*60*24*365*60)
						
						-- syschat("Perfect Eklenen Güç : "..verilecek_guc.."")
						syschat("Karakterine ek güç eklendi.")
						pc.setqf("perfect_guc_sure", get_time()+10)
						
					else
						syschat("Bunu tekrar yapmak için "..pc.getqf("perfect_guc_sure") - get_global_time().." saniye beklemelisin..")
					end
				else
					syschat("Bu özelligi kullanabilmen için doðru karaktere sahip deðilsin..")
				end
			else
				syschat("Sistem þuanda devredýþý...")
			end
		end

		when 42206.use with pc.getqf("perfect_ek_guc") == 1 begin
			if game.get_event_flag("perfect_guc_durum") == 1 then
				if get_time() > pc.getqf("perfect_guc_sure") then
					-- syschat("Perfect Kaldýrýlan Güç : "..pc.getqf("perfect_verilen_guc").."")
					affect.remove_collect(apply.ATT_GRADE_BONUS,pc.getqf("perfect_verilen_guc"),60*60*24*365*60)
					affect.add_collect_point(POINT_ATTBONUS_HUMAN,200,60*60*24*365*60)
					pc.setqf("perfect_verilen_guc", 0)
					syschat("Karakterinden ek güçler kaldýrýldý.")
					pc.setqf("perfect_guc_sure", get_time()+10)
					pc.setqf("perfect_ek_guc", 0)
				else
					syschat("Bunu tekrar yapmak için "..pc.getqf("perfect_guc_sure") - get_global_time().." saniye beklemelisin..")
				end
			else
				syschat("Sistem þuanda devredýþý...")
			end
		end

		when logout with pc.getqf("perfect_ek_guc") == 1 begin
			affect.remove_collect(apply.ATT_GRADE_BONUS,pc.getqf("perfect_verilen_guc"),60*60*24*365*60)
			affect.add_collect_point(POINT_ATTBONUS_HUMAN,200,60*60*24*365*60)
			pc.setqf("perfect_verilen_guc", 0)
			pc.setqf("perfect_ek_guc", 0)
		end

	end
end