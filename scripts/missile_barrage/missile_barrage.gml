var missileMode = argument[0];


if missileMode = "prep"  // Respond to the button being pressed, and set values to prep for barrage
{
		if(barrageActive == 0 && missiles > 0)	// Make sure it's not active already, and we have ammo
	{   
		barrageActive = 1;			// Allow barrage code to run and set it to fire immediately
		alarm[3] = 1;				// Trigger ship firing animation
		activePod = 0;				// Set pod (angle) missile will fire from to default
		missileID = 0;				// Give missiles a unique ID for the particle system
	}
}

if missileMode = "active" // Runs every step as long as barrageActive is enabled
{
	alarm_set(0, mReload);			// Delay missile generation during barrage
	if activePod >= 6 activePod = 0; // If I need to fire more than 6 missiles, loop back to the original pod
	if (missiles > 0 && barrageCooldown == 0)
	// If ammo remains and missiles are not on cooldown...
	{ 
		var tempMissile = instance_create_layer(x,y,"Instances",obj_missile_long); // Create a missile
		tempMissile.dir = image_angle;							// Set missile thrust trajectory forward
		tempMissile.face = image_angle;							// Set missile facing to forward
		tempMissile.ID = missileID;								// Give missile unique ID for particle sys
		tempMissile.angleThrust = image_angle+(pod[activePod]);	// Launch missile at an angle, based on pod
		missileID++;							// Increment missile ID
		activePod++;							// Fire next missile from different pod
		missiles--;								// Deplete missile reserve
		barrageCooldown = 1;					// Missiles are on cooldown
		alarm_set(2,mRefire);					// Alarm 2 sets cooldown back to 0 when ready
		audio_play_sound(sfx_missile,2,false);	// pew
	}
	if (missiles == 0)			// Out of missiles?
	{
		barrageActive = 0;		// Disable firing sequence
		alarm_set(0,mReload);	// Enable missile reloading timer
	}
}