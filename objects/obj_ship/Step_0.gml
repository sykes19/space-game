/// @description  Movement and controls
move_wrap(true,true,sprite_width/2);

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

/*
//MOVEMENT WITH CONTROLLER
if (obj_game.input == 0)
{
var moveHor = gamepad_axis_value(0, gp_axislh);       // Determine both angle of joystick, and thrust
var moveVer = gamepad_axis_value(0, gp_axislv);
var move = point_direction(0,0,moveHor,moveVer);      // Determining the direction I wish to move.
var xx = abs(lengthdir_x(len, move));                 // Make these absolutes, speed is always positive.
var yy = abs(lengthdir_y(len, move));			      // Direction is decided in logic below.
var hmax = (topspeed*(xx/len))*abs(moveHor);          // % of top speed based on X angle and thrust
var vmax = (topspeed*(yy/len))*abs(moveVer);	      // % of top speed based on Y angle and thrust

if(moveHor > 0) if(hspeed < hmax) hspeed += accel;
if(moveHor < 0) if(hspeed > -hmax) hspeed -= accel;
if(moveVer > 0) if(vspeed < vmax) vspeed += accel;
if(moveVer < 0) if(vspeed > -vmax) vspeed -= accel;
}
*/

//MOVEMENT WITH KEYBOARD AND MOUSE
/*
if (obj_game.input ==  1)
{
var chording = 0;
var hmax = (topspeed)-(
);          
var vmax = (topspeed)-(abs(hspeed));

if(keyboard_check(ord("D"))) if(hspeed < hmax) hspeed += accel;
if(keyboard_check(ord("A"))) if(hspeed > -hmax) hspeed -= accel;
if(keyboard_check(ord("S"))) if(vspeed < vmax) vspeed += accel;
if(keyboard_check(ord("W"))) if(vspeed > -vmax) vspeed -= accel;
}

if (abs(hspeed) || abs(vspeed) > 0) friction = decel; // add some basic friction if I'm moving.
*/


//SHOOTING
if(gamepad_button_check(0, gp_shoulderrb)){
	if (fire >= refire){
		var inst = instance_create_layer(x,y,"Instances",obj_bullet);
		inst.direction = image_angle;
		audio_play_sound(sfx_pew2, 2, 0);
		fire = 0;
	}
}

if(fire < refire){
	fire += 1;
}							// As long as RT is held and gun is "charged", shoot bullet and empty charge.
							// If gun is not charged, charge it!



// Keyboard controls disabled for controller support

/*if(keyboard_check(vk_left)){
	image_angle += 5;
}

if(keyboard_check(vk_right)){
	image_angle -= 5;
}

if(keyboard_check(vk_up)){
	motion_add(image_angle, 0.09);
}

if(keyboard_check_pressed(vk_space)){
	var inst = instance_create_layer(x,y,"Instances",obj_bullet);
	inst.direction = image_angle;
}
*/