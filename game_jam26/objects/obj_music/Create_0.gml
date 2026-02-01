// Trilhas 
mus_fase1 = snd_fase1;
mus_rage = snd_rage;

// Inicia as duas músicas em loop
track_fase1 = audio_play_sound(mus_fase1, 10, true);
track_rage = audio_play_sound(mus_rage, 10, true);

// Começa com a calma no talo e a tensão muda
audio_sound_gain(track_fase1, 1, 0);
audio_sound_gain(track_rage, 0, 0);

// Timer para sons aleatórios
alarm[0] = 60; // 1 segundo (considerando 60fps)