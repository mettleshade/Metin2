quest mapindex begin
	state start begin
		when login begin
			local map = pc.get_map_index()
			if pc.is_gm() then
				syschat("Map Index: "..map)
			end
		end
	end
end