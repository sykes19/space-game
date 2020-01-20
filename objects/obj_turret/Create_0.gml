/// @description Balance perams
// You can write your code in this editor

threat_val		= 100 // How much threat is this worth
hp				= 150;	
image_xscale	= 0.01;	// Start tiny! Expands in >>Step
image_yscale	= 0.01;
dir				= 0;
spd				= 1;
dist			= 0;
new_spd			= 0;
spin			= 0.3;
stance			= "move";
move_time		= 80;
hold_time		= 40;
charge_time		= 45;
arm_counter		= choose(1,0,-1);
move_ready		= 0;
move_distance	= 250;

global.dir_threat += threat_val // Add threat

alarm[0]		= move_time;
image_angle = irandom_range(0,359); // Give a random visual rotation to start
