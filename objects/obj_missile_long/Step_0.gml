/// @description Flight instructions
// You can write your code in this editor

// dir = My target direction, should be either directly forward or my target
// angle = What direction the missile should be physically moving at all times
// face = What direction the missile should be pointing to
// angleThrust = temporary angle to travel before thruster ignition


if thrusters == 0							// While thrusters are off, drift slowly
{
	moveX = lengthdir_x(spd, angleThrust);	// Drift away from ship after ejection
	moveY = lengthdir_y(spd, angleThrust);
}									

if thrusters == 1 // If thusters ignite, speed up and home in
{
	canSearch = 1;
	moveX = lengthdir_x(spd, angle);
	moveY = lengthdir_y(spd, angle);
	spd = topSpeed;
	
	diff = angle_difference(angle, dir); // Find the shortest angle to the target
	if (diff >= 1)					angle -= 2; 	// Sharp turn left
	if (diff <= -1)					angle += 2; 	// Sharp turn right	
//	if (diff <= -29 && diff > -45)  angle += 7; 	// Turn left
//	if (diff >= 29 && diff < 45)	angle -= 7; 	// Turn right
//	if (diff <= -10 && diff > -29)	angle += 5; 	// Correct left
//	if (diff >= 10 && diff < 29)	angle -= 5; 	// Correct right
//	if (diff <= -6 && diff > -10)	angle += 3; 	// Correct left
//	if (diff >= 4 && diff < 10)		angle -= 3; 	// Correct right
//	if (diff >= -3)					angle += 1; 	// Minor correction left
//	if (diff <= 3)					angle -= 1; 	// Minor correction right
}
face = angle;
image_angle = face;
x += moveX;	
y += moveY;


/*if instance_exists(target)
{
	
	if (target.xprevious+30 > target.x || target.xprevious-30 < target.x)
	{
		show_debug_message("Missile target X lost!");
		target = instance_nearest(x, y, obj_asteroid);
	}
	else if (targetY_prev+30 > target.y|| targetY_prev-30 < target.y)
	{
		show_debug_message("Missile target Y lost!");
		target = instance_nearest(x, y, obj_asteroid);
	}

}*/

