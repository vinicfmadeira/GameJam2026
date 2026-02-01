// --- 1. INPUTS ---
var _key_up    = keyboard_check(ord("W")) || keyboard_check(vk_up);
var _key_down  = keyboard_check(ord("S")) || keyboard_check(vk_down);
var _key_left  = keyboard_check(ord("A")) || keyboard_check(vk_left);
var _key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
key_interact = keyboard_check(ord("J")) //adicionar alguma tecla do numpad pra isso tbm


var _layer_id = layer_get_id("Paredespw")
// --- 2. MOVIMENTAÇÃO E DIREÇÃO (FACE) ---
h_spd = 0;
v_spd = 0;
var _moving = true; // Assumimos que está movendo, a menos que caia no 'else'

if (_key_right) {
    h_spd = walk_speed;
	image_xscale = 1

    face = 0;
} else if (_key_left) {
    h_spd = -walk_speed;
	image_xscale = -1

    face = 2;
} else if (_key_up) {
    v_spd = -walk_speed;
    face = 1;
} else if (_key_down) {
    v_spd = walk_speed;
    face = 3;
} else {
    _moving = false; // Se não apertou nada, parado
}

// --- 3. ANIMAÇÃO (AQUI ESTÁ A CORREÇÃO) ---
// O 'face' não muda se _moving for false, mantendo a última direção
if (_moving) {
	if !mask_active sprite_index = sprites_walk[face];
	else sprite_index = sprites_walk_mask[face]
} else {
	if !mask_active sprite_index = sprites_idle[face]
    else sprite_index = sprites_idle_mask[face]
	
}

// --- 4. COLISÃO ---
move_and_collide(h_spd, v_spd, obj_wall);

// --- 5. SISTEMA DE MÁSCARA ---
if (keyboard_check_pressed(ord("K"))) {
    mask_active = !mask_active;
	// avisa as paredes
    

}

// --- 6. SPAWN DO INIMIGO -- e voltando com as colisao da parede que some :)
if (mask_active) {
    if (!instance_exists(obj_enemy)) {
        var side = irandom(3);
        var spawn_x, spawn_y;
        var margin = 30; 
        
        switch(side) {
            case 0: spawn_x = x - (160 + margin); spawn_y = y + irandom_range(-90, 90); break;
            case 1: spawn_x = x + (160 + margin); spawn_y = y + irandom_range(-90, 90); break;
            case 2: spawn_x = x + irandom_range(-160, 160); spawn_y = y - (90 + margin); break;
            case 3: spawn_x = x + irandom_range(-160, 160); spawn_y = y + (90 + margin); break;
        }
        instance_create_layer(spawn_x, spawn_y, "Instances", obj_enemy);
    }
	instance_deactivate_layer(_layer_id)

}

else{
	instance_activate_layer(_layer_id)
}

