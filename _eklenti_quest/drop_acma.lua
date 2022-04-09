quest scp_event begin
	state start begin
		when letter with pc.is_gm() begin
			send_letter("Drop Ayarlari")
		end
		when info or button with pc.is_gm() begin
			say_title("GM Drop Ayarlari - Giris")
			say("")
			say("Merhabalar "..pc.get_name())
			say("Bu paneli kullanarak Event Ayarlarini duzenleyebilirsin.")
			say_reward("Mevcut Ayarlar:")
			say("Event Orani: "..game.get_event_flag("scp_event_oran"))
			say("")
			main_sec=select("Drop Deðerlerini Degistir","Kapat")
			if main_sec==2 then
				syschat("<GM: Drop Ayarlari> Basariyla Cikis Yapildi.")
				send_letter("Drop Ayarlari")
				return
			elseif main_sec==1 then
				say_title("GM Drop Ayarlari - Drop Orani Girisi")
				say("")
				say("Ýstediðiniz drop oranini rakamsal olarak giriniz.")
				say("")
				get_oran=tonumber(input())
				if get_oran==0 or get_oran=="" or get_oran==nil or get_oran==0 then
					syschat("<GM: Drop Ayarlari> Geçersiz giris, islem iptal edildi.")
					send_letter("Drop Ayarlari")
					return
				end
				game.set_event_flag("scp_event_oran", get_oran)
				syschat("<GM: Drop Ayarlari> Ýslem basarili: Yeni Event Deðeri: "..get_oran)
				notice_all("<Event> Tum oranlar 1 hafta sure ile açilmistir.")
				__give_empire_priv(0, 1, get_oran, 60*60*168) --  Ýtem Drop
				__give_empire_priv(0, 2, get_oran, 60*60*168) --  Yang Drop
				__give_empire_priv(0, 4, get_oran, 60*60*168) --  EXP Drop
				send_letter("Drop Ayarlari")
			end
		end
	end -- Sate End
end -- Quest End