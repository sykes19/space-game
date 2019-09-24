/// @description  Movement and controls

move_wrap(true,true,sprite_width/2);

// AIMING
var aimHor = gamepad_axis_value(0, gp_axisrh);
var aimVer = gamepad_axis_value(0, gp_axisrv);
var dir = point_direction(0,0,aimHor,aimVer);         // "dir" is the direction I am facing
if((aimHor != 0) || (aimVer !=0)) image_angle = dir;  // Rotate ship to face aim direction

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

//MOVEMENT WITH KEYBOARD AND MOUSE

// IS NOT WORKING YET

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
*/
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