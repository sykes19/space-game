/// @description  Movement and controls

// AIMING
var aimHor = gamepad_axis_value(0, gp_axisrh);
var aimVer = gamepad_axis_value(0, gp_axisrv);
var dir = point_direction(0,0,aimHor,aimVer);         // "dir" is the direction I am facing
if((aimHor != 0) || (aimVer !=0)) image_angle = dir;  // Rotate ship to face aim direction

// ----- TIM CODE -----

//Keyboard button bindings. Constants now, but can be set elsewhere for button remapping.
var keyBindMove_N = ord("W");
var keyBindMove_S = ord("S");
var keyBindMove_E = ord("D");
var keyBindMove_W = ord("A");
	
//Fetch Keybaord Input
//keyboard_check will return either False (0) or True (1),
//we can treat them as numbers and do simple math to get -1 to 1 range
var moveInputX = keyboard_check(keyBindMove_E) - keyboard_check(keyBindMove_W);
var moveInputY = keyboard_check(keyBindMove_S) - keyboard_check(keyBindMove_N);

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

if (inputMagnitude < .1) {friction = .1;} //slow the ship down if there is little input
else {friction = 0} //otherwise don't, so we aren't affecting top speed

// ----- END TIM -----
//SHOOTING

if (missiles < 6 && alarm_get(0) = 0) alarm_set(0,60) // If missiles aren't full, start reloading

if(gamepad_button_check(0, gp_shoulderlb)) {
	// If there are no missiles on the screen, and you have missiles in stock...
	if(instance_exists(obj_missile) == 0 && missiles > 0)
	{

		// Prepare the list required to target asteroids, and populate the list with instances
		var _list = ds_list_create(); // Create a variable to house the list
		ds_list_clear(_list); // Make sure list is clear
		var _targets = collision_circle_list(x,y,1000,obj_asteroid,false,false,_list,true);

		// If targets were acquired at all, begin firing sequence
		if _targets > 0
		{
			alarm_set(0,-1); // Pause missile generation during fire
			for (var i = 0; missiles > 0; i++) // Fire 1 missile per asteroid, increment target list
			{ 
				var iMissile = instance_create_layer(x,y,"Instances",obj_missile);
				iMissile.target = _list[| i]; // Create missile, assign target from _list
				missiles -= 1;
			}
			audio_play_sound(sfx_missile,2,false);
			ds_list_destroy(_list);
			alarm_set(0,60);
		}	
	}
}



if(gamepad_button_check(0, gp_shoulderrb)){
	if (fire >= refire){
		var iBullet = instance_create_layer(x,y,"Instances",obj_bullet);
		iBullet.direction = image_angle;
		audio_play_sound(sfx_pew2, 2, 0);
		fire = 0;
	}
}

if(fire < refire){
	fire += 1;
}							// As long as RT is held and gun is "charged", shoot bullet and empty charge.
							// If gun is not charged, charge it!