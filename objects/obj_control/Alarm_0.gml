/// @description Star spawning
// You can write your code in this editor

	var xx = irandom_range(-room_width, room_width);
	var yy = 0;

instance_create_layer(xx, yy, "Instances", obj_star);

alarm[0] = 4;