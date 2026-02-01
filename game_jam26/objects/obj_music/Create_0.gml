audio_stop_all()
// Trilhas 
mus_fase1 = snd_fase1;
mus_rage = snd_rage;
mus_heart = snd_heart
// Inicia as duas músicas em loop
track_fase1 = audio_play_sound(mus_fase1, 10, true);
//area do rage
track_rage = audio_play_sound(mus_rage, 10, true);
track_heart = audio_play_sound(mus_heart, 10, true);

// Começa com a calma no talo e a tensão muda
audio_sound_gain(track_fase1, 0.8, 0);
audio_sound_gain(track_rage, 0, 0);

// Timer para sons aleatórios
alarm[0] = 60; // 1 segundo (considerando 60fps)
