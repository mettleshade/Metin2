quest sandik_acma begin
	state start begin

		function settings()
			return
			{
				["acma_adeti"] = 200, -- KAÇ ADET SANDIK AÇTIRCAN
				["metinler"] = { 
					--METÝN SANDIÐI
					["70_level"] = 61110,
					["90_level"] = 61111,
					["beta"] = 61130,
					["orman"] = 61131,
					["col"] = 61133,
					--METÝN SANDIÐI
					["altin_gelisim"] = 61103,
					["platin_gelisim"] = 61104,
					["elmas_gelisim"] = 61200,
					["efsanevi_gelisim"] = 61202,
					--GELÝÞÝM
					["istiridye"] = 27987
				},
				["oduller"] =  {
					["70_level"] = {
						[1] = {30344, 1},
						[2] = {61103, 1},
						[3] = {50260, 2},
						[4] = {80006, 2},
						[5] = {50513, 1},
						[6] = {70102, 1},
						[7] = {50097, 1},
						[8] = {71504, 1}
					},
					["90_level"] = {
						[1] = {30342, 1},
						[2] = {61104, 1},
						[3] = {50260, 4},
						[4] = {80006, 4},
						[5] = {50513, 1},
						[6] = {70102, 1},
						[7] = {50097, 1},
						[8] = {71504, 1},
						[9] = {50927, 1}
					},
					["beta"] = {
						[1] = {30343, 1},
						[2] = {61200, 1},
						[3] = {50260, 8},
						[4] = {80007, 1},
						[5] = {50513, 1},
						[6] = {70102, 1},
						[7] = {50097, 1},
						[8] = {50926, 1},
						[9] = {50927, 1}
					},
					["orman"] = {
						[1] = {30343, 1},
						[2] = {61202, 1},
						[3] = {50260, 14},
						[4] = {80007, 2},
						[5] = {50513, 1},
						[6] = {70102, 1},
						[7] = {50097, 1},
						[8] = {50927, 1},
						[9] = {50926, 1},
						[10] = {51001, 1}
					},
					["col"] = {
						[1] = {30343, 1},
						[2] = {61202, 1},
						[3] = {50260, 14},
						[4] = {80007, 2},
						[5] = {50513, 1},
						[6] = {70102, 1},
						[7] = {50097, 1},
						[8] = {50927, 1},
						[9] = {50926, 1},
						[10] = {51001, 1}
					},
					["altin_gelisim"] = {
						[1] = {19979, 1},
						[2] = {31789, 1},
						[3] = {70102, 2},
						[4] = {85000, 2},
						[5] = {50260, 1},
						[6] = {27987, 1},
						[7] = {25041, 1},
						[8] = {50513, 1}
					},
					["platin_gelisim"] = {
						[1] = {19979, 1},
						[2] = {31789, 1},
						[3] = {70102, 2},
						[4] = {85000, 2},
						[5] = {50260, 1},
						[6] = {27987, 1},
						[7] = {25041, 1},
						[8] = {50513, 1},
						[9] = {801, 1},
						[10] = {100400, 1},
						[11] = {70005, 1}
					},
					["elmas_gelisim"] = {
						[1] = {19979, 1},
						[2] = {70102, 2},
						[3] = {85000, 2},
						[4] = {50260, 1},
						[5] = {27987, 1},
						[6] = {25041, 1},
						[7] = {50513, 1},
						[8] = {802, 1},
						[9] = {100500, 1},
						[10] = {70005, 1},
						[11] = {50926, 1}
					},
					["efsanevi_gelisim"] = {
						[1] = {19979, 1},
						[2] = {70102, 2},
						[3] = {85000, 2},
						[4] = {50260, 1},
						[5] = {27987, 1},
						[6] = {25041, 1},
						[7] = {50513, 1},
						[8] = {803, 1},
						[9] = {100500, 1},
						[10] = {50926, 1}
					},
					["istiridye"] = {
						[1] = {27993, 1},
						[2] = {27994, 1},
						[3] = {27992, 1},
						[4] = {71520, 1},
						[5] = {71522, 1},
						[6] = {71521, 1},
						[7] = {27990, 1}
					}
				},
			};
		end
		function check_pc()
			if pc.is_busy() == true then return false end
			return true
		end
		when login begin
			cmdchat("hizli_islem "..q.getcurrentquestindex())
		end
		when button or info begin
			if game.get_event_flag("hizli_sandik_sistemi") == 0 then
				say_reward("Þuan sistem kapalý daha sonra tekrar dene..")
				return
			end
			
			---say_reward("									Epsilon2 Hýzlý Sandýk Açma ")
			say("")
			if sandik_acma.check_pc() == false then
				syschat("Meþgul durumda olduðun için bu iþlemi gerçekleþtiremezsin.")
				return
			elseif pc.is_dead() == true then
				syschat("Ölü durumda olduðun için bu iþlemi gerçekleþtiremezsin.")
				return
			end
			local ayarlar = sandik_acma.settings()
			local sandik = select(
				""..ayarlar["acma_adeti"].." Adet "..item_name(ayarlar["metinler"]["70_level"]).." Aç ", 
				""..ayarlar["acma_adeti"].." Adet "..item_name(ayarlar["metinler"]["90_level"]).." Aç ", 
				""..ayarlar["acma_adeti"].." Adet "..item_name(ayarlar["metinler"]["beta"]).." Aç ", 
				""..ayarlar["acma_adeti"].." Adet "..item_name(ayarlar["metinler"]["orman"]).." Aç ", 
				""..ayarlar["acma_adeti"].." Adet "..item_name(ayarlar["metinler"]["col"]).." Aç ", 
				""..ayarlar["acma_adeti"].." Adet "..item_name(ayarlar["metinler"]["altin_gelisim"]).." Aç ", 
				""..ayarlar["acma_adeti"].." Adet "..item_name(ayarlar["metinler"]["platin_gelisim"]).." Aç ", 
				""..ayarlar["acma_adeti"].." Adet "..item_name(ayarlar["metinler"]["elmas_gelisim"]).." Aç ", 
				""..ayarlar["acma_adeti"].." Adet "..item_name(ayarlar["metinler"]["efsanevi_gelisim"]).." Aç ", 
				""..ayarlar["acma_adeti"].." Adet "..item_name(ayarlar["metinler"]["istiridye"]).." Aç ", 
				"Vazgeç ")
			if sandik == 1 then
				item_sayisi = pc.count_item(ayarlar["metinler"]["70_level"])
				if item_sayisi > (ayarlar["acma_adeti"]-1) then
					pc.remove_item(ayarlar["metinler"]["70_level"], ayarlar["acma_adeti"])
					pc.give_item2(ayarlar["oduller"]["70_level"][1][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["70_level"][1][2])
					pc.give_item2(ayarlar["oduller"]["70_level"][2][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["70_level"][2][2])
					pc.give_item2(ayarlar["oduller"]["70_level"][3][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["70_level"][3][2])
					pc.give_item2(ayarlar["oduller"]["70_level"][4][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["70_level"][4][2])
					--RANDOM
					pc.give_item2(ayarlar["oduller"]["70_level"][5][1],math.random(75, 85))
					pc.give_item2(ayarlar["oduller"]["70_level"][6][1],math.random(110, 125))
					pc.give_item2(ayarlar["oduller"]["70_level"][7][1],math.random(75, 85))
					pc.give_item2(ayarlar["oduller"]["70_level"][8][1],math.random(85, 95))

					
					chat("Hýzlý sandik açma baþarýlý: "..item_name(ayarlar["metinler"]["70_level"])..": "..ayarlar["acma_adeti"].." adet.")
				else
					chat("Yeterli "..item_name(ayarlar["metinler"]["70_level"]).." yok.")
				end
			elseif sandik == 2 then
				item_sayisi = pc.count_item(ayarlar["metinler"]["90_level"])
				if item_sayisi > (ayarlar["acma_adeti"]-1) then
					pc.remove_item(ayarlar["metinler"]["90_level"], ayarlar["acma_adeti"])
					pc.give_item2(ayarlar["oduller"]["90_level"][1][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["90_level"][1][2])
					pc.give_item2(ayarlar["oduller"]["90_level"][2][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["90_level"][2][2])
					pc.give_item2(ayarlar["oduller"]["90_level"][3][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["90_level"][3][2])
					pc.give_item2(ayarlar["oduller"]["90_level"][4][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["90_level"][4][2])
					--RANDOM
					pc.give_item2(ayarlar["oduller"]["90_level"][5][1],math.random(115, 125))
					pc.give_item2(ayarlar["oduller"]["90_level"][6][1],math.random(100, 120))
					pc.give_item2(ayarlar["oduller"]["90_level"][7][1],math.random(180, 200))
					pc.give_item2(ayarlar["oduller"]["90_level"][8][1],math.random(110, 125))
					pc.give_item2(ayarlar["oduller"]["90_level"][9][1],math.random(80, 90))

					chat("Hýzlý sandik açma baþarýlý: "..item_name(ayarlar["metinler"]["90_level"])..": "..ayarlar["acma_adeti"].." adet.")
				else
					chat("Yeterli "..item_name(ayarlar["metinler"]["90_level"]).." yok.")
				end
			elseif sandik == 3 then
				item_sayisi = pc.count_item(ayarlar["metinler"]["beta"])
				if item_sayisi > (ayarlar["acma_adeti"]-1) then
					pc.remove_item(ayarlar["metinler"]["beta"], ayarlar["acma_adeti"])
					pc.give_item2(ayarlar["oduller"]["beta"][1][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["beta"][1][2])
					pc.give_item2(ayarlar["oduller"]["beta"][2][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["beta"][2][2])
					pc.give_item2(ayarlar["oduller"]["beta"][3][1],1000)
					pc.give_item2(ayarlar["oduller"]["beta"][3][1],600)
					pc.give_item2(ayarlar["oduller"]["beta"][4][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["beta"][4][2])

					pc.give_item2(ayarlar["oduller"]["beta"][5][1],math.random(110, 125))
					pc.give_item2(ayarlar["oduller"]["beta"][6][1],math.random(115, 130))
					pc.give_item2(ayarlar["oduller"]["beta"][7][1],math.random(240, 280))
					pc.give_item2(ayarlar["oduller"]["beta"][8][1],math.random(75, 85))
					pc.give_item2(ayarlar["oduller"]["beta"][9][1],math.random(120, 130))

					chat("Hýzlý sandik açma baþarýlý: "..item_name(ayarlar["metinler"]["beta"])..": "..ayarlar["acma_adeti"].." adet.")
				else
					chat("Yeterli "..item_name(ayarlar["metinler"]["beta"]).." yok.")
				end
			elseif sandik == 4 then
				item_sayisi = pc.count_item(ayarlar["metinler"]["orman"])
				if item_sayisi > (ayarlar["acma_adeti"]-1) then
					pc.remove_item(ayarlar["metinler"]["orman"], ayarlar["acma_adeti"])
					pc.give_item2(ayarlar["oduller"]["orman"][1][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["orman"][1][2])
					pc.give_item2(ayarlar["oduller"]["orman"][2][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["orman"][2][2])
					pc.give_item2(ayarlar["oduller"]["orman"][3][1],1000)
					pc.give_item2(ayarlar["oduller"]["orman"][3][1],1000)
					pc.give_item2(ayarlar["oduller"]["orman"][3][1],800)
					pc.give_item2(ayarlar["oduller"]["orman"][4][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["orman"][4][2])
					
					pc.give_item2(ayarlar["oduller"]["orman"][5][1],math.random(130, 145))
					pc.give_item2(ayarlar["oduller"]["orman"][6][1],math.random(280, 290))
					pc.give_item2(ayarlar["oduller"]["orman"][7][1],math.random(200, 250))
					pc.give_item2(ayarlar["oduller"]["orman"][8][1],math.random(135, 145))
					pc.give_item2(ayarlar["oduller"]["orman"][9][1],math.random(125, 135))
					pc.give_item2(ayarlar["oduller"]["orman"][10][1],math.random(135, 140))

					chat("Hýzlý sandik açma baþarýlý: "..item_name(ayarlar["metinler"]["orman"])..": "..ayarlar["acma_adeti"].." adet.")
				else
					chat("Yeterli "..item_name(ayarlar["metinler"]["orman"]).." yok.")
				end
			elseif sandik == 5 then
				item_sayisi = pc.count_item(ayarlar["metinler"]["col"])
				if item_sayisi > (ayarlar["acma_adeti"]-1) then
					pc.remove_item(ayarlar["metinler"]["col"], ayarlar["acma_adeti"])
					pc.give_item2(ayarlar["oduller"]["col"][1][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["col"][1][2])
					pc.give_item2(ayarlar["oduller"]["col"][2][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["col"][2][2])
					pc.give_item2(ayarlar["oduller"]["col"][3][1],1000)										
					pc.give_item2(ayarlar["oduller"]["col"][3][1],1000)										
					pc.give_item2(ayarlar["oduller"]["col"][3][1],800)										
					pc.give_item2(ayarlar["oduller"]["col"][4][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["col"][4][2])
													  
					pc.give_item2(ayarlar["oduller"]["col"][5][1],math.random(130, 145))
					pc.give_item2(ayarlar["oduller"]["col"][6][1],math.random(280, 290))
					pc.give_item2(ayarlar["oduller"]["col"][7][1],math.random(200, 250))
					pc.give_item2(ayarlar["oduller"]["col"][8][1],math.random(135, 145))
					pc.give_item2(ayarlar["oduller"]["col"][9][1],math.random(125, 135))
					pc.give_item2(ayarlar["oduller"]["col"][10][1],math.random(135, 140))

					chat("Hýzlý sandik açma baþarýlý: "..item_name(ayarlar["metinler"]["col"])..": "..ayarlar["acma_adeti"].." adet.")
				else
					chat("Yeterli "..item_name(ayarlar["metinler"]["col"]).." yok.")
				end
			elseif sandik == 6 then
				item_sayisi = pc.count_item(ayarlar["metinler"]["altin_gelisim"])
				if item_sayisi > (ayarlar["acma_adeti"]-1) then
					pc.remove_item(ayarlar["metinler"]["altin_gelisim"], ayarlar["acma_adeti"])
					pc.give_item2(ayarlar["oduller"]["altin_gelisim"][1][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["altin_gelisim"][1][2])
					pc.give_item2(ayarlar["oduller"]["altin_gelisim"][2][1],math.random(125, 150))
					pc.give_item2(ayarlar["oduller"]["altin_gelisim"][3][1],math.random(60, 65))
					pc.give_item2(ayarlar["oduller"]["altin_gelisim"][4][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["altin_gelisim"][4][2])
													  
					pc.give_item2(ayarlar["oduller"]["altin_gelisim"][5][1],math.random(95, 115))
					pc.give_item2(ayarlar["oduller"]["altin_gelisim"][6][1],math.random(50, 65))
					pc.give_item2(ayarlar["oduller"]["altin_gelisim"][7][1],math.random(60, 65))
					pc.give_item2(ayarlar["oduller"]["altin_gelisim"][8][1],math.random(55, 65))

					chat("Hýzlý sandik açma baþarýlý: "..item_name(ayarlar["metinler"]["altin_gelisim"])..": "..ayarlar["acma_adeti"].." adet.")
				else
					chat("Yeterli "..item_name(ayarlar["metinler"]["altin_gelisim"]).." yok.")
				end
			elseif sandik == 7 then
				item_sayisi = pc.count_item(ayarlar["metinler"]["platin_gelisim"])
				if item_sayisi > (ayarlar["acma_adeti"]-1) then
					pc.remove_item(ayarlar["metinler"]["platin_gelisim"], ayarlar["acma_adeti"])
					pc.give_item2(ayarlar["oduller"]["platin_gelisim"][1][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["platin_gelisim"][1][2])
					pc.give_item2(ayarlar["oduller"]["platin_gelisim"][2][1],math.random(90, 100))
					pc.give_item2(ayarlar["oduller"]["platin_gelisim"][3][1],math.random(150, 165))
					pc.give_item2(ayarlar["oduller"]["platin_gelisim"][4][1],math.random(200, 220))
					pc.give_item2(ayarlar["oduller"]["platin_gelisim"][5][1],math.random(190, 205))
					pc.give_item2(ayarlar["oduller"]["platin_gelisim"][6][1],math.random(75, 85))
					pc.give_item2(ayarlar["oduller"]["platin_gelisim"][7][1],math.random(125, 135))
					pc.give_item2(ayarlar["oduller"]["platin_gelisim"][8][1],math.random(95, 105))
					pc.give_item2(ayarlar["oduller"]["platin_gelisim"][9][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["platin_gelisim"][9][2])
					pc.give_item2(ayarlar["oduller"]["platin_gelisim"][10][1],math.random(90, 100))
					pc.give_item2(ayarlar["oduller"]["platin_gelisim"][11][1],math.random(1, 3))

					chat("Hýzlý sandik açma baþarýlý: "..item_name(ayarlar["metinler"]["platin_gelisim"])..": "..ayarlar["acma_adeti"].." adet.")
				else
					chat("Yeterli "..item_name(ayarlar["metinler"]["platin_gelisim"]).." yok.")
				end
			elseif sandik == 8 then
				item_sayisi = pc.count_item(ayarlar["metinler"]["elmas_gelisim"])
				if item_sayisi > (ayarlar["acma_adeti"]-1) then
					pc.remove_item(ayarlar["metinler"]["elmas_gelisim"], ayarlar["acma_adeti"])
					pc.give_item2(ayarlar["oduller"]["elmas_gelisim"][1][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["elmas_gelisim"][1][2])
					pc.give_item2(ayarlar["oduller"]["elmas_gelisim"][2][1],math.random(215, 225))
					pc.give_item2(ayarlar["oduller"]["elmas_gelisim"][3][1],math.random(150, 250))
					pc.give_item2(ayarlar["oduller"]["elmas_gelisim"][4][1],math.random(270, 310))
					pc.give_item2(ayarlar["oduller"]["elmas_gelisim"][5][1],math.random(115, 130))
					pc.give_item2(ayarlar["oduller"]["elmas_gelisim"][6][1],math.random(135, 145))
					pc.give_item2(ayarlar["oduller"]["elmas_gelisim"][7][1],math.random(120, 130))
					pc.give_item2(ayarlar["oduller"]["elmas_gelisim"][8][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["elmas_gelisim"][8][2])
					pc.give_item2(ayarlar["oduller"]["elmas_gelisim"][9][1],math.random(95, 110))
					pc.give_item2(ayarlar["oduller"]["elmas_gelisim"][10][1],math.random(1, 3))
					pc.give_item2(ayarlar["oduller"]["elmas_gelisim"][11][1],math.random(25, 35))

					chat("Hýzlý sandik açma baþarýlý: "..item_name(ayarlar["metinler"]["elmas_gelisim"])..": "..ayarlar["acma_adeti"].." adet.")
				else
					chat("Yeterli "..item_name(ayarlar["metinler"]["elmas_gelisim"]).." yok.")
				end
			elseif sandik == 9 then
				item_sayisi = pc.count_item(ayarlar["metinler"]["efsanevi_gelisim"])
				if item_sayisi > (ayarlar["acma_adeti"]-1) then
					pc.remove_item(ayarlar["metinler"]["efsanevi_gelisim"], ayarlar["acma_adeti"])
					pc.give_item2(ayarlar["oduller"]["efsanevi_gelisim"][1][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["efsanevi_gelisim"][1][2])
					pc.give_item2(ayarlar["oduller"]["efsanevi_gelisim"][2][1],math.random(205, 225))
					pc.give_item2(ayarlar["oduller"]["efsanevi_gelisim"][3][1],math.random(410, 420))
					pc.give_item2(ayarlar["oduller"]["efsanevi_gelisim"][4][1],math.random(500, 540))
					pc.give_item2(ayarlar["oduller"]["efsanevi_gelisim"][5][1],math.random(165, 175))
					pc.give_item2(ayarlar["oduller"]["efsanevi_gelisim"][6][1],math.random(145, 155))
					pc.give_item2(ayarlar["oduller"]["efsanevi_gelisim"][7][1],math.random(215, 245))
					pc.give_item2(ayarlar["oduller"]["efsanevi_gelisim"][10][1],math.random(65, 95))

					chat("Hýzlý sandik açma baþarýlý: "..item_name(ayarlar["metinler"]["efsanevi_gelisim"])..": "..ayarlar["acma_adeti"].." adet.")
				else
					chat("Yeterli "..item_name(ayarlar["metinler"]["efsanevi_gelisim"]).." yok.")
				end
			elseif sandik == 10 then
				item_sayisi = pc.count_item(ayarlar["metinler"]["istiridye"])
				if item_sayisi > (ayarlar["acma_adeti"]-1) then
					pc.remove_item(ayarlar["metinler"]["istiridye"], ayarlar["acma_adeti"])
					pc.give_item2(ayarlar["oduller"]["istiridye"][1][1],math.random(6, 9))
					pc.give_item2(ayarlar["oduller"]["istiridye"][2][1],math.random(6, 9))
					pc.give_item2(ayarlar["oduller"]["istiridye"][3][1],math.random(6, 9))
					pc.give_item2(ayarlar["oduller"]["istiridye"][4][1],math.random(6, 9))
					pc.give_item2(ayarlar["oduller"]["istiridye"][5][1],math.random(6, 9))
					pc.give_item2(ayarlar["oduller"]["istiridye"][6][1],math.random(6, 9))
					pc.give_item2(ayarlar["oduller"]["istiridye"][7][1],math.random(100, 110))

					chat("Hýzlý sandik açma baþarýlý: "..item_name(ayarlar["metinler"]["istiridye"])..": "..ayarlar["acma_adeti"].." adet.")
				else
					chat("Yeterli "..item_name(ayarlar["metinler"]["istiridye"]).." yok.")
				end
			else
				return
			end
		end
	end
end