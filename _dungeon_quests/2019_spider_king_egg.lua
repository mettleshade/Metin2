--------------------------------------------------------------
--SiberDizayn OneHeda Server Files
--OneHeda Quests
--www.siberdizayn.com.tr
--------------------------------------------------------------
quest spiderKingEgg begin
	state start begin
		when login or levelup with pc.level >0 begin
			set_state(spiderKing)
		end
	end
	
	state spiderKing begin
		when 2095.kill begin
			local leader_vid = npc.get_leader_vid()
			
			local leader_attMul = npc.get_vid_attack_mul(leader_vid)
			local newAttMul = leader_attMul
			if leader_attMul >= 1 and leader_attMul < 1.11 then
				newAttMul = 1.111
			elseif leader_attMul < 1.25 then
				newAttMul = 1.251
			elseif leader_attMul < 1.43 then
				newAttMul = 1.431
			elseif leader_attMul < 1.67 then
				newAttMul = 1.671
			elseif leader_attMul < 2 then
				newAttMul = 2.1
			elseif leader_attMul < 2.5 then
				newAttMul = 2.51
			elseif leader_attMul < 3.33 then
				newAttMul = 3.331
			elseif leader_attMul < 5 then
				newAttMul = 5.1
			elseif leader_attMul < 10 then
				newAttMul = 10.1
			end
			 npc.set_vid_attack_mul(leader_vid, newAttMul)
			 
			local leader_damMul = npc.get_vid_damage_mul(leader_vid)
			local newDamMul = leader_damMul
			if leader_damMul >= 1 and leader_damMul < 1.11 then
				newDamMul = 1.111
			elseif leader_damMul < 1.25 then
				newDamMul = 1.251
			elseif leader_damMul < 1.43 then
				newDamMul = 1.431
			elseif leader_damMul < 1.67 then
				newDamMul = 1.671
			elseif leader_damMul < 2 then
				newDamMul = 2.1
			elseif leader_damMul < 2.5 then
				newDamMul = 2.51
			elseif leader_damMul < 3.33 then
				newDamMul = 3.331
			elseif leader_damMul < 5 then
				newDamMul = 5.1
			elseif leader_damMul < 10 then
				newDamMul = 10.1
			end
			 npc.set_vid_damage_mul(leader_vid, newDamMul)
			
		end
		
	end
end
