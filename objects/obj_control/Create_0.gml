/// @description Insert description here
// You can write your code in this editor

repeat(500){
instance_create_layer(irandom_range(-room_width/2, room_width),irandom_range(-room_height, room_height), "Instances", obj_star);
}

room_goto(rm_start);
alarm[0] = 1;