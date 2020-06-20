/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
#region Basic Enemy INIT
threat_val		= 100;		// How much threat am I worth
scoreWorth		= 100;		// Score, updated in Begin Step
hp				= 90;		// Health, updated in Begin Step
stance			= "move";	// Initiate enemy AI movement

angle = irandom_range(0,359); // Give a random visual rotation to start
#endregion

#region Unique Enemy INIT
refireTime		= 18;
ammoLeft		= 0;
ammo			= 3;
spin			= choose(1,0);
spinSpd			= 0.3;
hold_time		= 40;
angle			= image_angle;	// AIM CODE
dir				= 0;		// MOVE CODE
spd				= 0.6;		// MOVE CODE
dist			= 0;		// MOVE CODE
new_spd			= 0;		// MOVE CODE
hold_time		= 0;		// INIT CODE (begin step)
charge_time		= 0;		// INIT CODE (begin step)
move_ready		= 0;		// MOVE CODE
move_distance	= 250;		// MOVE CODE
arm_counter		= choose(1,0,-1); // Randomize the movements before shooting at spawn
#endregion
