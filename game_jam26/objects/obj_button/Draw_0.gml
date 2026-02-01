/// Evento Draw

// 1. Desenha o botão normalmente
draw_self();

#region area para fazer desenhar uma mascara proximo dele
/*
// 2. Verifica se o player está perto e SEM a máscara
var _dist = distance_to_object(obj_player);

if (_dist < 32 && !obj_player.mask_active && !ativo) {
    
    // Faz o ícone flutuar para cima e para baixo (efeito bobbing)
    var _hover = sin(current_time * 0.005) * 4;
    
    // Desenha o sprite da máscara (ou um ícone de "!") acima do botão
    // Ajuste o -20 para a altura que preferir
    draw_sprite_ext(spr_gui_mask, 0, x, y - 20 + _hover, 0.3, 0.3, 0, c_white, 1);
}
*/
#endregion