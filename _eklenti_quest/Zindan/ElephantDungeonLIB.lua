ElephantDungeonLIB = {};

ElephantDungeonLIB.Settings = function()
	if (ElephantDungeonLIB.data == nil) then
		ElephantDungeonLIB.data = {
			-- [[ Requirements, Items, Map info ]]
			["minimumLevel"] = 115, -- Minimum level for enter the dungeon
			-- ["minimumPartyMembers"] = 2, -- Minimum count of players (If its party)
			["elephantdungeon_ticket"] = 30794,
			
			["inside_index"] = 59, -- Dungeon index
			["insidePos"] = {5222, 22919}, -- Dungeon coords
			
			["outside_index"] = {1, 3, 5}, -- Index of maps, where are players teleported from the dungeon (Cities)
			["outsidePos"] = {4693, 9642, 557, 1579, 9694, 2786}, -- Coords of the maps where are players teleported from the dungeon (Cities)	
			
			["dungeon_cooldown"] = 0, -- Time after player can enter the dungeon again (1 hour - 3600 sec)
			["dungeon_timer"] = 3600, -- Time whithin players have to finish the whole dungeon (1 hour - 3600 sec)
			
			["exit_timer"] = 120, -- Time, after you will be teleported out of dungeon after you have killed the final boss (in seconds)
			["time_to_beat_first_boss"] = 300, -- Time, kill all 4 bosses (4108) in the on of first stage (in seconds)
			
			["key"] = 30795, -- Gold key which opens door in stage 1
			["statue_piece"] = 30796, -- Piece of statue, you build the statue with this item
			["key2"] = 30797, -- Piece of statue, you build the statue with this item

			["statue1"] = 9326, -- ID of first built statue in Stage 1
			["statue2"] = 9327, -- ID of second built statue in Stage 1
			["statue3"] = 9328, -- ID of third built statue in Stage 1
			["statue4"] = 9329, -- ID of fourth, final built statue in Stage 1
			["statues_pos"] = {356, 502, 5}, -- Coordinations of all built statues in Stage 1
			
			----
			---Final boss settings
			----
			["final_boss"] = 4110, -- ID of final boss
			["final_boss_pos"] = {355, 692}, -- Coordinations are set in the middle of the boss room
			["final_boss_defense_high"] = 99999, -- New defense value after the stones are spawned (Should be as high as possible)
			["final_boss_defense_basic"] = 300, -- Basic defense of the boss, should be the same as def value in mob_proto
			["time_after_boss_high_defense"] = 30, -- Time, after the stones are spawned and the boss has high defense value (in seconds!)
			["special_damage_timer_effect"] = 60, -- Time, after the stones are spawned and the boss has high defense value (in seconds!)			
			["special_damage_timer_duration"] = 300, -- Time, after the stones are spawned and the boss has high defense value (in seconds!)
			
			};
	end
	
	return ElephantDungeonLIB.data;
end


ElephantDungeonLIB.clearTimers = function()
	clear_server_timer("ElephantDungeon_SpecialItemDuration", get_server_timer_arg())
	clear_server_timer("ElephantDungeon_full_timer", get_server_timer_arg())
	clear_server_timer("ElephantDungeon_GaneshaDefence", get_server_timer_arg())
	clear_server_timer("ElephantDungeon_1stBosses_counter", get_server_timer_arg())
end

ElephantDungeonLIB.isActive = function()
	local pMapIndex = pc.get_map_index(); local map_index = ElephantDungeonLIB.Settings()["inside_index"];
	
	return pc.in_dungeon() and pMapIndex >= map_index*10000 and pMapIndex < (map_index+1)*10000;
end

ElephantDungeonLIB.clearDungeon = function()
	if (pc.in_dungeon()) then
		d.clear_regen();
		d.kill_all();
	end return false;
end

ElephantDungeonLIB.checkEnter = function()
	local settings = ElephantDungeonLIB.Settings();
	say_size(350,350)
	addimage(25, 10, "elephant_bg1.tga"); addimage(225, 200, "elephant_guard.tga")
	say("[ENTER][ENTER]")
	say_title(mob_name(9321))
	
	if party.is_party() then
		say_reward("Bu zindana girmek istiyorsanýz [ENTER] bir grubun parçasý olamazsýnýz.")
		return false;
	else  --- if its solo
	
		if (pc.get_channel_id() == 2 or pc.get_channel_id() == 3 or pc.get_channel_id() == 4 or pc.get_channel_id() == 5 or pc.get_channel_id() == 6) then
			say_center("Sadece 1. kanaldan giriþ yapabilirsin.")
			return
		end
		if ((get_global_time() - pc.getf("elephant_dungeon","exit_elephant_dungeon_time")) < settings["dungeon_cooldown"]) then
		
			local remaining_wait_time = (pc.getf("elephant_dungeon","exit_elephant_dungeon_time") - get_global_time() + settings["dungeon_cooldown"])
			say("Zindana tekrar girebilmek için beklemelisin.")
			say_reward("Zindana tekrar girebilirsin: "..get_time_remaining(remaining_wait_time)..'[ENTER]')
			return
		end

		if (pc.get_level() < settings["minimumLevel"]) then
			say(string.format("Giriþ Ýçin Minimum Seviye %d.", settings["minimumLevel"]))
			return false;
		end
		
		if (game.get_event_flag("ganesha_tapinagi") == 0) then
			say("Þuanlýk giriþler kapatýldý, tekrar açýldýgýndan duyuru yapýlacaktýr.")
			return false;
		end
		
		if (pc.count_item(settings["elephantdungeon_ticket"]) < 1) then
			say("Ganesha Tapýnaðýna girmek istiyorsan[ENTER]sende olmasý gerekir:")
			say_item(""..item_name(settings["elephantdungeon_ticket"]).."", settings["elephantdungeon_ticket"], "")
			return false;
		end
	end
	
	return true;
end

ElephantDungeonLIB.CreateDungeon = function()
	local settings = ElephantDungeonLIB.Settings();
	
	pc.remove_item(settings["elephantdungeon_ticket"], 1);
	pc.setqf("ganesha_giris_aktif", 1)
	return d.new_jump(settings["inside_index"], settings["insidePos"][1]*100, settings["insidePos"][2]*100); 
end

ElephantDungeonLIB.setOutCoords = function()
	local empire = pc.get_empire()
	local settings = ElephantDungeonLIB.Settings();
	
	if empire == 1 then
		d.set_warp_location(settings["outside_index"][1], settings["outsidePos"][1], settings["outsidePos"][2]);
	elseif empire == 2 then
		d.set_warp_location(settings["outside_index"][2], settings["outsidePos"][3], settings["outsidePos"][4]);
	elseif empire == 3 then
		d.set_warp_location(settings["outside_index"][3], settings["outsidePos"][5], settings["outsidePos"][6]);
	end
end