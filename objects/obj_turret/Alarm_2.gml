/// @description Laser charge
// You can write your code in this editor
var iBullet = instance_create_layer(x,y,"Instances",obj_turret_laser);
iBullet.direction = point_direction(x,y,obj_ship.x,obj_ship.y);
iBullet.image_angle = point_direction(x,y,obj_ship.x,obj_ship.y);
audio_play_sound(sfx_laser, 2, 0);