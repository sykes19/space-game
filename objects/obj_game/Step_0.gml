/// @description Room control, menu triggers
// You can write your code in this editor
if (start_button == 1 || gamepad_button_check_pressed(0,global.gp_select) || keyboard_check(global.key_select)){
	switch(room){
		case rm_start:
			start_button = 0;
				// TEMP CODE TO DETERMINE SHIP SELECTION
			global.myShip = obj_pDelta;
			room_goto(rm_game);
			audio_stop_sound(sng_green);
			audio_play_sound(sng_everything,1,true);
			break;
			
		case rm_win:
		case rm_gameover:
			game_restart();
			break;
	}
}

if (room == rm_start && !instance_exists(obj_start_button))
{
	instance_create_layer(-128+obj_display_manager.ideal_width/2,obj_display_manager.ideal_height*0.65,"Instances",obj_start_button);
}

if (room == rm_game){
	if (score >= 999999){
		room_goto(rm_win);
		audio_play_sound(sfx_fanfare,2,0);
	}

	if (lives < 0){
		room_goto(rm_gameover);
		audio_pause_sound(sng_everything);
		audio_play_sound(sfx_lose,2,0);
	}
}