if (instance_exists(obj_player)) {
    if (obj_player.mask_active) {
        // Modo Máscara: Sobe a tensão, desce a calma
        audio_sound_gain(track_rage, 0.8, 500); // 500ms de transição
        audio_sound_gain(track_fase1, 0, 500);
    } else {
        // Modo Normal: Sobe a calma, desce a tensão
        audio_sound_gain(track_rage, 0, 500);
        audio_sound_gain(track_fase1, 1, 500);
    }
}