/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();



if state = "alive" {

#region Aiming
image_angle = angle;
// Spin left or right based on coinflip on spawn
if spin == 1 then angle += spinSpd; else angle -= spinSpd;
#endregion
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
	ammoLeft = ammo;	// Reload
	alarm[2] = 1;		// Start firing sequence
	stance = "firing"	// Enter firing stance
	arm_counter = 0;	// Reset movements until next fire
}

if stance == "firing" {	
	// I am shooting gun waiting for Alarm 2 to finish
}

if stance = "hold" {			// Hold between movements
	if arm_counter >= 1 {		// Check if laser is ready
		stance = "fire";		// Yes? Shoot.
	}
	else {
		stance = "holding";		// Hold still a sec
		arm_counter += 1;		// One step closer to arming.
	}
}
#endregion

}