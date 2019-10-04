/// @description HP and Threat INIT
// You can write your code in this editor

if maxhp <= 0 {
	switch(sprite_index)
	{
		case spr_asteroid_huge:
		global.dir_threat += 30
		maxhp = hugehp;
		hp += maxhp-1;
		break;
	
		case spr_asteroid_med:
		global.dir_threat += 20
		maxhp = medhp;
		hp += maxhp-1;
		break;
	
		case spr_asteroid_small:
		global.dir_threat += 10
		maxhp = smallhp;
		hp += maxhp-1;
		break;
	}
}