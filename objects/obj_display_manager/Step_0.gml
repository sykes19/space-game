/// @description Insert description here
// You can write your code in this editor
if keyboard_check_pressed(vk_f4) {
	window_set_fullscreen(!window_get_fullscreen())
	if (window_get_fullscreen() == false) window_set_size(ideal_width/2,ideal_height/2);
}
if room == rm_game cursor_sprite = spr_crosshair;
else cursor_sprite = spr_cursor;



//a = application_get_position();
//xx = a[0];
//yy = a[1];
//ww = a[2] - a[0];
//hh = a[3] - a[1];
//wRatio = ww / GUIw;
//hRatio = hh / GUIh;

display_set_gui_size(ideal_width,ideal_height);