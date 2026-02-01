/// @description HUD da Máscara reagindo ao Bloodlust do Inimigo

var _margin = 20;
var _gui_width = display_get_gui_width();
var _gui_y = _margin;
var _gui_x = _gui_width - _margin - 16; 

if (instance_exists(obj_player)) {
    
    if (obj_player.mask_active) {
        
        // 1. Pega o nível de sangue do bicho (se houver mais de um, pega o do mais próximo)
        var _nivel = 0;
        if (instance_exists(obj_enemy)) {
            var _inst = instance_nearest(obj_player.x, obj_player.y, obj_enemy);
            _nivel = _inst.nivel_bloodlust;
        }

        // 2. Define a velocidade do pulso baseada no Bloodlust (0 a 3)
        // Nivel 0: 0.005 (Calmo) | Nivel 3: 0.035 (Frenético)
        var _velocidade_pulso = 0.005 + (_nivel * 0.01);

        // 3. Cálculo da Pulsação
        var _wave = sin(current_time * _velocidade_pulso);
        // Aumenta a força da escala conforme o nível (fica maior quando tá bravo)
        var _forca_pulso = 0.1 + (_nivel * 0.1); 
        var _scale = 1 + (_wave * _forca_pulso); 
        
        // 4. Cor Reativa
        // Se estiver no nível 3 (máximo), a máscara brilha em vermelho
        var _cor = (_nivel >= 3) ? c_red : c_white;

        draw_sprite_ext(sprite_index, image_index, _gui_x, _gui_y, _scale, _scale, 0, _cor, 1);
        
    } else {
        // Máscara desativada
        draw_sprite_ext(sprite_index, image_index, _gui_x, _gui_y, 1, 1, 0, c_black, 0.4);
    }
}