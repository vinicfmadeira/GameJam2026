/// Evento Draw GUI do obj_player

// 1. Verifica as distâncias (mesma lógica do duelo de distância)
var _dist_parede = 9999;
var _dist_botao = 9999;
var _inst_parede = instance_nearest(x, y, obj_wall_alt);
var _inst_botao = instance_nearest(x, y, obj_button);

if (_inst_parede != noone) _dist_parede = distance_to_object(_inst_parede);
if (_inst_botao != noone) _dist_botao = distance_to_object(_inst_botao);

var _interativo = (_dist_parede < _dist_botao) ? _inst_parede : _inst_botao;
var _menor_distancia = min(_dist_parede, _dist_botao);

// 2. Se estiver perto, sem máscara e alvo não ativo
if (_interativo != noone && _menor_distancia < 10 && !mask_active) {
    
    // --- O PULO DO GATO: Converter posição do mundo para a tela ---
    // Isso faz o ícone seguir o player mesmo na camada GUI
    var _gui_x = (x - camera_get_view_x(view_camera[0])) * (display_get_gui_width() / camera_get_view_width(view_camera[0]));
    var _gui_y = (y - camera_get_view_y(view_camera[0])) * (display_get_gui_height() / camera_get_view_height(view_camera[0]));
    
    var _hover = sin(current_time * 0.007) * 3;
    
    // Desenha o ícone na GUI (Sempre estará por cima da luz/escuridão)
    draw_sprite_ext(spr_gui_mask, 0, _gui_x, _gui_y - 40 + _hover, 0.5, 0.5, 0, c_white, 1);
    
    gpu_set_blendmode(bm_add);
    draw_sprite_ext(spr_gui_mask, 0, _gui_x, _gui_y - 40 + _hover, 0.6, 0.6, 0, c_white, 0.3);
    gpu_set_blendmode(bm_normal);
}