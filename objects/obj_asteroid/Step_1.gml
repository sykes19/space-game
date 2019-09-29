/// @description Insert description here
// You can write your code in this editor

if maxhp <= 0 {
	switch(sprite_index)
	{
		case spr_asteroid_huge:
		maxhp = hugehp;
		hp += maxhp-1;
		break;
	
		case spr_asteroid_med:
		maxhp = medhp;
		hp += maxhp-1;
		break;
	
		case spr_asteroid_small:
		maxhp = smallhp;
		hp += maxhp-1;
		break;
	}
}