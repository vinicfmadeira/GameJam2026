// 1. Inputs (Pegando as teclas)
var _key_up = keyboard_check(ord("W")) || keyboard_check(vk_up);
var _key_down = keyboard_check(ord("S")) || keyboard_check(vk_down);
var _key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
var _key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);

// 2. Cálculo de Direção
var _input_x = _key_right - _key_left;
var _input_y = _key_down - _key_up;

// 3. Normalização (Pra não andar mais rápido na diagonal)
if (_input_x != 0 || _input_y != 0) {
    var _dir = point_direction(0, 0, _input_x, _input_y);
    
    // Se a máscara de Depressão estiver ativa, a gente reduz a velocidade aqui futuramente
    var _current_speed = walk_speed; 
    
    h_spd = lengthdir_x(_current_speed, _dir);
    v_spd = lengthdir_y(_current_speed, _dir);
} else {
    h_spd = 0;
    v_spd = 0;
}

// 4. Movimento com Colisão (A função mágica do GM2)
// 'obj_wall' deve ser o objeto pai de todas as suas paredes
move_and_collide(h_spd, v_spd, obj_wall);

// area da máscara
if keyboard_check_pressed(ord("K")) mask_active = !mask_active

if (mask_active and !instance_exists(obj_enemy)) {
    // 1. Escolhe um lado: 0=Esquerda, 1=Direita, 2=Cima, 3=Baixo
    var side = irandom(3);
    var spawn_x, spawn_y;
    var margin = 20; // Distância fora da tela para ele não "dar pop"
    
    switch(side) {
        case 0: // Esquerda
            spawn_x = x - (160 + margin);
            spawn_y = y + irandom_range(-90, 90);
            break;
        case 1: // Direita
            spawn_x = x + (160 + margin);
            spawn_y = y + irandom_range(-90, 90);
            break;
        case 2: // Cima
            spawn_x = x + irandom_range(-160, 160);
            spawn_y = y - (90 + margin);
            break;
        case 3: // Baixo
            spawn_x = x + irandom_range(-160, 160);
            spawn_y = y + (90 + margin);
            break;
    }
    
    instance_create_layer(spawn_x, spawn_y, "Instances", obj_enemy);
}

if !mask_active {
    instance_destroy(obj_enemy);
}