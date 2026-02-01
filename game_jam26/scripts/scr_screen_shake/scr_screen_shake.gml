/// @function screen_shake(magnitude, frames)
/// magnitude Força do tremor (ex: 4 para leve, 15 para forte)
/// frames Duração em frames (ex: 30 para meio segundo, 60 para um segundo)
function screen_shake(_magnitude, _frames){
    with (obj_camera) {
        // Mudamos de ">" para ">=" para aceitar atualizações constantes do mesmo valor
        if (_magnitude >= shake_remain) {
            shake_magnitude = _magnitude;
            shake_remain = _magnitude;
            shake_timer = _frames;
        }
    }
}