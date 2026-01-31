if (instance_exists(target)) {
    // Calcula a posição desejada (centro da tela no player)
    var _target_x = target.x - (cam_width / 2);
    var _target_y = target.y - (cam_height / 2);
    
    // Suaviza o movimento
    var _cam_x = lerp(camera_get_view_x(view_camera[0]), _target_x, smoothing);
    var _cam_y = lerp(camera_get_view_y(view_camera[0]), _target_y, smoothing);
    
    // Previne a câmera de sair das bordas da fase (Room)
    _cam_x = clamp(_cam_x, 0, room_width - cam_width);
    _cam_y = clamp(_cam_y, 0, room_height - cam_height);
    
    // Aplica a nova posição
    camera_set_view_pos(view_camera[0], _cam_x, _cam_y);
}