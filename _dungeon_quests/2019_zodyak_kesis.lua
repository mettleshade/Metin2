quest zodiac_milbon begin
	state start begin
		when 20470.chat."Zodyak Tap�na��" begin
			local s = select("Uyan�� Prizmas� ","Tap�nak Kurallar� ","Define Sand�klar�n� Bozdur ","S�ralama Listesi ","K�ye Geri D�n ","Kapat ")
			if s == 1 then
				say("Hen�z aktif de�il!")
			elseif s == 2 then
				say("Hen�z aktif de�il!")
			elseif s == 3 then
				setskin(NOWINDOW)
				command("open_cz")
			elseif s == 4 then
				say("Hen�z aktif de�il!")
			elseif s == 5 then
				pc.go_home()
			elseif s == 6 then
				return
			end
		end
	end
end
