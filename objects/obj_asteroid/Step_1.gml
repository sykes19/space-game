/// @description Insert description here
// You can write your code in this editor

if maxhp <= 0 {
	switch(sprite_index)
	{
		case spr_asteroid_huge:
		maxhp = 30;
		hp += maxhp-1;
		break;
	
		case spr_asteroid_med:
		maxhp = 20;
		hp += maxhp-1;
		break;
	
		case spr_asteroid_small:
		maxhp = 10;
		hp += maxhp-1;
		break;
	}
}