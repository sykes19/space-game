/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
#region Basic Enemy INIT
threat_val		= 100;		// How much threat am I worth
scoreWorth		= 100;		// How many points am I worth
hp				= 90;		// Health
stance			= "move";	// Initiate enemy AI movement

image_angle = irandom_range(0,359); // Give a random visual rotation to start
global.dir_threat += threat_val		// Add threat
#endregion

#region Unique Enemy INIT
beamDamage		= 35;		// Beam damage, obviously
angle		= image_angle;	// AIM CODE
diff			= 0;		// AIM CODE
aimSpeed		= 0;		// AIM CODE
target			= 0;		// AIM CODE
dir				= 0;		// MOVE CODE
spd				= 1;		// MOVE CODE
dist			= 0;		// MOVE CODE
new_spd			= 0;		// MOVE CODE
spin			= 0.3;		// Speed to naturally spin
hold_time		= 40;		// Wait between movements
charge_time		= 90;		// How long to charge the laser
arm_counter		= choose(1,0,-1); // Randomize the movements before shooting at spawn
move_ready		= 0;
move_distance	= 250;
chargeID		= 0;
#endregion
