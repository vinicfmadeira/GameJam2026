// 1. Checa o botão primeiro
if (instance_exists(obj_b_floor)) {
    active = obj_b_floor.ativo;
}

// 2. Controla a animação baseada no estado 'active'
if (active) {
    if (!ativar) { // Se acabou de ativar
        sprite_index = spr_portal_2_open;
        ativar = true;
        // Som de portal abrindo? 
        // audio_play_sound(snd_rage, 1, false);
    }
} else {
    if (ativar) { // Se acabou de desativar
        sprite_index = spr_portal_2_closed;
        ativar = false;
    }
}