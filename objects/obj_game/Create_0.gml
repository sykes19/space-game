/// @description
// You can write your code in this editor
score		= 0;
lives		= 3;

gamepad		= 0;
mouse		= 1;
input		= mouse;

global.view_width		= camera_get_view_width(view_camera[0])
global.view_height		= camera_get_view_height(view_camera[0])
global.pause			= false;

draw_set_font(fnt_text);
audio_play_sound(sng_violet,2,1);
display_set_gui_size(global.view_width, global.view_height);
display_set_gui_maximise(2,2,0,0);
gamepad_set_axis_deadzone(0, 0.15);

global.key_select	= vk_space;
global.key_up		= ord("W");
global.key_down		= ord("S");
global.key_left		= ord("A");
global.key_right	= ord("D");
global.key_fire1	= mb_left;
global.key_fire2	= mb_right;

global.gp_select	= gp_start;
global.gp_up		= gp_padu;
global.gp_down		= gp_padd;
global.gp_left		= gp_padl;
global.gp_right		= gp_padr;
global.gp_fire1		= gp_shoulderrb;
global.gp_fire2		= gp_shoulderlb;

enum menu_page {
	main,
	settings,
	controls,
	height
}

enum menu_element_type {
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input
}

// CREATE MENU PAGES
ds_menu_main = create_menu_page(
	["RESUME",		menu_element_type.script_runner,	resume_game],
	["SETTINGS",	menu_element_type.page_transfer,	menu_page.settings],
	["EXIT",		menu_element_type.script_runner,	exit_game]
);

ds_menu_settings = create_menu_page(
	["VOLUME",		menu_element_type.slider,			change_volume,		1,		[0,1]],
	["RESOLUTION",	menu_element_type.shift,			change_resolution,	0,		["640 x 480","800 x 600","1280 x 720","1920 x 1080"]],
	["WINDOW MODE", menu_element_type.toggle,			change_window_mode, 1,		["Fullscreen", "Window"]],
	["CONTROLS",	menu_element_type.page_transfer,	menu_page.controls],
	["BACK",		menu_element_type.page_transfer,	menu_page.main]
);

ds_menu_controls = create_menu_page(
	["UP",			menu_element_type.input,			"key_up",			vk_up],
	["DOWN",		menu_element_type.input,			"key_down",			vk_down],
	["LEFT",		menu_element_type.input,			"key_left",			vk_left],
	["RIGHT",		menu_element_type.input,			"key_right",		vk_right],
	["SELECT",		menu_element_type.input,			"key_select",		vk_space],
	["PRIMARY",		menu_element_type.input,			"key_fire1",		mb_left],
	["SECONDARY",	menu_element_type.input,			"key_fire2",		mb_right],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings]
);

page = 0;
menu_pages = [ds_menu_main,ds_menu_settings,ds_menu_controls];

var i = 0, array_len = array_length_1d(menu_pages);
repeat(array_len){
	menu_option[i] = 0;
	i++;
}