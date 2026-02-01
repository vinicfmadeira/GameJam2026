selected = false
audio_stop_all()

if (!audio_is_playing(snd_theme)) {
    audio_play_sound(snd_theme, 1, true);}
