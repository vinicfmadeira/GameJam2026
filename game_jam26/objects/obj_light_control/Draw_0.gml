// 1. Garante que a surface exista (surfaces somem da memória às vezes)
if (!surface_exists(surf)) {
    surf = surface_create(room_width, room_height);
}

// 2. Começa a desenhar na Surface
surface_set_target(surf);

// 3. Pinta tudo de preto (0.9 de alpha para não ser um breu 100% total)
draw_clear_alpha(c_black, 0.9);

// 4. Configura o modo de "SUBTRAÇÃO" (Furar o preto)
gpu_set_blendmode(bm_subtract);

// --- FURO DO PLAYER ---
if (instance_exists(obj_player)) {
    // O tamanho do furo pode mudar se a máscara estiver ativa
    var _scale = (obj_player.mask_active) ? 1.5 : 1.0;
    draw_sprite_ext(spr_vision_mask, 0, obj_player.x, obj_player.y, _scale, _scale, 0, c_white, 1);
}

// --- FURO DAS TOCHAS/LUZES ---
// O 'with' percorre todas as instâncias de obj_light_point de uma vez
//with (obj_light_point) {
//    if (active) {
//        draw_sprite_ext(spr_vision_mask, 0, x, y, scale, scale, 0, c_white, 1);
//    }
//}

// 5. Volta ao modo normal e fecha a surface
gpu_set_blendmode(bm_normal);
surface_reset_target();

// 6. Desenha a surface finalizada na tela
draw_surface(surf, 0, 0);