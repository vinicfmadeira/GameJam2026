/// ===============================
/// CONTROLE DE MÁSCARA E ATIVAÇÃO
/// ===============================
if (obj_player.mask_active) {

    // 1. Detectar Perseguição
    if (distance_to_object(obj_player) < raio_perseguicao) {
        perseguindo = true;
    } else {
        perseguindo = false;
    }

    /// ===============================
    /// BLOODLUST E ESTADO PARADO
    /// ===============================
    if (perseguindo) {
        tempo_perseguicao += delta_time / 1000000;
        
        // Definir Nível do Bloodlust
        if (tempo_perseguicao >= tempo_bl3) nivel_bloodlust = 3;
        else if (tempo_perseguicao >= tempo_bl2) nivel_bloodlust = 2;
        else if (tempo_perseguicao >= tempo_bl1) nivel_bloodlust = 1;
        else nivel_bloodlust = 0;
        
    } else {
        // Se parou de perseguir, reseta tudo e fica em IDLE
        sprite_index = spr_monster_stop;
        tempo_perseguicao = 0;
        nivel_bloodlust = 0;
        vel_atual = vel_base;
    }

    // Calcula velocidade atual baseada no nível de sangue nos olhos
    vel_atual = vel_base * (1 + 0.1 * nivel_bloodlust);

    /// ===============================
    /// MOVIMENTO E ANIMAÇÃO (SEM BUG)
    /// ===============================
    if (perseguindo) {
		screen_shake(0.5, 5); //chama o tremor
		
		
        var dx = obj_player.x - x;
        var dy = obj_player.y - y;
        
        // Margem para evitar que o sprite fique "vibrando" em diagonais
        var margin = 4; 

        // Caso 1: Movimento claramente Horizontal
        if (abs(dx) > abs(dy) + margin) {
            sprite_index = spr_monster_side;
            if (dx > 0) {
                x += vel_atual;
                image_xscale = -1; // Direita
            } else {
                x -= vel_atual;
                image_xscale = 1;  // Esquerda
            }
        } 
        // Caso 2: Movimento claramente Vertical
        else if (abs(dy) > abs(dx) + margin) {
            image_xscale = 1; 
            if (dy > 0) {
                y += vel_atual;
                sprite_index = spr_monster_down;
            } else {
                y -= vel_atual;
                sprite_index = spr_monster_up;
            }
        }
        // Caso 3: Diagonal ou muito perto (Mantém o sprite anterior mas continua andando)
        else {
            if (abs(dx) > abs(dy)) {
                x += (dx > 0) ? vel_atual : -vel_atual;
                // Só atualiza sprite se necessário
                if (sprite_index == spr_monster_stop) sprite_index = spr_monster_side;
            } else {
                y += (dy > 0) ? vel_atual : -vel_atual;
            }
        }
    }
} else {
    /// ===============================
    /// MÁSCARA DESATIVADA (O BICHO PARA)
    /// ===============================
    sprite_index = spr_monster_stop;
    tempo_perseguicao = 0;
    nivel_bloodlust = 0;
    vel_atual = vel_base;
    
    // Se quiser que ele suma quando a máscara tá off, descomente a linha abaixo:
    // visible = false; 
}