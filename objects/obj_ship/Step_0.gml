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
//The input above gives us X and Y input values ranging from -1.0 to 1.0 on both axis.
//To clamp the input, we first convert this from (x,y) coordinates to (angle,magnitude) "polar" coordinates
inputAngle = point_direction(0, 0, moveInputX, moveInputY); //find angle of raw input
inputMagnitude = point_distance(0, 0, moveInputX, moveInputY) * 1.1; //find magnitude of raw input
// *1.1 will slightly scale up the input to cap at ~90% physical, the max-input equvalent of a deadzone

if (inputMagnitude > 1.0) {inputMagnitude = 1.0;} //clamp to max magnitude of 1.0

//Now we use lengthdir to convert the adjusted polar coordinates back to (x,y) "cartesian" coordiates
//Since we previously capped the magnitude to 1.0, the result will be -1.0 to 1.0 range on each axis
//This range is multipled by our accel and added to our existing hspeed and vspeed
//We also need to factor in our constant deceleration so it does not affect top speed
hspeed += lengthdir_x(inputMagnitude, inputAngle) * accel * (1.0 + decel);
vspeed += lengthdir_y(inputMagnitude, inputAngle) * accel * (1.0 + decel);

//Now we want to clamp our ship max speed. We will do it the same way we did for input by converting to polar
shipMoveAngle = point_direction(0, 0, hspeed, vspeed); //find angle of current movement
shipMoveSpeed = point_distance(0, 0, hspeed, vspeed); //find magnitude (speed) of current movement
if (shipMoveSpeed > topspeed) //If we are going too fast
{
	shipMoveSpeed = topspeed; //clamp to topspeed
	//Convert back to cartesian and replace existing speed.
	hspeed = lengthdir_x(shipMoveSpeed, shipMoveAngle);
	vspeed = lengthdir_y(shipMoveSpeed, shipMoveAngle);	
} //No need to do this redunant math if we weren't going too fast.

//Linear friction ramp
//Full input = no friction. Half input = half friction. No input = full friction.
//friction = (1-inputMagnitude) * decel ;

//Flat friction now. It's compensated in h/vspeed equations.
friction = decel;

// ----- END TIM -----
#endregion
#region Weapons
//MISSILES

//Pause animation if at default animation


//Firing Sequence
if (missiles < 6 && alarm_get(0) = 0) then alarm_set(0, mReload) // Reload missiles passively

if(gamepad_button_check(0, global.gp_fire2) || mouse_check_button(global.key_fire2)) {
	if(instance_exists(obj_missile) == 0 && barrageActive == 0 && missiles > 0) 
	{   
		barrageActive = 1;			// Allow barrage code to run and set it to fire immediately
		alarm[3] = 1;
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
//GUN
//Temporary code to change weapons
if (gamepad_button_check(0, gp_padu) || keyboard_check(ord("1"))) { weaponType = "basic";}
if (gamepad_button_check(0, gp_padr) || keyboard_check(ord("2"))) { weaponType = "hunter";}

var weaponInput = gamepad_button_check(0, global.gp_fire1) || mouse_check_button(global.key_fire1)
ship_weapons("step", weaponInput); // All primary weapon functionality now in ship_weapons script.
#endregion