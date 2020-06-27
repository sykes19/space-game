/// @description Level balance adjustment
// You can write your code in this editor
hold_time		= 32-(level*4);				// Wait less time on hold
hold_time		= clamp(hold_time,10,50);	// Don't let wait time go negative
scoreWorth		+= (scoreWorth/2)*(level-1); // Add 50% score per level
spinSpd			+= 0.15*(level-1);
refireTime		-= (refireTime/8)*(level-1);
ammo			+= 1*(level-1);
hp				+= (hp/5)*(level-1);		// Add 20% health per level
spd				+= (spd/6)*(level-1);		// Go faster

// Threat value modified after enemy level, adding 50% of original threat for each level.
threat_val = threat_val*(0.5+(level/2));
global.dir_threat += threat_val		// Add threat