

/// ===============================
/// DETECTAR PERSEGUIÇÃO
/// ===============================
if obj_player.mask_active {

	if (distance_to_object(obj_player) < raio_perseguicao) {
	    perseguindo = true;
	} else {
	    perseguindo = false;
	}

	/// ===============================
	/// BLOODLUST (TEMPO)
	/// ===============================
	if (perseguindo) {
	    tempo_perseguicao += delta_time / 1000000;
	} else {
	    tempo_perseguicao = 0;
	    nivel_bloodlust = 0;
	    vel_atual = vel_base;
	}

	/// ===============================
	/// DEFINIR NÍVEL DO BLOODLUST
	/// ===============================
	if (tempo_perseguicao >= tempo_bl3) {
	    nivel_bloodlust = 3;
	}
	else if (tempo_perseguicao >= tempo_bl2) {
	    nivel_bloodlust = 2;
	}
	else if (tempo_perseguicao >= tempo_bl1) {
	    nivel_bloodlust = 1;
	}
	else {
	    nivel_bloodlust = 0;
	}

	/// ===============================
	/// APLICAR VELOCIDADE
	/// ===============================
	vel_atual = vel_base * (1 + 0.1 * nivel_bloodlust);


	/// ===============================
	/// MOVIMENTO 4 DIREÇÕES (SEM COLISÃO)
	/// ===============================
	if (perseguindo) {

	    var dx = obj_player.x - x;
	    var dy = obj_player.y - y;

	    // PRIORIDADE: eixo com maior distância
	    if (abs(dx) > abs(dy)) {

	        // HORIZONTAL
	        if (dx > 0) {
	            x += vel_atual;
	        }
	        else if (dx < 0) {
	            x -= vel_atual;
	        }

	    } else {

	        // VERTICAL
	        if (dy > 0) {
	            y += vel_atual;
	        }
	        else if (dy < 0) {
	            y -= vel_atual;
	        }
	    }
	}
} else{
	tempo_perseguicao = 0;
	nivel_bloodlust = 0;
	vel_atual = vel_base;	
}
