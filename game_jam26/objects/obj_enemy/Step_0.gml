/// ===============================
/// DETECTAR PERSEGUIÇÃO
/// ===============================
if (obj_player.mask_active) {

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
    } else {
        sprite_index = spr_monster_stop; // Sprite quando não está perseguindo
        tempo_perseguicao = 0;
        nivel_bloodlust = 0;
        vel_atual = vel_base;
    }

    /// ===============================
    /// DEFINIR NÍVEL DO BLOODLUST
    /// ===============================
    if (tempo_perseguicao >= tempo_bl3) nivel_bloodlust = 3;
    else if (tempo_perseguicao >= tempo_bl2) nivel_bloodlust = 2;
    else if (tempo_perseguicao >= tempo_bl1) nivel_bloodlust = 1;
    else nivel_bloodlust = 0;

    vel_atual = vel_base * (1 + 0.1 * nivel_bloodlust);

    /// ===============================
    /// MOVIMENTO E ANIMAÇÃO
    /// ===============================
    if (perseguindo) {
        var dx = obj_player.x - x;
        var dy = obj_player.y - y;

        // PRIORIDADE: eixo com maior distância
        if (abs(dx) > abs(dy)) {
            // MOVIMENTO HORIZONTAL
            sprite_index = spr_monster_side;
            if (dx > 0) {
                x += vel_atual;
                image_xscale = -1; // Olhando para a direita
            } else {
                x -= vel_atual;
                image_xscale = 1; // Olhando para a esquerda (Inverte o sprite side)
            }
        } else {
            // MOVIMENTO VERTICAL
            if (dy > 0) {
                x += 0; // Trava o X para não deslizar
                y += vel_atual;
                sprite_index = spr_monster_down;
            } else {
                x += 0;
                y -= vel_atual;
                sprite_index = spr_monster_up;
            }
            image_xscale = 1; // Reseta o flip para não ficar invertido em cima/baixo
        }
    }
} else {
    // MÁSCARA DESATIVADA: O bicho "para de funfar"
    sprite_index = spr_monster_stop;
    tempo_perseguicao = 0;
    nivel_bloodlust = 0;
    vel_atual = vel_base;
    // Opcional: x = -9999; se quiser que ele suma mecanicamente como falamos
}