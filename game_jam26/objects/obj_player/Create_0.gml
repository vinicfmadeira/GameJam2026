// Velocidades base
walk_speed = 1.5;
h_spd = 0;
v_spd = 0;

// Estado da Máscara
mask_active = false;

// Configuração de Sprites (Ajuste os nomes conforme o projeto)
// 0 = Direita, 1 = Cima, 2 = Esquerda, 3 = Baixo
sprites_idle = [Mother_Idle, Mother_Idle_Up, Mother_Idle, Mother_Idle_Down];
sprites_walk = [Mother_Walking, Mother_Walking_Up, Mother_Walking, Mother_Walking_Down];

face = 3; // Começa olhando para baixo