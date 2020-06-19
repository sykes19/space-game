/// @description Engine INIT
// You can write your code in this editor

#region INIT

stance				= "free";	// What action am I performing?
state				= "alive";	// alive, dead, respawning
condition			= "normal";	// What actions are being performed on me?
dBuffer				= 0;		// Buffer to apply damage from outside sources
hp					= 100;		// Absolute health value
image_speed			= 0;
image_index			= 0;
spawnShield			= noone;
shields				= 0;
shielded			= false;
image_xscale		= 0.01;		// Start tiny! Expands in >>Step
image_yscale		= 0.01;

threat_val			= 0;
scoreWorth			= 0;

#endregion