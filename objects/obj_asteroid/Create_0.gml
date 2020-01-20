/// @description Balance perams
// You can write your code in this editor

// If asteroid size not assigned at spawn, choose one, with a 3:2:1 ratio
if sprite_index == spr_asteroid_blank sprite_index = choose(spr_asteroid_huge,spr_asteroid_huge,spr_asteroid_huge,spr_asteroid_med,spr_asteroid_med,spr_asteroid_small);

ID = part_emitter_create(global.p_sys); // Create a particle emitter unique to this asteroid
threat_huge		= 30;
threat_med		= 15;
threat_small	= 8;
dBuffer			= 0;
hp				= 1;	// Initialize HP to something above 0. HP is determined in Begin Step
maxhp			= 0;	// INIT - - - >>Step
hugehp			= 30;	// Health values for balance
medhp			= 20;
smallhp			= 10;
image_xscale	= 0.01;	// Start tiny! Expands in >>Step
image_yscale	= 0.01;
dir		= irandom_range(0,359);		// Start moving a random direction
spd		= random_range(0.5,2);		// Starting speed, with variation
image_angle = irandom_range(0,359); // Give a random visual rotation to start

// Decide what direction to visually rotate and how fast for use in >>Step
if (choose(1,0) == 0)	{ spin = random_range(0.2,1.4); }
else					{ spin = random_range(-0.2,-1.4); }	
