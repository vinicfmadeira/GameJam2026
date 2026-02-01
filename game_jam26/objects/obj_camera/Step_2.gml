if (instance_exists(target)) {
    // 1. Posição Alvo (Seguir Player)
    var _target_x = target.x - (cam_width / 2);
    var _target_y = target.y - (cam_height / 2);
    
    // 2. Posição Atual
    var _current_x = camera_get_view_x(view_camera[0]);
    var _current_y = camera_get_view_y(view_camera[0]);
    
    // 3. Suavização (Lerp)
    var _new_x = lerp(_current_x, _target_x, smoothing);
    var _new_y = lerp(_current_y, _target_y, smoothing);
    
    // 4. LÓGICA DO TREMOR COM TEMPO
    if (shake_timer > 0) {
        // Reduz o timer a cada frame
        shake_timer -= 1;
        
        // Aplica o tremor aleatório
        _new_x += random_range(-shake_remain, shake_remain);
        _new_y += random_range(-shake_remain, shake_remain);
        
        // Reduz gradualmente a intensidade ao longo do tempo (suave)
        shake_remain = max(0, shake_remain - (shake_magnitude / shake_timer));
    } else {
        shake_remain = 0;
    }
    
    // 5. CLAMP (Não mostrar fora da Room)
    _new_x = clamp(_new_x, 0, room_width - cam_width);
    _new_y = clamp(_new_y, 0, room_height - cam_height);
    
    // 6. Aplicar na Câmera
    camera_set_view_pos(view_camera[0], _new_x, _new_y);
}