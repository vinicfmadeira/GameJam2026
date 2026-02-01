// Verifica se o Player OU o Inimigo estão colidindo com o botão
var _player_em_cima = place_meeting(x, y, obj_player);
var _inimigo_em_cima = place_meeting(x, y, obj_enemy);

if (_player_em_cima or _inimigo_em_cima) {
    // Alguém pisou!
    if (sprite_index != sprite_down) {
        sprite_index = sprite_down;
        ativo = true;
        
        // Efeito sonoro (só toca uma vez quando desce) tem que fazer fica massa
        // audio_play_sound(snd_click, 1, false);
        
    }
} else {
    // Ninguém em cima
    if (sprite_index != sprite_up) {
        sprite_index = sprite_up;
        ativo = false;
    }
}