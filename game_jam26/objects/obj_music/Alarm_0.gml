// Chance de 10% de tocar um som (0.1)

if (random(1) < 0.1) {
    // Escolhe um som aleatório entre as suas opções
    var _som = choose(snd_voices, snd_grassteps);
    
    // Toca o som com pitch (velocidade) variada para não cansar o ouvido
    var _inst = audio_play_sound(_som, 5, false);
    audio_sound_pitch(_inst, random_range(0.8, 1.2));
    audio_sound_gain(_inst, random_range(0.3, 0.6), 0);
}

// Reseta o alarme para daqui a 1 segundo
alarm[0] = 20;
