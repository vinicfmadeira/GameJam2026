// Centraliza o jumpscare na tela (GUI)
x_centro = display_get_gui_width() / 2;
y_centro = display_get_gui_height() / 2;

image_xscale = 0.5; // Começa pequeno para dar o efeito de vindo de longe
image_yscale = 0.5;

// Toca o som de susto //coloca ae o som doido 
//audio_play_sound(snd_rage, 10, false); 

// Alarme para reiniciar o jogo após o susto (ex: 1 segundo)
alarm[0] = 60;