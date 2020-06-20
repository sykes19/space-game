/// @description Stance orders
// You can write your code in this editor
event_inherited();

image_angle += spin;
if state = "alive" {
	
#region Move
if stance = "move" {
	if (move_ready = 0) // Have I chosen a direction that's safe yet?
	{
			switch(choose(1,2,3,4)) // Chose north, east, south, or west at random
		{
			case 1:
				if (x+move_distance < room_width){		// Check if I can move East
					move_ready = 1;						// If so, mark the direction as safe
					dir		= 360							// Set heading for East
					destX	= x+move_distance;			
					destY	= y;						// Save my destination coordinates
				}
				break;
			case 2:
				if (y-move_distance > 0){				// Check if I can move North
					move_ready = 1;
					dir		= 90;
					destX	= x;
					destY	= y-move_distance;
				}
				break;
			case 3:
				if (x-move_distance > 0){				// Check if I can move West
					move_ready = 1;
					dir		= 180;
					destX	= x-move_distance;
					destY	= y;
				}
				break;
			case 4:
				if (y+move_distance < room_height){		// check if I can move South
					move_ready = 1;
					dir		= 270;
					destX	= x;
					destY	= y+move_distance;
				}
				break;
		}
	}
	else
	{
		stance = "moving";		// If movement is ready, plot a course for the set direction
		move_ready = 0;			// Prep variable for next cycle
	}
}

if stance = "moving" {
	// Record how far the trip will be
	dist = distance_to_point(destX, destY);
	
	var travelled = abs(dist-move_distance); // Record distance travelled
	var rampUp = (travelled / (move_distance/2)) * 100
	var rampDown = (dist / (move_distance/2)) * 100
	if travelled <= move_distance/2 then new_spd = spd*(rampUp/20)
	else								 new_spd = spd*(rampDown/20)
	moveX = lengthdir_x(max(0.5, new_spd), dir);
	moveY = lengthdir_y(max(0.5, new_spd), dir);
	x += moveX;	
	y += moveY;
	if (dist < 2)		 { // If you reach destination, stop moving
		dist = 0;
		stance = "hold";
		alarm[1] = hold_time;
		new_spd = spd;
	}
}
#endregion
#region Fire
if stance = "fire" {
	alarm[2] = charge_time;
	alarm[1] = hold_time+charge_time;
	arm_counter = 0;
	stance = "firing";
}

if stance == "firing" {
	if condition == "damaged" {
		stance = "move";
		audio_stop_sound(chargeID);
		alarm[2] = -1;
		arm_counter += 1;
	}
// Time until shot fires
	var timeLeft = (alarm[2]/charge_time);
// Raw distance to target (adding sprite width)
	var tDistO = distance_to_object(obj_player);
// Get raw angle to target
	var tAngle = point_direction(x,y,obj_player.x,obj_player.y)
// Provide two offset angles that converge when shot fires
	var tAngleL = tAngle+(20*timeLeft);
	var tAngleR = tAngle-(20*timeLeft);
// Scale beam distance based on bullshit calculations. Plus a small boost.
	var tDist = 90 + (tDistO-((tDistO/2)*(timeLeft/4)));	
// Create coordinates for L and R lasers based on these
	xL = x + lengthdir_x(tDist,tAngleL);
	yL = y + lengthdir_y(tDist,tAngleL);
	xR = x + lengthdir_x(tDist,tAngleR);
	yR = y + lengthdir_y(tDist,tAngleR);
}

if stance = "hold" {
	if arm_counter >= 2 {
		stance = "fire";
		chargeID = audio_play_sound(sfx_whirl,2,0);
	}
	else {
		stance = "holding";
		arm_counter += 1;
	}
}
#endregion

}

if state = "dead" {
	instance_destroy();
}