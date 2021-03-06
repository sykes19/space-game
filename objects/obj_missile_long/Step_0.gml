/// @description Flight instructions
// You can write your code in this editor
if image_xscale < 1 { // Expand magically! For fun!
	image_xscale += 0.08;
	image_yscale = image_xscale;
}

// dir = My target direction, should be either directly forward or my target
// angle = What direction the missile should be physically moving at all times
// face = What direction the missile should be pointing to
// angleThrust = temporary angle to travel before thruster ignition
// diff = The difference in angle between my facing direction, and the target


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
	if (diff >= 1)					angle -= 2; 	// turn left
	if (diff <= -1)					angle += 2; 	// turn right	
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

