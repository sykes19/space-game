/// @description Balance perams
// You can write your code in this editor
event_inherited();
threat_val		= 100;		// How much threat am I worth
scoreWorth		= 100;		// How many points am I worth
hp				= 90;
dir				= 0;
dBuffer			= 0;
beamDamage		= 35;		// Beam damage, obviously
spd				= 1;
dist			= 0;
new_spd			= 0;
spin			= 0.3;
stance			= "move";
hold_time		= 40;		// Wait between movements
charge_time		= 90;		// How long to charge the laser
arm_counter		= choose(1,0,-1); // Randomize the movements before shooting at spawn
move_ready		= 0;
move_distance	= 250;
chargeID		= 0;

global.dir_threat += threat_val // Add threat
image_angle = irandom_range(0,359); // Give a random visual rotation to start
