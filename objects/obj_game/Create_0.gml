/// @description
// You can write your code in this editor
score = 0;
lives = 3;

gamepad = 0;
mouse = 1;
input = mouse;

draw_set_font(fnt_text);
audio_play_sound(sng_violet,2,1)

gamepad_set_axis_deadzone(0, 0.15);

global.key_select = vk_space
global.key_up = ord("W");
global.key_down = ord("S");
global.key_left = ord("A");
global.key_right = ord("D");
global.key_fire1 = mb_left;
global.key_fire2 = mb_right;

global.gp_select = gp_start;
global.gp_up = gp_padu
global.gp_down = gp_padd
global.gp_left = gp_padl
global.gp_right = gp_padr
global.gp_fire1 = gp_shoulderrb
global.gp_fire2 = gp_shoulderlb