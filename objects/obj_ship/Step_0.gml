/// @description  Movement and controls

move_wrap(true,true,sprite_width/2);

// AIMING
var aimHor = gamepad_axis_value(0, gp_axisrh);
var aimVer = gamepad_axis_value(0, gp_axisrv);
var dir = point_direction(0,0,aimHor,aimVer);         // "dir" is the direction I am facing
if((aimHor != 0) || (aimVer !=0)) image_angle = dir;  // Rotate ship to face aim direction

// MOVEMENT WITH CONTROLLER

/* THIS IS MOULDY'S CODE
//get joystick values
var moveHor = gamepad_axis_value(0,gp_axislh);
var moveVer = gamepad_axis_value(0,gp_axislv);

//calculate movement to be added to speed
var movementHor = moveHor*accel;
var movementVer = moveVer*accel;

//calculate the new speed
var new_speedHor = hspeed + movementHor;
var new_speedVer = vspeed + movementVer;

//clamp the speed if necessary
//if the length(hypotenuse) of the vector(triangle) created by 
//speedHor and speedVer is greater than maxSpeed, clamping_multiplier will be less than 1
var clamping_multiplier = topspeed / sqrt((new_speedHor*new_speedHor) + (new_speedVer*new_speedVer)); 

if(clamping_multiplier < 1) //if speed is above maxspeed, scale it down
{
    new_speedHor = new_speedHor * clamping_multiplier;
    new_speedVer = new_speedVer * clamping_multiplier;
}
if(moveHor != 0) //if there is horizontal input
{
    hspeed = new_speedHor; //set the new speed
}
else
{
    hspeed = hspeed*(1-decel); //apply friction
}
if(moveVer != 0) //if there is vertical input
{
    vspeed = new_speedVer; //set the new speed
}
else
{
    vspeed = vspeed*(1-decel); //apply friction
}
*/

if (obj_game.input == 0)
{
var joyHor = gamepad_axis_value(0, gp_axislh);        // Determine both angle of joystick, and thrust
var joyVer = gamepad_axis_value(0, gp_axislv);
var move = point_direction(0,0,joyHor,joyVer);        // Determining the direction I wish to move.
var xx = abs(lengthdir_x(len, move));                 // Make these absolutes, speed is always positive.
var yy = abs(lengthdir_y(len, move));			      // Direction is decided in logic below.
var hmax = (topspeed*(xx/len))*abs(joyHor);          // % of top speed based on X angle and thrust
var vmax = (topspeed*(yy/len))*abs(joyVer);	      // % of top speed based on Y angle and thrust

if(joyHor > 0) hspeed += accel;
if(joyHor < 0) hspeed -= accel;
if(joyVer > 0) vspeed += accel;
if(joyVer < 0) vspeed -= accel;
}
if (abs(hspeed) || abs(vspeed) > 0) friction = decel; // add some basic friction if I'm moving.

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