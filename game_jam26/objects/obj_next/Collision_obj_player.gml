if (sprite_index == spr_portal_2_open) {
    // Se quiser ir para a próxima fase:
    if (room_exists(room_next(room))) {
        room_goto_next();
    } else {
        game_restart(); // Se for a última sala, aí sim reseta
    }
}