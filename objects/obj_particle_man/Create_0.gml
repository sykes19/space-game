/// @description Insert description here
// You can write your code in this editor
global.p_sys = part_system_create_layer("InstancesLow", true);

#region Missile Explosion
global.p_fire_1 = part_type_create();
part_type_shape(global.p_fire_1, pt_shape_pixel);
part_type_size(global.p_fire_1, 2, 2, 0, 0);
part_type_color3(global.p_fire_1, c_yellow, c_orange, c_red);
part_type_alpha3(global.p_fire_1, 1, 1, 0);
part_type_speed(global.p_fire_1, 11, 12, -0.5, 0.2);
part_type_direction(global.p_fire_1, 0, 359, 0, 20);
part_type_blend(global.p_fire_1, true);
part_type_life(global.p_fire_1, 15, 20);

global.p_fire_2 = part_type_create();
part_type_shape(global.p_fire_2, pt_shape_line);
part_type_size(global.p_fire_2, 0.1, 0.1, 0, 0);
part_type_color3(global.p_fire_2, c_white, c_yellow, c_yellow);
part_type_alpha3(global.p_fire_2, 1, 0.8, 0);
part_type_speed(global.p_fire_2, 1, 3, -0.1, 0.4);
part_type_direction(global.p_fire_2, 0, 359, 0, 0);
part_type_blend(global.p_fire_2, true);
part_type_life(global.p_fire_2, 15, 20);
part_type_orientation(global.p_fire_2, 0, 0, 0, 0, true);
#endregion

#region Asteroid Remains
global.p_ast_shard = part_type_create();
//part_type_shape(global.p_ast_shard, pt_shape_);
part_type_size(global.p_ast_shard, 1, 1, 0, 0);
part_type_color3(global.p_ast_shard, c_yellow, c_orange, c_red);
part_type_alpha3(global.p_ast_shard, 1, 1, 0);
part_type_speed(global.p_ast_shard, 11, 12, -0.5, 0.2);
part_type_direction(global.p_ast_shard, 0, 359, 0, 20);
part_type_blend(global.p_ast_shard, true);
part_type_life(global.p_ast_shard, 15, 20);
//part_type_orientation( ind, ang_min, ang_max, ang_incr, ang_wiggle, ang_relative );

#endregion