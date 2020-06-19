/// @description 
// You can write your code in this editor
event_inherited();
#region Controls
if (gamepad_axis_value(0, gp_axisrh) != 0 ||
    gamepad_axis_value(0, gp_axisrv) != 0 ||
	gamepad_axis_value(0, gp_axislh) != 0 ||
	gamepad_axis_value(0, gp_axislv) != 0) {
		input = "gamepad";
}
if (keyboard_check(global.key_up) ||
	keyboard_check(global.key_down) ||
	keyboard_check(global.key_right) ||
	keyboard_check(global.key_left) ||
	keyboard_check(global.key_select) ||
	mouse_check_button(mb_any)) {
		input = "mouse";
}
#endregion