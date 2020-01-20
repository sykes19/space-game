/// @description Threat reduction and score
// You can write your code in this editor

		switch(sprite_index)
	{
		case spr_asteroid_huge:	// What size am I?
		score += 20;			// Since I died, here's some score
		global.dir_threat -= threat_huge;
		part_emitter_region(global.p_sys,ID,x-64,x+64,y-64,y+64,ps_shape_ellipse,ps_distr_invgaussian);
		part_emitter_burst(global.p_sys,ID,global.p_astChunk, 8);
		break;
	
		case spr_asteroid_med:
		score += 15;
		global.dir_threat -= threat_med;
		part_emitter_region(global.p_sys,ID,x-32,x+32,y-32,y+32,ps_shape_ellipse,ps_distr_invgaussian);
		part_emitter_burst(global.p_sys,ID,global.p_astChunk, 6);
		break;
	
		case spr_asteroid_small:
		score += 10;
		global.dir_threat -= threat_small;
		part_emitter_region(global.p_sys,ID,x-16,x+16,y-16,y+16,ps_shape_ellipse,ps_distr_invgaussian);
		part_emitter_burst(global.p_sys,ID,global.p_astChunk, 3);
		break;
	}
