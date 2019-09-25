/// @description Insert description here
// You can write your code in this editor

if (gamepad_axis_value(0, gp_axisrh) != 0 ||
    gamepad_axis_value(0, gp_axisrv) != 0 ||
	gamepad_axis_value(0, gp_axislh) != 0 ||
	gamepad_axis_value(0, gp_axislv) != 0) {
		input = "gamepad";
}
if (keyboard_check(ord("W")) ||
	keyboard_check(ord("A")) ||
	keyboard_check(ord("S")) ||
	keyboard_check(ord("D")) ||
	keyboard_check(vk_space) ||
	mouse_check_button(mb_any)) {
		input = "mouse";
}