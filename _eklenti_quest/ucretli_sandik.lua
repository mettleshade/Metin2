---- asdasdas
quest ucretli_item begin
	state start begin
		function check_pc()
			if pc.is_busy() == true then return false end
			return true
		end
		
		--PERMA KOSTÜM
		when 42199.use begin
			if ucretli_item.check_pc() == false then
				syschat("Meþgul durumda olduðun için bu iþlemi gerçekleþtiremezsin.")
				return
			elseif pc.is_dead() == true then
				syschat("Ölü durumda olduðun için bu iþlemi gerçekleþtiremezsin.")
				return
			end
		
			say_title(""..item_name(42199).."")
			say("")
			say_reward("Kostümü hangi karaktere almak istiyorsun ?")
			
			say("")
			
			local zirh_sec = select(
			""..item_name(41828).."",
			""..item_name(41829).."",
			"Daha Sonra Kullan"
			)
			
			if zirh_sec == 1 then
				if pc.count_item(42199) < 1 then
					syschat("Envanterinde "..item_name(42199).." göremiyorum..")
					return
				else
					pc.remove_item(42199, 1)
					pc.give_item2(41828,1)
				end
			elseif zirh_sec == 2 then
				if pc.count_item(42199) < 1 then
					syschat("Envanterinde "..item_name(42199).." göremiyorum..")
					return
				else
					pc.remove_item(42199, 1)
					pc.give_item2(41829,1)
				end
			elseif zirh_sec == 3 then
				return
			end
		end

		when 42200.use begin
			if ucretli_item.check_pc() == false then
				syschat("Meþgul durumda olduðun için bu iþlemi gerçekleþtiremezsin.")
				return
			elseif pc.is_dead() == true then
				syschat("Ölü durumda olduðun için bu iþlemi gerçekleþtiremezsin.")
				return
			end
		
			say_title(""..item_name(42200).."")
			say("")
			say_reward("Kostümü hangi karaktere almak istiyorsun ?")
			
			say("")
			
			local kask_sec = select(
			""..item_name(41830).."",
			""..item_name(41831).."",
			"Daha Sonra Kullan"
			)
			
			if kask_sec == 1 then
				if pc.count_item(42200) < 1 then
					syschat("Envanterinde "..item_name(42200).." göremiyorum..")
					return
				else
					pc.remove_item(42200, 1)
					pc.give_item2(41830,1)
				end
			elseif kask_sec == 2 then
				if pc.count_item(42200) < 1 then
					syschat("Envanterinde "..item_name(42200).." göremiyorum..")
					return
				else
					pc.remove_item(42200, 1)
					pc.give_item2(41831,1)
				end
			elseif kask_sec == 3 then
				return
			end
		end

		when 42201.use begin
			say_size(350,400)
			if ucretli_item.check_pc() == false then
				syschat("Meþgul durumda olduðun için bu iþlemi gerçekleþtiremezsin.")
				return
			elseif pc.is_dead() == true then
				syschat("Ölü durumda olduðun için bu iþlemi gerçekleþtiremezsin.")
				return
			end
		
			say_title(""..item_name(42201).."")
			say("")
			say_reward("Kostümü hangi karaktere almak istiyorsun ?")
			
			say("")
			
			local silah_sec = select(
			""..item_name(41848).."",
			""..item_name(41849).."",
			""..item_name(41850).."",
			""..item_name(41851).."",
			""..item_name(41852).."",
			""..item_name(41853).."",
			""..item_name(41854).."",
			""..item_name(41855).."",
			"Daha Sonra Kullan"
			)
			
			if silah_sec == 1 then
				if pc.count_item(42201) < 1 then
					syschat("Envanterinde "..item_name(42201).." göremiyorum..")
					return
				else
					pc.remove_item(42201, 1)
					pc.give_item2(41848,1)
				end
			elseif silah_sec == 2 then
				if pc.count_item(42201) < 1 then
					syschat("Envanterinde "..item_name(42201).." göremiyorum..")
					return
				else
					pc.remove_item(42201, 1)
					pc.give_item2(41849,1)
				end
			elseif silah_sec == 3 then
				if pc.count_item(42201) < 1 then
					syschat("Envanterinde "..item_name(42201).." göremiyorum..")
					return
				else
					pc.remove_item(42201, 1)
					pc.give_item2(41850,1)
				end
			elseif silah_sec == 4 then
				if pc.count_item(42201) < 1 then
					syschat("Envanterinde "..item_name(42201).." göremiyorum..")
					return
				else
					pc.remove_item(42201, 1)
					pc.give_item2(41851,1)
				end
			elseif silah_sec == 5 then
				if pc.count_item(42201) < 1 then
					syschat("Envanterinde "..item_name(42201).." göremiyorum..")
					return
				else
					pc.remove_item(42201, 1)
					pc.give_item2(41852,1)
				end
			elseif silah_sec == 6 then
				if pc.count_item(42201) < 1 then
					syschat("Envanterinde "..item_name(42201).." göremiyorum..")
					return
				else
					pc.remove_item(42201, 1)
					pc.give_item2(41853,1)
				end
			elseif silah_sec == 7 then
				if pc.count_item(42201) < 1 then
					syschat("Envanterinde "..item_name(42201).." göremiyorum..")
					return
				else
					pc.remove_item(42201, 1)
					pc.give_item2(41854,1)
				end
			elseif silah_sec == 8 then
				if pc.count_item(42201) < 1 then
					syschat("Envanterinde "..item_name(42201).." göremiyorum..")
					return
				else
					pc.remove_item(42201, 1)
					pc.give_item2(41855,1)
				end
			elseif silah_sec == 9 then
				return
			end
		end
		
		
	end
end