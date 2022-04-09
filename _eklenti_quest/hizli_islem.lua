---- asdasdas
quest hizliislem begin
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
					["elmas_yukseltme"] = 30343,
					--GELÝÞÝM
					["istiridye"] = 27987,
					["enfekte"] = 61132
				},
				["oduller"] =  {
					["70_level"] = {
						[1] = {30344, 1},
						[2] = {61103, 1},
						[3] = {50260, 4},
						[4] = {80006, 2},
						[5] = {50513, 1},
						[6] = {70102, 1},
						[7] = {50097, 1},
						[8] = {71504, 1}
					},
					["90_level"] = {
						[1] = {30342, 1},
						[2] = {61104, 1},
						[3] = {50260, 8},
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
						[3] = {50260, 12},
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
						[8] = {50927, 2},
						[9] = {50926, 2},
						[10] = {51001, 1}
					},
					["col"] = {
						[1] = {30343, 2},
						[2] = {61202, 2},
						[3] = {50260, 32},
						[4] = {80007, 3},
						[5] = {50513, 2},
						[6] = {70102, 2},
						[7] = {50097, 2},
						[8] = {50927, 4},
						[9] = {50926, 4},
						[10] = {51001, 2}
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
					},
					["enfekte"] = {
						[1] = {30343, 2},
						[2] = {61202, 2},
						[3] = {50260, 32},
						[4] = {80007, 3},
						[5] = {50513, 2},
						[6] = {70102, 2},
						[7] = {50097, 2},
						[8] = {50927, 4},
						[9] = {50926, 4},
						[10] = {51001, 2}
					},
					["elmas_yukseltme"] = {
						[1] = {30607, 2},
						[2] = {30518, 2},
						[3] = {30508, 32},
						[4] = {30511, 3},
						[5] = {30505, 2},
						[6] = {30515, 2},
						[7] = {51001, 2},
						[8] = {30522, 4},
						[9] = {30604, 4},
						[10] = {30504, 2},
						[11] = {30517, 2},
						[12] = {30610, 2},
						[13] = {30616, 2},
						[14] = {30614, 2},
						[15] = {30502, 2},
						[16] = {30512, 2},
						[17] = {30514, 2},
						[18] = {30506, 2},
						[19] = {30617, 2},
						[20] = {30507, 2},
						[21] = {30503, 2},
						[22] = {30500, 2},
						[23] = {30509, 2},
						[24] = {30501, 2},
						[25] = {30542, 2},
						[26] = {30615, 2},
						[27] = {30524, 2},
						[28] = {30513, 2},
						[29] = {30619, 2},
						[30] = {30608, 2},
						[31] = {30520, 2},
						[32] = {30523, 2},
						[33] = {30602, 2},
						[34] = {30618, 2},
						[35] = {30605, 2},
						[36] = {30601, 2},
						[37] = {30600, 2},
						[38] = {30606, 2},
						[39] = {30560, 2},
						[40] = {30609, 2},
						[41] = {30580, 2},
						[42] = {30521, 2},
						[43] = {30516, 2},
						[44] = {30510, 2},
						[45] = {30567, 2},
						[46] = {30603, 2},
						[47] = {30519, 2},
						[48] = {30611, 2}
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
			say_size(350,350)
			addimage(25, 10, "hm1.png");
			say("")
			say("")
			if game.get_event_flag("hizli_islem_sistemi") == 0 then
				say_reward("Þuan sistem kapalýdýr...")
				return
			end
			if hizliislem.check_pc() == false then
				syschat("Meþgul durumda olduðun için bu iþlemi gerçekleþtiremezsin.")
				return
			elseif pc.is_dead() == true then
				syschat("Ölü durumda olduðun için bu iþlemi gerçekleþtiremezsin.")
				return
			end
			
			local sd2sec = select(
				"Sandýk Ýþlemleri ",
				"Won Ýþlemleri ",
				"Gaya Ýþlemleri ",
				"Bar - Won Takasý ",
				"Cor - Won Takasý ",
				"Cor Stokla ",
				"Cor - Efsanevi Takasý ",
				"Ýnce Kumaþ - Won Takasý ",
				"Enerji Parçasý - Won Takasý ",
				"Zen - Ruh Takasý (1.000) ",
				"Zen - Ruh Takasý (10.000) ",
				"Won Paketle (1.000) ",
				"Won Paketle (10.000) ",
				"(YENÝ) Derece Yükseltme ",
				"Kullanmak Ýstemiyorum. ")
			if sd2sec == 1 then
				if game.get_event_flag("hizli_sandik_sistemi") == 0 then
					say_reward("Þuan sistem kapalý daha sonra tekrar dene..")
					return
				end
				local ayarlar = hizliislem.settings()
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
					"(YENÝ) 1000 Adet Büyülü Orman M. S. Aç ", 
					"(YENÝ) 1000 Adet Firavun M. S. Aç ", 
					"(YENÝ) 200 Adet Enfekte Orman M. S. Aç ", 
					"(YENÝ) 1000 Adet Elmas Yükseltme S. Aç ", 
					"(YENÝ) 1000 Adet Efsanevi Geliþim S. Aç ", 
					"(YENÝ) 1000 Adet Ýstiridye Aç ", 
					"(YENÝ) 1000 Adet Enfekte Orman M.S. Aç ", 
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
							pc.give_item2(55048,1)
							pc.give_item2(ayarlar["oduller"]["90_level"][3][1],600)
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
							pc.give_item2(55048,2)
							-- pc.give_item2(ayarlar["oduller"]["beta"][3][1],1000)
							-- pc.give_item2(ayarlar["oduller"]["beta"][3][1],1000)
							pc.give_item2(ayarlar["oduller"]["beta"][3][1],400)
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
							pc.give_item2(55048,4)
							pc.give_item2(ayarlar["oduller"]["orman"][4][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["orman"][4][2])
							
							pc.give_item2(ayarlar["oduller"]["orman"][5][1],math.random(130, 145))
							pc.give_item2(ayarlar["oduller"]["orman"][6][1],math.random(280, 290))
							pc.give_item2(ayarlar["oduller"]["orman"][7][1],math.random(200, 250))
							pc.give_item2(ayarlar["oduller"]["orman"][8][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["orman"][8][2])
							pc.give_item2(ayarlar["oduller"]["orman"][9][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["orman"][9][2])
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
							pc.give_item2(55048,6)
							pc.give_item2(ayarlar["oduller"]["col"][3][1],400)										
							pc.give_item2(ayarlar["oduller"]["col"][4][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["col"][4][2])
															
							pc.give_item2(ayarlar["oduller"]["col"][5][1],math.random(280, 295))
							pc.give_item2(ayarlar["oduller"]["col"][6][1],math.random(510, 560))
							pc.give_item2(ayarlar["oduller"]["col"][7][1],math.random(290, 350))
							pc.give_item2(ayarlar["oduller"]["col"][8][1],ayarlar["acma_adeti"]*4)
							pc.give_item2(ayarlar["oduller"]["col"][9][1],ayarlar["acma_adeti"]*4)
							pc.give_item2(ayarlar["oduller"]["col"][10][1],math.random(270, 285))
		
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
						if pc.count_item(70025) < 1 then
							chat("Envanterinde Hýzlý Ýþlem Yüzüðü göremiyorum..")
						else
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
						end
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
							pc.give_item2(ayarlar["oduller"]["efsanevi_gelisim"][8][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["efsanevi_gelisim"][8][2])
							pc.give_item2(ayarlar["oduller"]["efsanevi_gelisim"][9][1],math.random(70, 90))
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
				elseif sandik == 11 then
					item_sayisi = pc.count_item(ayarlar["metinler"]["orman"])
					if item_sayisi > 999 then
						pc.remove_item(ayarlar["metinler"]["orman"], 1000)
						pc.give_item2(ayarlar["oduller"]["orman"][1][1],1000)
						pc.give_item2(ayarlar["oduller"]["orman"][2][1],1000)
						-- pc.give_item2(ayarlar["oduller"]["orman"][3][1],1000)
						-- pc.give_item2(ayarlar["oduller"]["orman"][3][1],1000)
						-- pc.give_item2(ayarlar["oduller"]["orman"][3][1],1000)
						-- pc.give_item2(ayarlar["oduller"]["orman"][3][1],1000)
						
						pc.give_item2(55048,20)
						
						pc.give_item2(ayarlar["oduller"]["orman"][4][1],1000)
						pc.give_item2(ayarlar["oduller"]["orman"][4][1],1000)
						
						pc.give_item2(ayarlar["oduller"]["orman"][5][1],math.random(650, 725))
						
						pc.give_item2(42351,1)
						pc.give_item2(ayarlar["oduller"]["orman"][6][1],math.random(400, 450))
						
						pc.give_item2(ayarlar["oduller"]["orman"][7][1],1000)
						pc.give_item2(ayarlar["oduller"]["orman"][7][1],math.random(200, 250))
						
						pc.give_item2(55040,2)

						pc.give_item2(ayarlar["oduller"]["orman"][10][1],math.random(675, 700))
		
						chat("Hýzlý sandik açma baþarýlý: "..item_name(ayarlar["metinler"]["orman"])..": 1000 adet.")
					else
						chat("Yeterli "..item_name(ayarlar["metinler"]["orman"]).." yok.")
					end
				elseif sandik == 12 then
					item_sayisi = pc.count_item(ayarlar["metinler"]["col"])
					if item_sayisi > 999 then
						pc.remove_item(ayarlar["metinler"]["col"], 1000)
						pc.give_item2(ayarlar["oduller"]["col"][1][1],1000)
						pc.give_item2(ayarlar["oduller"]["col"][1][1],1000)
						
						pc.give_item2(ayarlar["oduller"]["col"][2][1],1000)
						pc.give_item2(ayarlar["oduller"]["col"][2][1],1000)
						
						pc.give_item2(55048,32)

						pc.give_item2(ayarlar["oduller"]["col"][4][1],1000)
						pc.give_item2(ayarlar["oduller"]["col"][4][1],1000)
						pc.give_item2(ayarlar["oduller"]["col"][4][1],1000)
						
						---RUH
						pc.give_item2(42353,2)
						pc.give_item2(ayarlar["oduller"]["col"][5][1],math.random(300, 375))
						
						---ZEN
						pc.give_item2(42351,2)
						pc.give_item2(ayarlar["oduller"]["col"][6][1],math.random(550, 800))
						
						pc.give_item2(ayarlar["oduller"]["col"][7][1],1000)
						pc.give_item2(ayarlar["oduller"]["col"][7][1],math.random(450, 750))
						
						pc.give_item2(55040,4)
						pc.give_item2(55041,4)
						-- pc.give_item2(ayarlar["oduller"]["col"][9][1],ayarlar["acma_adeti"]*4)
						pc.give_item2(ayarlar["oduller"]["col"][10][1],1000)
						pc.give_item2(ayarlar["oduller"]["col"][10][1],math.random(350, 425))
						
						chat("Hýzlý sandik açma baþarýlý: "..item_name(ayarlar["metinler"]["col"])..": 1000 adet.")
					else
						chat("Yeterli "..item_name(ayarlar["metinler"]["col"]).." yok.")
					end
				elseif sandik == 13 then
					item_sayisi = pc.count_item(ayarlar["metinler"]["enfekte"])
					if item_sayisi > (ayarlar["acma_adeti"]-1) then
						pc.remove_item(ayarlar["metinler"]["enfekte"], ayarlar["acma_adeti"])
						pc.give_item2(ayarlar["oduller"]["enfekte"][1][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][1][1],1000)
						
						pc.give_item2(ayarlar["oduller"]["enfekte"][2][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][2][1],1000)
						-- pc.give_item2(ayarlar["oduller"]["enfekte"][2][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["enfekte"][2][2])
						pc.give_item2(55048,32)
						-- pc.give_item2(ayarlar["oduller"]["enfekte"][3][1],400)
						
						pc.give_item2(ayarlar["oduller"]["enfekte"][4][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][4][1],1000)
						
						pc.give_item2(42353,2)
						pc.give_item2(ayarlar["oduller"]["enfekte"][5][1],math.random(280, 295))

						pc.give_item2(42351,5)
						
						pc.give_item2(ayarlar["oduller"]["enfekte"][7][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][7][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][7][1],1000)

						pc.give_item2(55040,5)
						pc.give_item2(55041,5)

						pc.give_item2(ayarlar["oduller"]["enfekte"][10][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][10][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][10][1],1000)
		
						chat("Hýzlý sandik açma baþarýlý: "..item_name(ayarlar["metinler"]["enfekte"])..": "..ayarlar["acma_adeti"].." adet.")
					else
						chat("Yeterli "..item_name(ayarlar["metinler"]["enfekte"]).." yok.")
					end
				elseif sandik == 14 then
					item_sayisi = pc.count_item(ayarlar["metinler"]["elmas_yukseltme"])
					if item_sayisi > 999 then
						pc.remove_item(ayarlar["metinler"]["elmas_yukseltme"],1000)
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][1][1],math.random(14, 16))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][2][1],math.random(37, 41))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][3][1],math.random(23, 27))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][4][1],math.random(40, 45))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][5][1],math.random(30, 34))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][6][1],math.random(45, 50))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][7][1],math.random(520, 530))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][8][1],math.random(17, 21))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][9][1],math.random(10, 13))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][10][1],math.random(37, 41))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][11][1],math.random(42, 45))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][12][1],math.random(11, 14))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][13][1],math.random(7, 9))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][14][1],math.random(12, 15))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][15][1],math.random(31, 35))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][16][1],math.random(31, 35))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][17][1],math.random(33, 37))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][18][1],math.random(27, 29))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][19][1],math.random(12, 14))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][20][1],math.random(43, 47))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][21][1],math.random(27, 29))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][22][1],math.random(47, 50))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][23][1],math.random(29, 32))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][24][1],math.random(39, 42))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][25][1],math.random(4, 5))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][26][1],math.random(10, 13))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][27][1],math.random(6, 7))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][28][1],math.random(10, 13))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][29][1],math.random(17, 19))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][30][1],math.random(14, 17))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][31][1],math.random(34, 37))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][32][1],math.random(7, 9))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][33][1],math.random(14, 17))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][34][1],math.random(13, 15))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][35][1],math.random(16, 19))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][36][1],math.random(8, 9))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][37][1],math.random(8, 9))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][38][1],math.random(9, 12))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][39][1],math.random(7, 8))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][40][1],math.random(11, 15))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][41][1],math.random(7, 8))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][42][1],math.random(13, 15))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][43][1],math.random(4, 7))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][44][1],math.random(8, 11))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][45][1],math.random(7, 9))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][46][1],math.random(7, 8))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][47][1],math.random(9, 12))
						pc.give_item2(ayarlar["oduller"]["elmas_yukseltme"][48][1],math.random(7, 8))
		
						chat("Hýzlý sandik açma baþarýlý: "..item_name(ayarlar["metinler"]["elmas_yukseltme"])..": 1000 adet.")
					else
						chat("Yeterli "..item_name(ayarlar["metinler"]["elmas_yukseltme"]).." yok.")
					end
				elseif sandik == 15 then
					item_sayisi = pc.count_item(ayarlar["metinler"]["efsanevi_gelisim"])
					if item_sayisi > 999 then
							pc.remove_item(ayarlar["metinler"]["efsanevi_gelisim"], 1000)
							pc.give_item2(42357,1)
							
							pc.give_item2(42351,1)
							pc.give_item2(ayarlar["oduller"]["efsanevi_gelisim"][2][1],math.random(25, 125))
							
							pc.give_item2(42352,2)
							pc.give_item2(ayarlar["oduller"]["efsanevi_gelisim"][3][1],math.random(50, 100))
							
							pc.give_item2(55048,2)
							pc.give_item2(ayarlar["oduller"]["efsanevi_gelisim"][4][1],math.random(500, 700))
							
							pc.give_item2(ayarlar["oduller"]["efsanevi_gelisim"][5][1],math.random(825, 875))
							
							pc.give_item2(ayarlar["oduller"]["efsanevi_gelisim"][6][1],math.random(725, 775))
							
							pc.give_item2(42353,1)
							pc.give_item2(ayarlar["oduller"]["efsanevi_gelisim"][7][1],math.random(75, 225))
							
							-- pc.give_item2(ayarlar["oduller"]["efsanevi_gelisim"][8][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["efsanevi_gelisim"][8][2])
							-- pc.give_item2(ayarlar["oduller"]["efsanevi_gelisim"][9][1],math.random(70, 90))
							
							pc.give_item2(ayarlar["oduller"]["efsanevi_gelisim"][10][1],math.random(325, 475))
		
							chat("Hýzlý sandik açma baþarýlý: "..item_name(ayarlar["metinler"]["efsanevi_gelisim"])..": 1000 adet.")
					else
						chat("Yeterli "..item_name(ayarlar["metinler"]["efsanevi_gelisim"]).." yok.")
					end
				elseif sandik == 16 then
					item_sayisi = pc.count_item(ayarlar["metinler"]["istiridye"])
					if item_sayisi > 999 then
							pc.remove_item(ayarlar["metinler"]["istiridye"], 1000)
							pc.give_item2(ayarlar["oduller"]["istiridye"][1][1],math.random(30, 45))
							pc.give_item2(ayarlar["oduller"]["istiridye"][2][1],math.random(30, 45))
							pc.give_item2(ayarlar["oduller"]["istiridye"][3][1],math.random(30, 45))
							pc.give_item2(ayarlar["oduller"]["istiridye"][4][1],math.random(30, 45))
							pc.give_item2(ayarlar["oduller"]["istiridye"][5][1],math.random(30, 45))
							pc.give_item2(ayarlar["oduller"]["istiridye"][6][1],math.random(30, 45))
							pc.give_item2(ayarlar["oduller"]["istiridye"][7][1],math.random(500, 150))
		
							chat("Hýzlý sandik açma baþarýlý: "..item_name(ayarlar["metinler"]["istiridye"])..": 1000 adet.")
					else
						chat("Yeterli "..item_name(ayarlar["metinler"]["istiridye"]).." yok.")
					end
				elseif sandik == 17 then
					item_sayisi = pc.count_item(ayarlar["metinler"]["enfekte"])
					if item_sayisi > 999 then
						pc.remove_item(ayarlar["metinler"]["enfekte"], 1000)
						pc.give_item2(42436,10)
						
						pc.give_item2(ayarlar["oduller"]["enfekte"][2][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][2][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][2][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][2][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][2][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][2][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][2][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][2][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][2][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][2][1],1000)
						-- pc.give_item2(ayarlar["oduller"]["enfekte"][2][1],ayarlar["acma_adeti"]*ayarlar["oduller"]["enfekte"][2][2])
						pc.give_item2(55048,160)
						-- pc.give_item2(ayarlar["oduller"]["enfekte"][3][1],400)
						
						pc.give_item2(ayarlar["oduller"]["enfekte"][4][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][4][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][4][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][4][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][4][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][4][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][4][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][4][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][4][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][4][1],1000)
						
						pc.give_item2(42353,10)
						
						pc.give_item2(ayarlar["oduller"]["enfekte"][5][1],1000)
						pc.give_item2(ayarlar["oduller"]["enfekte"][5][1],math.random(400, 475))

						pc.give_item2(42351,25)
						
						pc.give_item2(42438,15)

						pc.give_item2(55040,25)
						pc.give_item2(55041,25)

						pc.give_item2(42355,15)
		
						chat("Hýzlý sandik açma baþarýlý: "..item_name(ayarlar["metinler"]["enfekte"])..": 1000 adet.")
					else
						chat("Yeterli "..item_name(ayarlar["metinler"]["enfekte"]).." yok.")
					end
				else
					return
				end
			elseif sd2sec == 2 then
				local wonalsat = select("Won Satýn Al ", "Won Bozdur ", "Vazgeç ")
				if wonalsat == 1 then
					local wonyang = select("1 Won -> 100M Yang " , "5 Won -> 500M Yang " ,"10 Won -> 1T Yang", "Vazgeç ")
					if wonyang == 1 then
						if pc.get_gold() > 99999999 then
							if pc.get_cheque() <= 29998 then
									pc.change_cheque(1)
									pc.change_gold(-100000000)
							else
								syschat("Envanterindeki en fazla 30Bin won olabilir.")
							end
						else
							syschat("Yeterli yang yok!")
						end
					elseif wonyang == 2 then
						if pc.get_gold() > 499999999 then
							if pc.get_cheque() <= 29994 then
									pc.change_cheque(5)
									pc.change_gold(-500000000)
							else
								syschat("Envanterindeki en fazla 30Bin won olabilir.")
							end
						else
							syschat("Yeterli yang yok!")
						end
					elseif wonyang == 3 then
						if pc.get_gold() >= 999999999 then
							if pc.get_cheque() <= 29989 then
									pc.change_cheque(10)
									pc.change_gold(-1000000000)
							else
								syschat("Envanterindeki en fazla 30Bin won olabilir.")
							end
						else
							syschat("Yeterli yang yok!")
						end
					else
						return
					end
				elseif wonalsat == 2 then
					local wonsat = select("1 Won -> 100M Yang " , "5 Won -> 500M Yang " ,"10 Won -> 1T Yang", "Vazgeç ")
					if wonsat == 1 then
						if pc.get_cheque() >= 1 then
							if pc.get_gold() <= 1899999999 then
									pc.change_cheque(-1)
									pc.change_gold(100000000)
							else
								syschat("Envanterindeki en fazla yang miktarý 2T olabilir.")
							end
						else
							syschat("Yeterli won yok!")
						end
					elseif wonsat == 2 then
						if pc.get_cheque() >= 5 then
							if pc.get_gold() <= 1499999999 then
									pc.change_cheque(-5)
									pc.change_gold(500000000)
							else
								syschat("Envanterindeki en fazla yang miktarý 2T olabilir.")
							end
						else
							syschat("Yeterli won yok!")
						end
					elseif wonsat == 3 then
						if pc.get_cheque() >= 10 then
							if pc.get_gold() <= 999999999 then
									pc.change_cheque(-10)
									pc.change_gold(1000000000)
							else
								syschat("Envanterindeki en fazla yang miktarý 2T olabilir.")
							end
						else
							syschat("Yeterli won yok!")
						end
					else
						return
					end
				end
			elseif sd2sec == 3 then
				local gaya = select("1000 Metin Gaya Paketle ", "1000 Boss Gaya Paketle ", "Vazgeç ")
				if gaya == 1 then
					if pc.count_item(50927) > 999 then
							pc.give_item2(55040, 1)
							pc.remove_item(50927, 1000)
							syschat("1000 Metin Gaya Birleþtirildi.")
					else
						syschat("Yeterli Metin Gaya yok !")
					end
				elseif gaya == 2 then
					if pc.count_item(50926) > 999 then
							pc.give_item2(55041, 1)
							pc.remove_item(50926, 1000)
							syschat("1000 Boss Gaya Birleþtirildi.")
					else
						syschat("Yeterli Boss Gaya yok !")
					end
				end
			elseif sd2sec == 4 then
				local barsec = select ("500K Gold Bar " , "5M Gold Bar " , "Kullanmak Ýstemiyorum. ")
				if barsec == 1 then
					local bar_secenek = select("200 Adet -> 1 Won " , "1.000 Adet -> 5 Won ", "10.000 Adet -> 50 Won " , "Vazgeç ")
					if bar_secenek == 1 then
						if pc.count_item(80006) > 199 then
							if pc.get_cheque() < 995 then
									pc.remove_item(80006, 200)
									pc.change_cheque(1)
							else
								syschat("Yeterli bar yok !")
							end
						else
							syschat("Yeterli bar yok!!")
						end
					elseif bar_secenek == 2 then
						if pc.count_item(80006) > 999 then
							if pc.get_cheque() < 29995 then
									pc.remove_item(80006, 1000)
									pc.change_cheque(5)
							else
								syschat("Max Won 30000'i Geçemez!")
							end
						else
							syschat("Yeterli bar yok!!")
						end
					elseif bar_secenek == 3 then
						if pc.count_item(80006) > 9999 then
							if pc.get_cheque() < 29940 then
									pc.remove_item(80006, 10000)
									pc.change_cheque(50)
							else
								syschat("Max Won 30000'i Geçemez!")
							end
						else
							syschat("Yeterli bar yok!!")
						end
					end
				elseif barsec == 2 then 
					local bar_secenek1 = select("200 Adet -> 10 Won " , "1000 Adet -> 50 Won ", "10.000 Adet -> 500 Won " , "Vazgeç ")
					if bar_secenek1 == 1 then
						if pc.count_item(80007) > 199 then
							if pc.get_cheque() < 29991 then
									pc.remove_item(80007, 200)
									pc.change_cheque(10)
							else
								syschat("Max Won 30000'i Geçemez!")
							end
						else
							syschat("Yeterli bar yok!!")
						end
					elseif bar_secenek1 == 2 then
						if pc.count_item(80007) > 999 then
							if pc.get_cheque() < 29950 then
									pc.remove_item(80007, 1000)
									pc.change_cheque(50)
							else
								syschat("Max Won 30000'i Geçemez!")
							end
						else
							syschat("Yeterli bar yok!!")
						end
					elseif bar_secenek1 == 3 then
						if pc.count_item(80007) > 9999 then
							if pc.get_cheque() < 24998 then
									pc.remove_item(80007, 10000)
									pc.change_cheque(500)
							else
								syschat("Max Won 30000'i Geçemez!")
							end
						else
							syschat("Yeterli bar yok ! Gerekli : 10.000")
						end
					end
				else
					return
				end
			elseif sd2sec == 5 then
				local cor = select("1000 Cor -> 4 Won " , "5000 Cor -> 20 Won " , "Vazgeç ")
				if cor == 1 then
					if pc.count_item(50260) > 999 then
							pc.remove_item(50260, 1000)
							pc.change_cheque(4)
					else
						syschat("Yeterli Cor yok!")
					end
				elseif cor == 2 then
					if pc.count_item(50260) > 4999 then
							pc.remove_item(50260, 5000)
							pc.change_cheque(20)
					else
						syschat("Yeterli Cor yok!")
					end
				else
					return
				end	
			elseif sd2sec == 6 then
				local corbirlestir = select("Cor Stokla (1.000) " ,"Cor Stokla (10.000) " , "Vazgeç ")
				if corbirlestir == 1 then
					if pc.count_item(50260) > 999 then
						if pc.count_item(70025) < 1 then
							chat("Envanterinde Hýzlý Ýþlem Yüzüðü göremiyorum..")
						else
							pc.remove_item(50260, 1000)
							pc.give_item2(55048,1)
						end
					else
						syschat("Yeterli Cor yok!")
					end
				elseif corbirlestir == 2 then
					if pc.count_item(50260) > 9999 then
						if pc.count_item(70025) < 1 then
							chat("Envanterinde Hýzlý Ýþlem Yüzüðü göremiyorum..")
						else
							pc.remove_item(50260, 10000)
							pc.give_item2(55048,10)
						end
					else
						syschat("Yeterli Cor yok! Gerekli : 10.000")
					end
				else
					return
				end	
			elseif sd2sec == 7 then
				local efsane = select("1500 Cor - 25 Efsanevi " , "3000 Cor - 50 Efsanevi " ,"6000 Cor - 100 Efsanevi " , "Vazgeç ")
				if efsane == 1 then
					if pc.count_item(50260) > 1499 then
							pc.remove_item(50260, 1500)
							pc.give_item2(51510, 25)
					else
						syschat("Yeterli cor yok!")
					end
				elseif efsane == 2 then
					if pc.count_item(50260) > 2999 then
							pc.remove_item(50260, 3000)
							pc.give_item2(51510, 50)
					else
						syschat("Yeterli cor yok!")
					end
				elseif efsane == 3 then
					if pc.count_item(50260) > 5999 then
							pc.remove_item(50260, 6000)
							pc.give_item2(51510, 100)
					else
						syschat("Yeterli cor yok!")
					end
				else
					return
				end
			elseif sd2sec == 8 then
				local kumas = select("1000 Kumaþ -> 1 Won " , "5000 Kumaþ -> 5 Won " , "Vazgeç ")
				if kumas == 1 then
					if pc.count_item(85000) > 999 then
							pc.remove_item(85000, 1000)
							pc.change_cheque(1)
					else
						syschat("Yeterli kumaþ yok!")
					end
				elseif kumas == 2 then
					if pc.count_item(85000) > 4999 then
							pc.remove_item(85000, 5000)
							pc.change_cheque(5)
					else
						syschat("Yeterli kumaþ yok!")
					end
				else
					return
				end
			elseif sd2sec == 9 then
				local eparca = select("1000 Enerji Parçasý - 1 Won " , "5000 Enerji Parçasý - 5 Won " , "Vazgeç ")
				if eparca == 1 then
					if pc.count_item(51001) > 999 then
							pc.remove_item(51001, 1000)
							pc.change_cheque(1)
					else
						syschat("Yeterli Enerji Parçasý yok!")
					end
				elseif eparca == 2 then
					if pc.count_item(51001) > 4999 then
							pc.remove_item(51001, 5000)
							pc.change_cheque(5)
					else
						syschat("Yeterli Enerji Parçasý yok!")
					end
				else
					return
				end
			elseif sd2sec == 10 then
				if pc.count_item(42351) > 0 then
					pc.remove_item(42351, 1)
					pc.give_item2(42353, 1)
					syschat("Takas gerçekleþmiþtir..")
				else
					syschat("Yeterli sayýda zen paketi bulunamadý. Gerekli : 1")
					return
				end
			elseif sd2sec == 11 then
				if pc.count_item(42351) > 9 then
					pc.remove_item(42351, 10)
					pc.give_item2(42353, 10)
					syschat("Takas gerçekleþmiþtir..")
				else
					syschat("Yeterli sayýda zen paketi bulunamadý. Gerekli : 10")
					return
				end
			elseif sd2sec == 12 then
				if pc.get_cheque() >= 1000 then
					pc.change_cheque(-1000)
					pc.give_item2(80040, 50)
					syschat("Takas gerçekleþmiþtir..")
				else
					syschat("Yeterli sayýda won bulunamadý. Gerekli : 1.000")
					return
				end
			elseif sd2sec == 13 then
				if pc.get_cheque() >= 10000 then
					pc.change_cheque(-10000)
					pc.give_item2(80040, 500)
					syschat("Takas gerçekleþmiþtir..")
				else
					syschat("Yeterli sayýda won bulunamadý. Gerekli : 10.000")
					return
				end
			elseif sd2sec == 14 then
				say_reward("Devam ettiðinizde dereceniz 30.000 olacaktýr.")
				say_reward("Gerekli nesne : 30 Adet "..item_name(42351).." ..")
				local soru = select("Devam ", "Vazgeç ")
				if soru == 1 then
				
					if pc.count_item(42351) > 29 then
						pc.remove_item(42351, 30)
						pc.change_alignment(30000)
						
						syschat("Dereceniz yükseltilmiþtir..")
					
					else
						syschat("Yeterli sayýda zen paketi bulunamadý. Gerekli : 30")
						return
					end
				else
					return
				end
			else
				return
			end
		end
	end
end