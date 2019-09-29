//Firing Sequence
if(gamepad_button_check(0, global.gp_fire2) || mouse_check_button(global.key_fire2)) {
	if(barrageActive == 0 && missiles > 0) 
	{   
		barrageActive = 1;			// Allow barrage code to run and set it to fire immediately
		alarm[3] = 1;
		ds_list_clear(_list);		// Make sure list is clear, in case it was populated before
		_targets = collision_circle_list(x,y,4000,obj_asteroid,false,false,_list,true);
		//Detect all asteroids in a large radius, file them into the list in order of distance from ship
		mTarget = 0;				// Asteroid to target from list
		activePod = 0;				// Set pod (angle) missile will fire at to default
	}
}
if barrageActive == 1				// If targets are acquired and missiles are ready to be fired...
{
	alarm_set(0, mReload);			// Delay missile generation during barrage
	if (missiles > 0 && barrageCooldown == 0 && _targets > 0)
	{ 
		var tempMissile = instance_create_layer(x,y,"Instances",obj_missile_long); // Create a missile
		tempMissile.target = _list[| mTarget];	// Assign target to missile from target list
		tempMissile.angle = image_angle+(pod[activePod]);// Set missile direction to pod angle
		tempMissile.face = image_angle; // Set missile facing to forward-ish
		activePod++;							// Fire next missile from different pod
		missiles--;								// Deplete missile reserve
		mTarget++;								// Increment target
		barrageCooldown = 1;					// Initiate cooldown
		alarm_set(2,mRefire);					// Initiate cooldown
		audio_play_sound(sfx_missile,2,false);	// pew
	}
	if (missiles == 0 || _targets == 0)			// If the barrage is over, initiate cleanup and start reloading
	{
		barrageActive = 0;
		alarm_set(0,mReload);        
	}
}	