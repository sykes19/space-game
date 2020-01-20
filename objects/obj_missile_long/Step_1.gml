/// @description Target acquisition
// You can write your code in this editor


 // Since angle isn't provided in time during creation, define angleThrust here.


if searchCoin == 1 searchCoin = 0; // Alternate these two values every frame to decide where to look
else searchCoin = 1;


searchRand = angle+irandom_range(-25,25); // Decide a random direction to look for targets

if !instance_exists(target) && canSearch == 1
{
	if searchCoin == 1
	{					// Look in a random line every odd frame
		target = collision_line(x,y,x+lengthdir_x(searchRange,searchRand),y+lengthdir_y(searchRange,searchRand),obj_asteroid,false,true);
		target = collision_line(x,y,x+lengthdir_x(searchRange,searchRand),y+lengthdir_y(searchRange,searchRand),obj_turret,false,true);
	}
	if searchCoin == 0
	{					// Look directly ahead every even frame
		target = collision_line(x,y,x+lengthdir_x(searchRange/2,angle),y+lengthdir_y(searchRange/2,angle),obj_asteroid,false,true);
		target = collision_line(x,y,x+lengthdir_x(searchRange,searchRand),y+lengthdir_y(searchRange,searchRand),obj_asteroid,false,true);
	}
	dir = face;
}
if instance_exists(target) 
{
	dir = point_direction(x, y, target.x, target.y) // If target exists, fly at it
	if (abs(angle_difference(angle,dir))) > 50 then target = noone;
}
