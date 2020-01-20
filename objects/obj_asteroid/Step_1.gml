/// @description HP Init
// You can write your code in this editor

//global.dir_threat += 20 // Add threat

/* Since creation happens with 0 HP (or less if we're inhereting overkill from an asteroid we broke off from)
give myself the appropriate HP and define my existence based on my size, and add the appropriate threat */
if maxhp <= 0 {
	switch(sprite_index)
	{
		case spr_asteroid_huge:	// What size am I?
		maxhp = hugehp;			// Set my max HP based on size
		hp += maxhp-1;			// Set my actual HP to my max, minus 1 for some reason?
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