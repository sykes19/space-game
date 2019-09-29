/// @description Display properties
// You can write your code in this editor
global.screenw          = display_get_width();
global.screenh			= display_get_height();
global.view_width		= camera_get_view_width(view_camera[0]);
global.view_height		= camera_get_view_height(view_camera[0]);
global.gWidth			= display_get_gui_width()
global.gHeight			= display_get_gui_height()

ideal_width = 0;
ideal_height = 1080;
GUIh = 1080;
GUIw = 1920;

aspect_ratio = display_get_width()/display_get_height();

ideal_width = round(ideal_height*aspect_ratio);

// Make sure it's not odd
if(ideal_width & 1) ideal_width++;

display_set_gui_size(ideal_width,ideal_height);
surface_resize(application_surface,ideal_width,ideal_height);
window_set_size(ideal_width/2,ideal_height/2);


//display_set_gui_maximize(1,1,0,0);

room_goto(rm_stars);
alarm[0] = 1;