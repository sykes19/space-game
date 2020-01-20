/// @description Threat reduction and score
// You can write your code in this editor

global.dir_threat -= 20
		switch(sprite_index)
	{
		case spr_asteroid_huge:	// What size am I?
		score += 20;			// Since I died, here's some score
		break;
	
		case spr_asteroid_med:
		score += 15;
		break;
	
		case spr_asteroid_small:
		score += 10;
		break;
	}
		
//repeat(40){	part_emitter_burst() }