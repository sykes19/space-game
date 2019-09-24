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