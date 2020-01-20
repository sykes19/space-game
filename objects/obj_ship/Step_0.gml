/// @description  Movement and controls
#region Spawn expansion

if image_xscale < 1 { // Expand magically! For fun!
	image_xscale += 0.2;
	image_yscale = image_xscale;
}

#endregion
if state = "alive" {
	if (missiles < 6 && alarm_get(0) = 0) then alarm_set(0, mReload) // Reload missiles passively
	
	if stance = "free" {
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
		if(gamepad_button_check(0, global.gp_fire2) || mouse_check_button(global.key_fire2))
		{ missile_barrage("prep"); }	// Initiate firing prep sequence if button is pressed
		if barrageActive == 1
		{ missile_barrage("active"); }	// Continue firing as long as conditions are met


		//GUN
		//Temporary code to change weapons
		if (gamepad_button_check(0, gp_padu) || keyboard_check(ord("1"))) { weaponType = "basic";}
		if (gamepad_button_check(0, gp_padr) || keyboard_check(ord("2"))) { weaponType = "hunter";}
		var weaponInput = gamepad_button_check(0, global.gp_fire1) || mouse_check_button(global.key_fire1)
		ship_weapons("step", weaponInput); // All primary weapon functionality now in ship_weapons script.
		#endregion

	}
}

if state = "dead" {
	image_alpha = 0;
	sprite_index = -1;
	alarm[5] = 90;
}