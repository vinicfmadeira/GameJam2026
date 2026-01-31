// Verifica se o player existe para evitar erro
if (instance_exists(target)) {
    
    // Calcula onde o canto superior esquerdo da câmera deve estar 
    // para que o player fique exatamente no centro
    var _target_x = target.x - (cam_width / 2);
    var _target_y = target.y - (cam_height / 2);
    
    // Pega a posição atual da câmera no mundo
    var _current_x = camera_get_view_x(view_camera[0]);
    var _current_y = camera_get_view_y(view_camera[0]);
    
    // Interpolação Linear (LERP) para suavizar o movimento
    var _new_x = lerp(_current_x, _target_x, smoothing);
    var _new_y = lerp(_current_y, _target_y, smoothing);
    
    // CLAMP: Impede que a câmera mostre o que está fora da Room (o vazio preto)
    _new_x = clamp(_new_x, 0, room_width - cam_width);
    _new_y = clamp(_new_y, 0, room_height - cam_height);
    
    // Aplica a nova posição à câmera do Viewport 0
    camera_set_view_pos(view_camera[0], _new_x, _new_y);
}