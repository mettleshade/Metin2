PyramidDungeonLIB = {};

PyramidDungeonLIB.Settings = function()
	if (PyramidDungeonLIB.data == nil) then
		PyramidDungeonLIB.data = {
			-- [[ Requirements, Items, Map info ]]
			["minimumLevel"] = 90, -- Minimum level for enter the dungeon
			["minimumPartyMembers"] = 1, -- Minimum count of players (If its party)
			["inside_index"] = 58, -- Dungeon index
			
			["outside_index"] = 57, --Index of map you go to after the dungeon is completed (or you failed)
			["outside_pos"] = {7313, 23104}, -- Coordinates of map you go to after the dungeon is completed (or you failed)
			
			["pyramid_ticket"] = 30799,
			["Items_2floor"] = {30800, 30801, 30802, 30803}, -- Pergamens needed in 2 floor to destroy 9332
			["Item_5floor"] = 30804, -- Bundle of wisdom - needed item to destroy anubis head
			["Item_6floor"] = 30805, -- Bundle of wisdom - needed item to destroy anubis head
			["Item_reward"] = 30806, -- Bundle of wisdom - needed item to destroy anubis head
			
			["insidePos_1f"] = {9765, 23653}, -- First floor coordinates
			["insidePos_2f"] = {9266, 22621}, -- Second floor coordinates
			["insidePos_3f"] = {9536, 22608}, -- Third floor  coordinates
			["insidePos_4f"] = {9990, 22647}, -- Fourth floor  coordinates
			["insidePos_5f"] = {9137, 23558}, -- Fifth floor  coordinates
			["insidePos_6f"] = {9759, 23655}, -- Final floor  coordinates
			
			["3f_stone_pos"] = {{587, 108}, {564, 108}, {564, 128}, {587, 128}, {564, 148}, {587, 148}, {564, 168}, {587, 168}}, --- Posotion of stones in third floor (pharaoh stones - 8475)
			
			["4f_boss_pos"] = {{1033, 137}, {1033, 169}, {1033, 211}}, --- Position of Ra bosses (4156) in the end of 4th floor
			
			["5f_npc_pos"] = {{166, 1044, 4}, {188, 1045, 6}, {188, 1016, 8}, {166, 1015, 2}}, --- Position of Anubis heads npcs in 5th floor
			
			["dungeon_cooldown"] = 7200, -- Time after player can enter the dungeon again (1 hour - 3600 sec)
			["dungeon_timer"] = 3600, -- Time whithin players have to finish the whole dungeon (1 hour - 3600 sec)
			 
			["time_until_destroy_first_stone"] = 240, -- If the first stone is not destroyed in that time, dungeon is closed (in seconds - 4 minutes)
			
			["time_until_destroy_second_stone"] = 1440, -- If the real pharaoh stone isnt destroyed in this time, the dungoen is closed (in seconds - 24 minutes)
			
			["time_to_destroy_final_stone"] = 300, -- If you can destroy final stone in this time (8475), you will continue directly to boss (in seconds - 5 minutes)
			
			-------
			----Final boss settings
			-------
			["time_until_pillar_is_spawned"] = 240, -- After this time (since boss is spawned), protecting pillar is spawned and you need to destroy it in defined time (in seconds - 4 minutes)
			["time_until_pillar_is_killed"] = 180, -- If the pillar is not destroyed in this time, dungeon has failed (in seconds - 3 minutes)
			
			--["outside_index"] = {1, 21, 41}, -- Index of maps, where are players teleported from the dungeon (Cities)
			--["outsidePos"] = {4693, 9642, 557, 1579, 9694, 2786}, -- Coords of the maps where are players teleported from the dungeon (Cities)	
						
			
			
			};
	end
	
	return PyramidDungeonLIB.data;
end


-- PyramidDungeonLIB.clearTimers = function()
	-- clear_server_timer("PyramidDungeon_full_timer", get_server_timer_arg())
	-- clear_server_timer("PyramidDungeon_6f_pillar_d", get_server_timer_arg())
	-- clear_server_timer("PyramidDungeon_6th_PillarSpawn", get_server_timer_arg())
-- end

PyramidDungeonLIB.isActive = function()
	local pMapIndex = pc.get_map_index(); local map_index = PyramidDungeonLIB.Settings()["inside_index"];
	
	return pc.in_dungeon() and pMapIndex >= map_index*10000 and pMapIndex < (map_index+1)*10000;
end

PyramidDungeonLIB.clearDungeon = function()
	if (pc.in_dungeon()) then
		--d.clear_regen();
		d.kill_all();
	end return false;
end


PyramidDungeonLIB.setOutCoords = function()
	local settings = PyramidDungeonLIB.Settings();
	
	d.set_warp_location(settings["inside_index"][1], settings["insidePos_1f"][1], settings["insidePos_1f"][2]);
end