quest ortalama_bec begin
	state start begin
		when 9270.click begin
			syschat("Ortalamalý silahýnýzý üzerime býrakýn..")
			return
		end
		
		when 9270.take begin
			
			if game.get_event_flag("ortalama_beceri_sistemi") == 0 then
				syschat("Sistem þuanda devredýþý...")
				return
			end
			
			if pc.is_busy() == true then
				syschat("Meþgul durumda olduðun için bu iþlemi gerçekleþtiremezsin.")
				return
			end
			if pc.is_dead() == true then
				syschat("Ölü durumda olduðun için bu iþlemi gerçekleþtiremezsin.")
				return
			end
			if item.get_addon_type() > -1 or item.get_addon_type() < -1 then
				syschat("Bu item ortalama veya beceri hasarý alamaz!")
				return
			end
			
			-- if get_time() < pc.getqf("ort_bec_yapma") then
				-- syschat("Bu iþlemi 3 dakikada bir yapabilirsin. Kalan süre : "..pc.getqf("ort_bec_yapma") - get_global_time().." saniye..")
				-- return
			-- end
			
			-- local pos = item.get_cell()
			-- local itemin_idsi = item.vnum
			
			
			-- local karakter_id = mysql.query("SELECT id, account_id FROM player.player WHERE name = '"..pc.get_name().."'")
			-- local id = karakter_id[1].id
			-- local hesap_id = karakter_id[1].account_id
			-- local silah_konumu = mysql.query("SELECT * FROM player.item WHERE owner_id = '"..id.."' and pos = '"..pos.."' and vnum = '"..itemin_idsi.."'")
			-------
			-- if silah_konumu[1].socket0 == nil then
				-- say_title("Ortalama & Beceri Ustasý ")
				-- say_reward("Bir sorun oluþtu, karakter attýktan sonra tekrar dene...")
				-- return
			-- end
			---
			-- local tas_1 = silah_konumu[1].socket0
			-- local tas_2 = silah_konumu[1].socket1
			-- local tas_3 = silah_konumu[1].socket2
			-- -
			-- local evrim = silah_konumu[1].applyvalue0
			-- -
			-- local efsun_1 = silah_konumu[1].attrtype0
			-- local deger_1 = silah_konumu[1].attrvalue0
			
			-- -
			-- local efsun_2 = silah_konumu[1].attrtype1
			-- local deger_2 = silah_konumu[1].attrvalue1
			
			-- -
			-- local efsun_3 = silah_konumu[1].attrtype2
			-- local deger_3 = silah_konumu[1].attrvalue2
			
			-- -
			-- local efsun_4 = silah_konumu[1].attrtype3
			-- local deger_4 = silah_konumu[1].attrvalue3
			
			-- -
			-- local efsun_5 = silah_konumu[1].attrtype4
			-- local deger_5 = silah_konumu[1].attrvalue4
			
			-- -
			-- local efsun_6 = silah_konumu[1].attrtype5
			-- local deger_6 = silah_konumu[1].attrvalue5
			-- -
			-- local efsun_7 = silah_konumu[1].attrtype6
			-- local deger_7 = silah_konumu[1].attrvalue6
			--
			
			-- if efsun_1 == "0" or efsun_2 ==  "0" or efsun_3 ==  "0" or efsun_4 ==  "0" or efsun_5 == "0" then
				-- syschat("Ýtemde en az 5 efsun deðeri bulunmalýdýr !")
				-- return
			-- end
			--------------------------------------------------------
			--
			say_title("Ortalama & Beceri Ustasý ")
			say("")
			say_green("Uyarý : Ýteminizi yeni efsunladýysanýz bir kaç dakika")
			say_green("bekleyin veya karakter atýn.")
			say("")
			say_reward(""..item.name.." itemine ne yapmak istiyorsun ?")
			say("")
			-- pc.setqf("ort_bec_yapma", get_time() + 60*15)
			local secenek = select("50-60 Ortalama (250M) ","Ortalama Hasarý ", "Beceri Hasarý ", "Ýptal Et ")
			if secenek == 1 then
				if pc.get_gold() > 249999999 then
					pc.change_gold(-250000000)
					item.set_value(0, 72, math.random(50, 60))
					item.set_value(1, 71, -20)
				else
					say("Bu iþlemi yapmam için 250M'ye ihtiyacýn var gerekli.")
				end
			elseif secenek == 2 then
				local ortalama_secenek = select("Orta Ortalama Hasarý ", "Yüksek Ortalama Hasarý ", "Ýptal ")
				
				if ortalama_secenek == 1 then
					if pc.count_item(42212) > 0 then
						-- local son_eklenen_item = mysql.query("SELECT pos FROM player.item WHERE owner_id = '"..hesap_id.."' and window = 'MALL' ORDER BY id DESC LIMIT 1")
						-- local depodaki_itemler = mysql.query("SELECT pos FROM player.item WHERE owner_id = '"..hesap_id.."' and window = 'SAFEBOX'")
						-- if(table.getn(son_eklenen_item) == 0) then
							-- depo_pos = 0
						-- else
							-- depo_pos = (son_eklenen_item[1].pos)+1
						-- end
						
						
						pc.remove_item(42212, 1)
						item.set_value(0, 72, math.random(65, 80))
						item.set_value(1, 71, -20)
						-- item.remove()
						
						-- local yeni_item = mysql.query("INSERT INTO player.item (owner_id,window,count,pos,vnum,socket0,socket1,socket2,attrtype0,attrvalue0,attrtype1,attrvalue1,attrtype2,attrvalue2,attrtype3,attrvalue3,attrtype4,attrvalue4,attrtype5,attrvalue5,attrtype6,attrvalue6,applyvalue0) VALUES ('"..hesap_id.."','MALL','1','"..depo_pos.."','"..itemin_idsi.."','"..tas_1.."','"..tas_2.."','"..tas_3.."','"..efsun_1.."','"..math.random(65, 80).."','"..efsun_2.."','-20','"..efsun_3.."','"..deger_3.."','"..efsun_4.."','"..deger_4.."','"..efsun_5.."','"..deger_5.."','"..efsun_6.."','"..deger_6.."','"..efsun_7.."','"..deger_7.."','"..evrim.."')")
						
						-- syschat("Yeni efsunlu itemini nesne market depona gönderdim.")
					else
						say("Bu iþlemi yapmam için "..item_name(42212).." gerekli.")
						say_item(item_name(42212),42212, "")
					end
				elseif ortalama_secenek == 2 then
					if pc.count_item(42213) > 0 then
						-- local mall_check = mysql.query("SELECT pos FROM player.item WHERE owner_id = '"..hesap_id.."' and window = 'MALL' ORDER BY id DESC LIMIT 1")
						-- if(table.getn(mall_check) == 0) then
							-- depo_pos = 0
						-- else
							-- depo_pos = (mall_check[1].pos)+1
						-- end
						
						pc.remove_item(42213, 1)
						item.set_value(0, 72, math.random(85, 100))
						item.set_value(1, 71, -20)
						-- item.remove()
						
						-- local yeni_item = mysql.query("INSERT INTO player.item (owner_id,window,count,pos,vnum,socket0,socket1,socket2,attrtype0,attrvalue0,attrtype1,attrvalue1,attrtype2,attrvalue2,attrtype3,attrvalue3,attrtype4,attrvalue4,attrtype5,attrvalue5,attrtype6,attrvalue6,applyvalue0) VALUES ('"..hesap_id.."','MALL','1','"..depo_pos.."','"..itemin_idsi.."','"..tas_1.."','"..tas_2.."','"..tas_3.."','"..efsun_1.."','"..math.random(85, 100).."','"..efsun_2.."','-20','"..efsun_3.."','"..deger_3.."','"..efsun_4.."','"..deger_4.."','"..efsun_5.."','"..deger_5.."','"..efsun_6.."','"..deger_6.."','"..efsun_7.."','"..deger_7.."','"..evrim.."')")
						
						-- syschat("Yeni efsunlu itemini nesne market depona gönderdim.")
					else
						say("Bu iþlemi yapmam için "..item_name(42213).." gerekli.")
						say_item(item_name(42213),42213, "")
					end
				else
					syschat("Ýþlemin iptal edilmiþtir.")
					return
				end
			elseif secenek == 3 then
				local beceri_secenek = select("Orta Beceri Hasarý ", "Yüksek Beceri Hasarý ", "Ýptal ")
				if beceri_secenek == 1 then
					if pc.count_item(42214) > 0 then
						-- local mall_check = mysql.query("SELECT pos FROM player.item WHERE owner_id = '"..hesap_id.."' and window = 'MALL' ORDER BY id DESC LIMIT 1")
						-- if(table.getn(mall_check) == 0) then
							-- depo_pos = 0
						-- else
							-- depo_pos = (mall_check[1].pos)+1
						-- end
						
						pc.remove_item(42214, 1)
						item.set_value(0, 72, -20)
						item.set_value(1, 71, math.random(15, 25))
						-- item.remove()
						
						-- local yeni_item = mysql.query("INSERT INTO player.item (owner_id,window,count,pos,vnum,socket0,socket1,socket2,attrtype0,attrvalue0,attrtype1,attrvalue1,attrtype2,attrvalue2,attrtype3,attrvalue3,attrtype4,attrvalue4,attrtype5,attrvalue5,attrtype6,attrvalue6,applyvalue0) VALUES ('"..hesap_id.."','MALL','1','"..depo_pos.."','"..itemin_idsi.."','"..tas_1.."','"..tas_2.."','"..tas_3.."','"..efsun_1.."','-20','"..efsun_2.."','"..math.random(15, 25).."','"..efsun_3.."','"..deger_3.."','"..efsun_4.."','"..deger_4.."','"..efsun_5.."','"..deger_5.."','"..efsun_6.."','"..deger_6.."','"..efsun_7.."','"..deger_7.."','"..evrim.."')")
						
						-- syschat("Yeni efsunlu itemini nesne market depona gönderdim.")
					else
						say("Bu iþlemi yapmam için "..item_name(42214).." gerekli.")
						say_item(item_name(42214),42214, "")
					end
				elseif beceri_secenek == 2 then
					if pc.count_item(42215) > 0 then
						-- local mall_check = mysql.query("SELECT pos FROM player.item WHERE owner_id = '"..hesap_id.."' and window = 'MALL' ORDER BY id DESC LIMIT 1")
						-- if(table.getn(mall_check) == 0) then
							-- depo_pos = 0
						-- else
							-- depo_pos = (mall_check[1].pos)+1
						-- end
						
						pc.remove_item(42215, 1)
						item.set_value(1, 71, math.random(25, 35))
						item.set_value(0, 72, -20)
						-- item.remove()
						
						-- local yeni_item = mysql.query("INSERT INTO player.item (owner_id,window,count,pos,vnum,socket0,socket1,socket2,attrtype0,attrvalue0,attrtype1,attrvalue1,attrtype2,attrvalue2,attrtype3,attrvalue3,attrtype4,attrvalue4,attrtype5,attrvalue5,attrtype6,attrvalue6,applyvalue0) VALUES ('"..hesap_id.."','MALL','1','"..depo_pos.."','"..itemin_idsi.."','"..tas_1.."','"..tas_2.."','"..tas_3.."','"..efsun_1.."','-20','"..efsun_2.."','"..math.random(25, 35).."','"..efsun_3.."','"..deger_3.."','"..efsun_4.."','"..deger_4.."','"..efsun_5.."','"..deger_5.."','"..efsun_6.."','"..deger_6.."','"..efsun_7.."','"..deger_7.."','"..evrim.."')")
						
						-- syschat("Yeni efsunlu itemini nesne market depona gönderdim.")
					else
						say("Bu iþlemi yapmam için "..item_name(42215).." gerekli.")
						say_item(item_name(42215),42215, "")
					end
				else
					syschat("Ýþlemin iptal edilmiþtir.")
					return
				end
			else
				return
			end
		end
	end
end