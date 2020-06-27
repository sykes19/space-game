/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
#region Basic Enemy INIT
threat_val		= 100;		// How much threat am I worth
scoreWorth		= 100;		// Score, updated in Begin Step
hp				= 90;		// Health, updated in Begin Step
stance			= "move";	// Initiate enemy AI movement

image_angle = irandom_range(0,359); // Give a random visual rotation to start
#endregion

#region Unique Enemy INIT
charge_time		= 100
hold_time		= 44
angle		= image_angle;	// AIM CODE
diff			= 0;		// AIM CODE
aimSpeed		= 0;		// AIM CODE
target			= 0;		// AIM CODE
dir				= 0;		// MOVE CODE
spd				= 1;		// MOVE CODE
dist			= 0;		// MOVE CODE
new_spd			= 0;		// MOVE CODE
hold_time		= 0;		// INIT CODE (begin step)
charge_time		= 0;		// INIT CODE (begin step)
beamDamage		= 35			// Beam damage, obviously
arm_counter		= choose(0,-1); // Randomize the movements before shooting at spawn
move_ready		= 0;
move_distance	= 250;
chargeID		= 0;
#endregion
