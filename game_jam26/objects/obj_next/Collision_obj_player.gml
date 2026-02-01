if (sprite_index == spr_portal_2_open) {
    // Se quiser ir para a próxima fase:
	
	//area pra ir pro end ja que ainda nao tem mais faze
	if room == room_2{
		room_goto(room_end)	
	}
	
    if (room_exists(room_next(room))) {
        room_goto_next();
    } else {
        room_goto(room_end); // Se for a última sala, aí sim reseta
    }
}