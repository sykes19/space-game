/// @description Room control, input definitions
// You can write your code in this editor
if (gamepad_button_check_pressed(0,global.gp_select) || keyboard_check(global.key_select)){
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
	
	if (score >= 999999){
		room_goto(rm_win);
		audio_play_sound(sfx_fanfare,2,0);
	}

	if (lives <= 0){
		room_goto(rm_gameover);
		audio_pause_sound(sng_violet);
		audio_play_sound(sfx_lose,2,0);
	}
}