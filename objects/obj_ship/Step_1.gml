/// @description Insert description here
// You can write your code in this editor

if (gamepad_axis_value(0, gp_axisrh) != 0 ||
    gamepad_axis_value(0, gp_axisrv) != 0 ||
	gamepad_axis_value(0, gp_axislh) != 0 ||
	gamepad_axis_value(0, gp_axislv) != 0) {
		input = "gamepad";
}
if (keyboard_check(keyBindMove_N) ||
	keyboard_check(keyBindMove_S) ||
	keyboard_check(keyBindMove_E) ||
	keyboard_check(keyBindMove_W) ||
	keyboard_check(keyBindStart) ||
	mouse_check_button(mb_any)) {
		input = "mouse";
}