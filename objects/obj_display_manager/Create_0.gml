/// @description Display properties
// You can write your code in this editor
global.screenw          = display_get_width();
global.screenh			= display_get_height();
global.view_width		= camera_get_view_width(view_camera[0]);
global.view_height		= camera_get_view_height(view_camera[0]);
surfH = surface_get_height(application_surface)
surfW = surface_get_width(application_surface);

ideal_width = 0;
ideal_height = 1080;

aspect_ratio = display_get_width()/display_get_height();

ideal_width = round(ideal_height*aspect_ratio);

// Make sure it's not odd
if(ideal_width & 1) ideal_width++;

wRatio = ideal_width / surfW;
hRatio = ideal_height / surfH;
show_debug_message("X: "+string(wRatio)+" Y: "+string(hRatio));
//display_set_gui_size(ideal_width,ideal_height);
surface_resize(application_surface,ideal_width,ideal_height);
window_set_size(ideal_width/2,ideal_height/2);

//display_set_gui_maximize(1,1,0,0);

room_goto(rm_stars);
alarm[0] = 1;