/// @description Insert description here
// You can write your code in this editor
if instance_exists(target)
{
	dir = point_direction(x, y, target.x, target.y);
}
else
{
	target = instance_nearest(x, y, obj_asteroid);
	dir = point_direction(x, y, target.x, target.y);
}
moveX = lengthdir_x(spd, dir);
moveY = lengthdir_y(spd, dir);
image_angle = dir;
x += moveX;
y += moveY;



