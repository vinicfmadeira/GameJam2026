// Verifica se o destino existe
if (instance_exists(meu_destino)) {
    
    // Só teleporta se o cooldown (pode_teleportar) estiver liberado
    if (pode_teleportar) {
        
        // Move o player para o destino
        other.x = meu_destino.x;
        other.y = meu_destino.y;
        
        // BLOQUEIA O RETORNO IMEDIATO (Evita ficar preso entre os dois)
        pode_teleportar = false;
        meu_destino.pode_teleportar = false;
        
        // Ativa o alarme nos dois portais para liberar o uso de novo em 1 seg
        alarm[0] = 60; 
        meu_destino.alarm[0] = 180;
        
        show_debug_message("Teleportado para: " + string(meu_destino));
    }
} else {
    show_debug_message("ERRO: Este portal não tem um destino definido na Room!");
}