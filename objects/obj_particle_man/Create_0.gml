/// @description Insert description here
// You can write your code in this editor
global.p_sys = part_system_create_layer("InstancesLow", true);

#region Missile Explosion

global.p_klk = part_type_create();
part_type_sprite(global.p_klk, spr_klk, true, true, false);
part_type_size(global.p_klk, 0.6, 1.0, -0.01, 0);
part_type_scale(global.p_klk, 1, 1);
part_type_color1(global.p_klk, c_white);
part_type_alpha3(global.p_klk, 1, 1, 0);
part_type_speed(global.p_klk, 0, 0, 0, 0);
part_type_direction(global.p_klk, 0, 0, 0, 0);
part_type_blend(global.p_klk, true);
part_type_life(global.p_klk, 30, 30);
part_type_orientation(global.p_klk, 0, 0, 0, 0, 0);

global.p_klk_primer = part_type_create();
part_type_shape(global.p_klk_primer, pt_shape_pixel);
part_type_size(global.p_klk_primer, 1, 1, 0, 0);
part_type_alpha3(global.p_klk_primer, 0, 0, 0);
part_type_color1(global.p_klk, c_white);
part_type_speed(global.p_klk_primer, 0, 0, 0, 0);
part_type_direction(global.p_klk_primer, 0, 0, 0, 0);
part_type_blend(global.p_klk_primer, true);
part_type_life(global.p_klk_primer, 12, 24);
part_type_death(global.p_klk_primer, 1, global.p_klk);

global.p_cross = part_type_create();
part_type_sprite(global.p_cross, spr_cross, false, false, false);
part_type_size(global.p_cross, 1, 1, -0.05, 0);
part_type_scale(global.p_cross, 1, 1);
part_type_color1(global.p_cross, c_white);
part_type_alpha3(global.p_cross, 1, 0.7, 0);
part_type_speed(global.p_cross, 0, 0, 0, 0);
part_type_direction(global.p_cross, 0, 0, 0, 0);
part_type_blend(global.p_cross, true);
part_type_life(global.p_cross, 20, 20);
part_type_orientation(global.p_cross, 45, 45, 0, 0, 0);

global.p_sparkle = part_type_create();
part_type_shape(global.p_sparkle, pt_shape_pixel);
part_type_size(global.p_sparkle, 2, 2, 0, 0);
part_type_color1(global.p_sparkle, c_white);
part_type_alpha3(global.p_sparkle, 1, 0.9, 0);
part_type_speed(global.p_sparkle, 0.1, 0.2, 0, 0);
part_type_direction(global.p_sparkle, 0, 359, 0, 0);
part_type_blend(global.p_sparkle, true);
part_type_life(global.p_sparkle, 30, 50);

#endregion

#region Fire Pixels
global.p_fire_1 = part_type_create();
part_type_shape(global.p_fire_1, pt_shape_pixel);
part_type_size(global.p_fire_1, 2, 2, 0, 0);
part_type_color3(global.p_fire_1, c_yellow, c_orange, c_red);
part_type_alpha3(global.p_fire_1, 1, 1, 0);
part_type_speed(global.p_fire_1, 6, 10, -0.2, 0.2);
part_type_direction(global.p_fire_1, 0, 359, 0, 0);
part_type_blend(global.p_fire_1, true);
part_type_life(global.p_fire_1, 15, 25);

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

global.p_trail = part_type_create();
part_type_shape(global.p_trail, pt_shape_pixel);
part_type_size(global.p_trail, 2, 2, -0.04, 0);
part_type_alpha3(global.p_trail, 1, 0.6, 0);
part_type_blend(global.p_trail, true);
part_type_life(global.p_trail, 25, 25);
#endregion

#region Asteroid Parts
global.p_astChunk = part_type_create();
part_type_sprite(global.p_astChunk, spr_asteroid_chunk, false, false, true);
part_type_size(global.p_astChunk, 1, 1, 0, 0);
part_type_scale(global.p_astChunk, 1, 1);
part_type_color3(global.p_astChunk, c_white, c_white, c_white);
part_type_alpha3(global.p_astChunk, 1, 1, 0);
part_type_speed(global.p_astChunk, 0.5, 1.2, 0, 0);
part_type_direction(global.p_astChunk, 0, 359, 0, 0);
part_type_blend(global.p_astChunk, false);
part_type_life(global.p_astChunk, 40, 50);
part_type_orientation(global.p_astChunk, 0, 359, 0, 0, 0);

/*global.pa_vector_blue_L = part_type_create();
part_type_shape(global.pa_vector_blue_L, pt_shape_line);
part_type_size(global.pa_vector_blue_L, 1, 1, 0, 0);
part_type_scale(global.pa_vector_blue_L,0.4,0.15);
part_type_color3(global.pa_vector_blue_L, c_blue, c_blue, c_blue);
part_type_alpha3(global.pa_vector_blue_L, 1, 1, 0);
part_type_speed(global.pa_vector_blue_L, 0.5, 1.5, 0, 0);
part_type_direction(global.pa_vector_blue_L, 0, 359, 0, 0);
part_type_blend(global.pa_vector_blue_L, false);
part_type_life(global.pa_vector_blue_L, 30, 40);
part_type_orientation(global.pa_vector_blue_L, 0, 359, 1.5, 0, 0);
global.pa_vector_blue_R = part_type_create();
part_type_shape(global.pa_vector_blue_R, pt_shape_line);
part_type_size(global.pa_vector_blue_R, 1, 1, 0, 0);
part_type_scale(global.pa_vector_blue_R,0.4,0.15);
part_type_color3(global.pa_vector_blue_R, c_blue, c_blue, c_blue);
part_type_alpha3(global.pa_vector_blue_R, 1, 1, 0);
part_type_speed(global.pa_vector_blue_R, 0.5, 1.5, 0, 0);
part_type_direction(global.pa_vector_blue_R, 0, 359, 0, 0);
part_type_blend(global.pa_vector_blue_R, false);
part_type_life(global.pa_vector_blue_R, 30, 40);
part_type_orientation(global.pa_vector_blue_R, 0, 359, -1.5, 0, 0);  */



#endregion

#region Basic Particles
global.p_plink = part_type_create();
part_type_shape(global.p_plink, pt_shape_line);
part_type_size(global.p_plink, 0.1, 0.1, 0, 0);
part_type_color1(global.p_plink, c_white);
part_type_alpha3(global.p_plink, 1, 0.7, 0);
part_type_speed(global.p_plink, 2.5, 3, -0.1, 0);
part_type_direction(global.p_plink, 0, 359, 0, 0);
part_type_blend(global.p_plink, false);
part_type_life(global.p_plink, 10, 12);
part_type_orientation(global.p_plink, 0, 0, 0, 0, true);
#endregion
