quest dungeon_manager begin
	state start begin
		when login or enter begin
			dungeonLib.update()
		end

		when button begin
			cmdchat("GetDungeonInfo INPUT#1")
			local cmd = split(input(cmdchat("GetDungeonInfo CMD#")), "#")
			cmdchat("GetDungeonInfo INPUT#0")

			if cmd[1] == "WARP" then
				pc.warp(tonumber(cmd[2]) * 100, tonumber(cmd[3]) * 100)
			-- elseif cmd[1] == "RANKING" then
				-- dungeonLib.update_ranking(tonumber(cmd[2]), tonumber(cmd[3]))
			end
		end
	end
end