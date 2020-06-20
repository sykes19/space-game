/// @description Respawn
// You can write your code in this editor
shields				= 0;
dBuffer				= 0;
hp					= 1;
powAbility			= 0;
powSpread			= 0;
global.pThreat		= 0;
stance				= "free";
state				= "alive";
condition			= "normal";
sprite_index		= shipSprite;	// Visibly respawn the ship
image_alpha			= 1;
image_speed			= 0;
image_index			= 0;
image_xscale		= 0.01;		// Start tiny! Expands in >>Step
image_yscale		= 0.01;
alarm[0]			= 60;		// Start missile recharging

// Spawn shield creation
spawnShield = instance_create_layer(x,y,"Instances",obj_shield);
spawnShield.host = obj_player;		// Tell the shield to attach to this instance
alarm_set(1,120);