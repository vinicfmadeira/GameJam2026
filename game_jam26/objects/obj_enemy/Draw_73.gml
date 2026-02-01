if (instance_exists(obj_player)) {
    
    // 1. Checa se o bicho está no escuro (fora do raio da lanterna)
    var _dist = distance_to_object(obj_player);
    var _raio_lanterna = 20; 

    // Se estiver longe da luz, desenha o olho brilhando POR CIMA de tudo
    if (_dist > _raio_lanterna) {
        gpu_set_blendmode(bm_add); // Efeito neon
        
        // Desenha apenas o sprite dos olhos
        // Como estamos no Draw End, ele ignora a surface de escuridão
        draw_sprite_ext(spr_monster_eyes, image_index, x, y, image_xscale, image_yscale, 0, c_aqua, 1);
        
        gpu_set_blendmode(bm_normal);
    }
	else{
		draw_self()	
	}
}