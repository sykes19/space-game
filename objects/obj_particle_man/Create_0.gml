/// @description Insert description here
// You can write your code in this editor
global.p_sys = part_system_create_layer("InstancesLow", true);

global.p_fire_1 = part_type_create();
part_type_shape(global.p_fire_1, pt_shape_pixel);
part_type_size(global.p_fire_1, 1, 1, 0, 0);
part_type_color3(global.p_fire_1, c_yellow, c_orange, c_red);
part_type_alpha3(global.p_fire_1, 0.8, 1, 0);
part_type_speed(global.p_fire_1, 4, 10, -0.4, 0.5);
part_type_direction(global.p_fire_1, 0, 359, 0, 20);
part_type_blend(global.p_fire_1, true);
part_type_life(global.p_fire_1, 30, 60);

global.p_fire_2 = part_type_create();
part_type_shape(global.p_fire_2, pt_shape_pixel);
part_type_size(global.p_fire_2, 1, 1, 0, 0);
part_type_color3(global.p_fire_2, c_white, c_yellow, c_yellow);
part_type_alpha3(global.p_fire_2, 0.8, 1, 0);
part_type_speed(global.p_fire_2, 4, 6, -1, 0.1);
part_type_direction(global.p_fire_2, 0, 359, 0, 5);
part_type_blend(global.p_fire_2, true);
part_type_life(global.p_fire_2, 30, 60);