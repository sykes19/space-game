/// @description  Movement and controls

#region Aiming

if input = "gamepad"
{
	var aimHor = gamepad_axis_value(0, gp_axisrh);
	var aimVer = gamepad_axis_value(0, gp_axisrv);
	var dir = point_direction(0,0,aimHor,aimVer);         // "dir" is the direction I am facing
	if((aimHor != 0) || (aimVer !=0)) image_angle = dir;  // Rotate ship to face aim direction
}
if input = "mouse"
{
	var dir = point_direction(x,y,mouse_x,mouse_y);
	image_angle = dir;
}

#endregion
#region Movement
// ----- TIM CODE -----

//All bindings are set in obj_game > Create ~Matt

//Fetch Keybaord Input
//keyboard_check will return either False (0) or True (1),
//we can treat them as numbers and do simple math to get -1 to 1 range
var moveInputX = keyboard_check(global.key_right) - keyboard_check(global.key_left);
var moveInputY = keyboard_check(global.key_down) - keyboard_check(global.key_up);

//Fetch controller input, just adding to keyboard input for now
moveInputX += gamepad_axis_value(0, gp_axislh);
moveInputY += gamepad_axis_value(0, gp_axislv);

//Clamp max input magnitude
inputMagnitude = point_distance(0, 0, moveInputX, moveInputY); //find magnitude of raw input
inputAngle = point_direction(0, 0, moveInputX, moveInputY); //find angle of raw input
if ((inputMagnitude*1.1) > 1.0) //add a bit to the input (to accommodate for bad controllers)
	{inputMagnitude = 1.0;} //clamp to max magnitude of 1.0

//With this, lengthdir_x and _y will give us a -1.0 to 1.0 range of acceptable inputs
//Apply acceleration to persistent speed values
hspeed += lengthdir_x(inputMagnitude, inputAngle) * accel //x component of clamped input times accel
vspeed += lengthdir_y(inputMagnitude, inputAngle) * accel //y component of clamped input times accel

//Same clamp formula, but this time for the ship speed instead of our input
shipMoveSpeed = point_distance(0, 0, hspeed, vspeed); //find magnitude (speed) of current movement
shipMoveAngle = point_direction(0, 0, hspeed, vspeed); //find angle of current movement
if (shipMoveSpeed > topspeed) {shipMoveSpeed = topspeed;} //clamp to topspeed
	
//Insert new clamped values back into our speed
hspeed = lengthdir_x(shipMoveSpeed, shipMoveAngle)
vspeed = lengthdir_y(shipMoveSpeed, shipMoveAngle)

//Linear friction ramp
//Full input = no friction. Half input = half friction. No input = full friction.
friction = (1-inputMagnitude) * decel ;

// ----- END TIM -----
#endregion
#region Weapons
//SHOOTING

if (missiles < 6 && alarm_get(0) = 0) then alarm_set(0, mReload) // Reload missiles passively

if(gamepad_button_check(0, global.gp_fire2) || mouse_check_button(global.key_fire2)) {
	if(instance_exists(obj_missile) == 0 && barrageActive == 0 && missiles > 0) 
	{   
		barrageActive = 1;			// Allow barrage code to run and set it to fire immediately
		_list = ds_list_create();	// Create a variable to house a blank list
		ds_list_clear(_list);		// Make sure list is clear, in case it was populated before
		_targets = collision_circle_list(x,y,1000,obj_asteroid,false,false,_list,true);
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
		var tempMissile = instance_create_layer(x,y,"Instances",obj_missile); // Create a missile
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
		ds_list_destroy(_list);
		alarm_set(0,mReload);        
	}
}	

//Temporary code to change weapons
if (gamepad_button_check(0, gp_padu) || keyboard_check(ord("1"))) { weaponType = "basic";}
if (gamepad_button_check(0, gp_padr) || keyboard_check(ord("2"))) { weaponType = "hunter";}

var weaponInput = gamepad_button_check(0, global.gp_fire1) || mouse_check_button(global.key_fire1)
ship_weapons("step", weaponInput); // All primary weapon functionality now in ship_weapons script.
#endregion