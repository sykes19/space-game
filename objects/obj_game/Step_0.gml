/// @description Room control, input definitions
// You can write your code in this editor

if (gamepad_axis_value(0, gp_axisrh) != 0 ||
    gamepad_axis_value(0, gp_axisrv) != 0 ||
	gamepad_axis_value(0, gp_axislh) != 0 ||
	gamepad_axis_value(0, gp_axislv) != 0) {
		input = gamepad;
}
if (keyboard_check(ord("W")) ||
	keyboard_check(ord("A")) ||
	keyboard_check(ord("S")) ||
	keyboard_check(ord("D")) ||
	mouse_check_button(mb_any)) {
		input = mouse;
}

if (gamepad_button_check_pressed(0,gp_start)){
	switch(room){
		case rm_start:
			room_goto(rm_game);
			audio_play_sound(sfx_fanfare,2,0);
			break;
			
		case rm_win:
		case rm_gameover:
			game_restart();
			break;
	}
}
if (room == rm_game){
	
	if (score >= 1500){
		room_goto(rm_win);
		audio_play_sound(sfx_fanfare,2,0);
	}

	if (lives <= 0){
		room_goto(rm_gameover);
		audio_pause_sound(sng_violet);
		audio_play_sound(sfx_lose,2,0);
	}
}