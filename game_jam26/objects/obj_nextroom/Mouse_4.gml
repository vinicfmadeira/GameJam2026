if room == room_inst room_goto(room_history)
else if room == room_history room_goto(room_1)
else if room == room_credits room_goto(Menu)
else if room == room_game_over room_goto(Menu)