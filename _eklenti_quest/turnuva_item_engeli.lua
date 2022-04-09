quest turnuva_item_engeli begin
	state start begin
		when 71018.use begin
			say_title("Upss..")
			pc.setqf("turnuva_giris_engeli", 1)
			say("Ws turnuvasýnda bu itemi kullanmak yasak.")
			say_reward("Kullandýðýn için dýþarý atýlýyorsun.")
			say("")
			say_reward("Tekrar giriþin engellendi.")
			wait()
			warp_to_village()
		end
		when 71020.use with pc.get_map_index() == 500 begin
			say_title("Upss..")
			pc.setqf("turnuva_giris_engeli", 1)
			say("Ws turnuvasýnda bu itemi kullanmak yasak.")
			say_reward("Kullandýðýn için dýþarý atýlýyorsun.")
			say("")
			say_reward("Tekrar giriþin engellendi.")
			wait()
			warp_to_village()
		end
	end
end