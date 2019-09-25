/// @description Insert description here
// You can write your code in this editor
collision_circle(x,y,2000,obj_asteroid,false,true);

dir = point_direction(x, y, obj_asteroid.x, obj_asteroid.y)
moveX = lengthdir_x(spd, dir);
moveY = lengthdir_y(spd, dir);


