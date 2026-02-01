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

sprites_idle_mask = [Mother_Mask_Idle, Mother_Mask_Idle_Up, Mother_Mask_Idle, Mother_Mask_Idle_Down];
sprites_walk_mask = [Mother_Mask_Walking, Mother_Mask_Walking_Up, Mother_Mask_Walking, Mother_Mask_Walking_Down];



face = 3; // Começa olhando para baixo

if !instance_exists(obj_camera) instance_create_layer(x,y,"Controladores",obj_camera)
if !instance_exists(obj_light_control) instance_create_layer(x,y,"Controladores",obj_light_control)
if !instance_exists(obj_mask) instance_create_layer(x,y,"Controladores",obj_mask)
if !instance_exists(obj_music) instance_create_layer(x,y,"Controladores",obj_music)
