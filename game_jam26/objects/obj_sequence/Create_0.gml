//inicia a sequencia
sequencia_actual = 0
// Evento Create do obj_sequencia
x = room_width / 2
y = room_height / 2



layer_animacoes = layer_get_id("Animacoes"); // Nome da camada "animacoes"

switch (sequencia_actual){
	case 0:	//abertura do jogo
		sequence_id=layer_sequence_create(layer_animacoes,x,y, sqc_opening)
	break;
}



