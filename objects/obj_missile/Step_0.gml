/// @description Insert description here
// You can write your code in this editor
if instance_exists(target)
{
	dir = point_direction(x, y, target.x, target.y); // Fly at target, if it exists
}
else
{
	target = instance_nearest(x, y, obj_asteroid);  // If the target is destroyed somehow, get a new one
	dir = point_direction(x, y, target.x, target.y);
}

if angleThrust = 0
{
	angleThrust = angle; // Since angle isn't provided in time during creation, define angleThrust here.
}
if thrusters == 0							// While thrusters are off, drift slowly
{
	angle = face;        // Temporary facing direction, so missiles face forward while drifting sideways
	moveX = lengthdir_x(spd, angleThrust);
	moveY = lengthdir_y(spd, angleThrust);
}
else										// If thusters ignite, speed up and home in
{
	moveX = lengthdir_x(spd, angle);
	moveY = lengthdir_y(spd, angle);
	spd = topSpeed;
}
x += moveX;	
y += moveY;

image_angle = angle;

if thrusters == 1
{
	diff = angle_difference(angle, dir); // Find the shortest angle to the target
	if (diff <= -45) { angle += 8; }				// Sharp turn left
	if (diff >= 45)  { angle -= 8; }				// Sharp turn right	
	if (diff <= -29 && diff > -45) { angle += 6; }	// Turn left
	if (diff >= 29 && diff < 45)  { angle -= 6; }	// Turn right
	if (diff <= -10 && diff > -29) { angle += 3; }	// Correct left
	if (diff >= 10 && diff < 29)  { angle -= 3; }	// COrrect right
	if (diff <= -9) { angle += 1; }					// Minor correction left
	if (diff >= 9)  { angle -= 1; }					// Minor correction right
}



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

