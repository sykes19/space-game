/// @description Insert description here
// You can write your code in this editor
wRatio = ideal_width / surface_get_width(application_surface);
hRatio = ideal_height / surface_get_height(application_surface);
display_set_gui_size(ideal_width,ideal_height);
show_debug_message("X: "+string(wRatio)+" Y: "+string(hRatio));
//display_set_gui_maximize(1,1,0,0)
alarm[0] = 1;