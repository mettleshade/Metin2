quest zodiac_temples begin
	state start begin

		function CheckAnimasfer()
			local user_animasfer = {}
			local pids = {party.get_member_pids()}

			for i = 1, table.getn(pids), 1 do
				q.begin_other_pc_block(pids[i])
				if pc.get_animasfer() < 12 then
					table.insert(user_animasfer, table.getn(user_animasfer) +1, pc.get_name())
				end

				q.end_other_pc_block()
			end

			if table.getn(user_animasfer) >= 1 then
				say_title(mob_name(npc.get_race()))
				say("Zodyak Tap�na��na girebilmek i�in,[ENTER]b�t�n grup �yelerinin[ENTER]en az 12 animasfere sahip olmas� gereklidir.[ENTER]Ge�i� izni olmayan �yeler:")

				for x = 1, table.getn(user_animasfer), 1 do
					say(color(1,1,0), " "..user_animasfer[x])
				end

				return false
			end
		end

		function DeleteAnimasfer()
			local user_animasfer = {}
			local pids = {party.get_member_pids()}

			for i = 1, table.getn(pids), 1 do
				q.begin_other_pc_block(pids[i])
				if pc.get_animasfer() >= 12 then
					pc.start_animasfer()
				end

				q.end_other_pc_block()
			end
		end

		when 40001.use with pc.get_map_index() >= 3580000 and pc.get_map_index() < 3590000 begin
			local pw = tonumber(input(''))
			if pw == nil then
				say_title("Zodyak Tap�na��:")
				say("")
				say("Bo� b�rakamazs�n.")
				return
			end

			zodiac_temple.new_floor(pw)
		end

		-- when 9012.chat."Zodyak Tap�na�� " begin
			-- if pc.get_level() < 20 then
				-- say_title(mob_name(npc.get_race()))
				-- say(locale.zodyak_yetersiz_level)
				-- return
			-- end

			-- pc.warp(333200, 1431000)
		-- end

		-------------------------------PORTAL---------------------------------------
		when 20439.chat."Zodyak Tap�na�� " with (party.is_party() and party.is_leader()) or (not party.is_party()) begin
			say_title(mob_name(npc.get_race()))
			say(locale.zodyak_portal_konusma)
			local s = select(locale.deviltower_enter, locale.deviltower_no_enter)
			if s == 1 then
				if party.is_party() then
					if zodiac_temples.CheckAnimasfer() == false then    
						return
					end

					zodiac_temples.DeleteAnimasfer()
				else
					if pc.get_animasfer() < 12 then
						say_title(mob_name(npc.get_race()))
						say("Yeterince animasfere sahip de�ilsin!")
						return
					end

					pc.start_animasfer()
				end

				zodiac_temple.starttemple(1)
			end
		end

		when 20440.chat."Zodyak Tap�na�� " with (party.is_party() and party.is_leader()) or (not party.is_party()) begin
			say_title(mob_name(npc.get_race()))
			say(locale.zodyak_portal_konusma)
			local s = select(locale.deviltower_enter, locale.deviltower_no_enter)
			if s == 1 then
				if party.is_party() then
					if zodiac_temples.CheckAnimasfer() == false then    
						return
					end

					zodiac_temples.DeleteAnimasfer()
				else
					if pc.get_animasfer() < 12 then
						say_title(mob_name(npc.get_race()))
						say("Yeterince animasfere sahip de�ilsin!")
						return
					end

					pc.start_animasfer()
				end

				zodiac_temple.starttemple(2)
			end
		end

		when 20441.chat."Zodyak Tap�na�� " with (party.is_party() and party.is_leader()) or (not party.is_party()) begin
			say_title(mob_name(npc.get_race()))
			say(locale.zodyak_portal_konusma)
			local s = select(locale.deviltower_enter, locale.deviltower_no_enter)
			if s == 1 then
				if party.is_party() then
					if zodiac_temples.CheckAnimasfer() == false then    
						return
					end

					zodiac_temples.DeleteAnimasfer()
				else
					if pc.get_animasfer() < 12 then
						say_title(mob_name(npc.get_race()))
						say("Yeterince animasfere sahip de�ilsin!")
						return
					end

					pc.start_animasfer()
				end

				zodiac_temple.starttemple(3)
			end
		end

		when 20442.chat."Zodyak Tap�na�� " with (party.is_party() and party.is_leader()) or (not party.is_party()) begin
			say_title(mob_name(npc.get_race()))
			say(locale.zodyak_portal_konusma)
			local s = select(locale.deviltower_enter, locale.deviltower_no_enter)
			if s == 1 then
				if party.is_party() then
					if zodiac_temples.CheckAnimasfer() == false then    
						return
					end

					zodiac_temples.DeleteAnimasfer()
				else
					if pc.get_animasfer() < 12 then
						say_title(mob_name(npc.get_race()))
						say("Yeterince animasfere sahip de�ilsin!")
						return
					end

					pc.start_animasfer()
				end

				zodiac_temple.starttemple(4)
			end
		end

		when 20443.chat."Zodyak Tap�na�� " with (party.is_party() and party.is_leader()) or (not party.is_party()) begin
			say_title(mob_name(npc.get_race()))
			say(locale.zodyak_portal_konusma)
			local s = select(locale.deviltower_enter, locale.deviltower_no_enter)
			if s == 1 then
				if party.is_party() then
					if zodiac_temples.CheckAnimasfer() == false then    
						return
					end

					zodiac_temples.DeleteAnimasfer()
				else
					if pc.get_animasfer() < 12 then
						say_title(mob_name(npc.get_race()))
						say("Yeterince animasfere sahip de�ilsin!")
						return
					end

					pc.start_animasfer()
				end

				zodiac_temple.starttemple(5)
			end
		end

		when 20444.chat."Zodyak Tap�na�� " with (party.is_party() and party.is_leader()) or (not party.is_party()) begin
			say_title(mob_name(npc.get_race()))
			say(locale.zodyak_portal_konusma)
			local s = select(locale.deviltower_enter, locale.deviltower_no_enter)
			if s == 1 then
				if party.is_party() then
					if zodiac_temples.CheckAnimasfer() == false then    
						return
					end

					zodiac_temples.DeleteAnimasfer()
				else
					if pc.get_animasfer() < 12 then
						say_title(mob_name(npc.get_race()))
						say("Yeterince animasfere sahip de�ilsin!")
						return
					end

					pc.start_animasfer()
				end

				zodiac_temple.starttemple(6)
			end
		end

		when 20445.chat."Zodyak Tap�na�� " with (party.is_party() and party.is_leader()) or (not party.is_party()) begin
			say_title(mob_name(npc.get_race()))
			say(locale.zodyak_portal_konusma)
			local s = select(locale.deviltower_enter, locale.deviltower_no_enter)
			if s == 1 then
				if party.is_party() then
					if zodiac_temples.CheckAnimasfer() == false then    
						return
					end

					zodiac_temples.DeleteAnimasfer()
				else
					if pc.get_animasfer() < 12 then
						say_title(mob_name(npc.get_race()))
						say("Yeterince animasfere sahip de�ilsin!")
						return
					end

					pc.start_animasfer()
				end

				zodiac_temple.starttemple(7)
			end
		end

		when 20446.chat."Zodyak Tap�na�� " with (party.is_party() and party.is_leader()) or (not party.is_party()) begin
			say_title(mob_name(npc.get_race()))
			say(locale.zodyak_portal_konusma)
			local s = select(locale.deviltower_enter, locale.deviltower_no_enter)
			if s == 1 then
				if party.is_party() then
					if zodiac_temples.CheckAnimasfer() == false then    
						return
					end

					zodiac_temples.DeleteAnimasfer()
				else
					if pc.get_animasfer() < 12 then
						say_title(mob_name(npc.get_race()))
						say("Yeterince animasfere sahip de�ilsin!")
						return
					end

					pc.start_animasfer()
				end

				zodiac_temple.starttemple(8)
			end
		end

		when 20447.chat."Zodyak Tap�na�� " with (party.is_party() and party.is_leader()) or (not party.is_party()) begin
			say_title(mob_name(npc.get_race()))
			say(locale.zodyak_portal_konusma)
			local s = select(locale.deviltower_enter, locale.deviltower_no_enter)
			if s == 1 then
				if party.is_party() then
					if zodiac_temples.CheckAnimasfer() == false then    
						return
					end

					zodiac_temples.DeleteAnimasfer()
				else
					if pc.get_animasfer() < 12 then
						say_title(mob_name(npc.get_race()))
						say("Yeterince animasfere sahip de�ilsin!")
						return
					end

					pc.start_animasfer()
				end

				zodiac_temple.starttemple(9)
			end
		end

		when 20448.chat."Zodyak Tap�na�� " with (party.is_party() and party.is_leader()) or (not party.is_party()) begin
			say_title(mob_name(npc.get_race()))
			say(locale.zodyak_portal_konusma)
			local s = select(locale.deviltower_enter, locale.deviltower_no_enter)
			if s == 1 then
				if party.is_party() then
					if zodiac_temples.CheckAnimasfer() == false then    
						return
					end

					zodiac_temples.DeleteAnimasfer()
				else
					if pc.get_animasfer() < 12 then
						say_title(mob_name(npc.get_race()))
						say("Yeterince animasfere sahip de�ilsin!")
						return
					end

					pc.start_animasfer()
				end

				zodiac_temple.starttemple(10)
			end
		end

		when 20449.chat."Zodyak Tap�na�� " with (party.is_party() and party.is_leader()) or (not party.is_party()) begin
			say_title(mob_name(npc.get_race()))
			say(locale.zodyak_portal_konusma)
			local s = select(locale.deviltower_enter, locale.deviltower_no_enter)
			if s == 1 then
				if party.is_party() then
					if zodiac_temples.CheckAnimasfer() == false then    
						return
					end

					zodiac_temples.DeleteAnimasfer()
				else
					if pc.get_animasfer() < 12 then
						say_title(mob_name(npc.get_race()))
						say("Yeterince animasfere sahip de�ilsin!")
						return
					end

					pc.start_animasfer()
				end

				zodiac_temple.starttemple(11)
			end
		end

		when 20450.chat."Zodyak Tap�na�� " with (party.is_party() and party.is_leader()) or (not party.is_party()) begin
			say_title(mob_name(npc.get_race()))
			say(locale.zodyak_portal_konusma)
			local s = select(locale.deviltower_enter, locale.deviltower_no_enter)
			if s == 1 then
				if party.is_party() then
					if zodiac_temples.CheckAnimasfer() == false then    
						return
					end

					zodiac_temples.DeleteAnimasfer()
				else
					if pc.get_animasfer() < 12 then
						say_title(mob_name(npc.get_race()))
						say("Yeterince animasfere sahip de�ilsin!")
						return
					end

					pc.start_animasfer()
				end

				zodiac_temple.starttemple(12)
			end
		end
		-------------------------------PORTAL---------------------------------------

		-- when login begin
			-- if pc.get_map_index() >= 3580000 and pc.get_map_index() < 3590000 then
				-- if zodiac_temple.getflag("floor") == 0 or zodiac_temple.getflag("floor") == 6 then
					-- zodiac_temple.startlogin()
				-- else
					-- if party.is_party() then
						-- pc.warp(333200, 1431000)
					-- else
						-- zodiac_temple.new_floor(zodiac_temple.getflag("floor"))
					-- end
				-- end
			-- end
		-- end
		----------------------------------------------------------------------------
	end
end
