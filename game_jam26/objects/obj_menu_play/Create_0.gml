selected = false
if (!audio_is_playing(snd_theme)) {
    
    audio_stop_all(); // AGORA sim, paramos os sons antigos (batalha, menu, etc)
    audio_play_sound(snd_theme, 1, true); // E damos play na nova
}