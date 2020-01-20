/// @description Respawn
// You can write your code in this editor
dBuffer				= 0;
missiles			= 0;	// How many missiles
barrageActive		= 0;
barrageCooldown		= 0;
missilesCharged		= 0;
hp					= 1;
stance				= "free";
state				= "alive";
condition			= "normal";
sprite_index		= spr_ship;	// Visibly respawn the ship
image_alpha			= 1;
image_speed			= 0;
image_index			= 0;
image_xscale		= 0.01;		// Start tiny! Expands in >>Step
image_yscale		= 0.01;
alarm[0]			= 60;		// Start missile recharging

// Spawn shield creation
spawnShield = instance_create_layer(x,y,"Instances",obj_shield);
alarm_set(1,120);