/// @description Insert description here
// You can write your code in this editor
		switch(sprite_index)
	{
		case spr_asteroid_huge:
		global.dir_threat -= 30
		score += 20;
		break;
	
		case spr_asteroid_med:
		global.dir_threat -= 20
		score += 15;
		break;
	
		case spr_asteroid_small:
		global.dir_threat -= 10
		score += 10;
		break;
	}
	
		
//repeat(40){	part_particles_create_color(global.p_plink,x,y,) }