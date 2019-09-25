/// @description Score, lives, and debug text
// You can write your code in this editor

//draw_text(20,(room_height-20), "L H "+string(gamepad_axis_value(0, gp_axislh)));
//draw_text(20,(room_height-40), "L V "+string(gamepad_axis_value(0, gp_axislv)));
//draw_text(20,(room_height-60), "R H "+string(gamepad_axis_value(0, gp_axisrh)));
//draw_text(20,(room_height-80), "L V "+string(gamepad_axis_value(0, gp_axisrv)));
//if (input = mouse) draw_text(20,(room_height-100), "Device: mouse");
//else if (input = gamepad) draw_text(20,(room_height-100), "Device: gamepad");


switch(room){
	case rm_game:
		draw_text(20, 20, "SCORE: "+string(score));
		draw_text(20, 40, "LIVES: "+string(lives));
		break;
		
	case rm_start:
		var c = c_yellow;
		draw_set_halign(fa_center);
		draw_text_transformed_color(room_width/2,room_height/4,"SPACE GAME",4,4,0,c,c,c,c,1);
		draw_text(room_width/2, room_height/2.5,
		@"Hit START or SPACE to begin

Right Trigger / Left Click: Fire Blaster
Left Trigger / Right Click: Missile Launch
Left Stick / WASD: Move
Right Stick / Mouse: Aim

Get 1500 points to WIN!");
		draw_set_halign(fa_left);
		break;
		
	case rm_win:
		var c = c_lime;
		draw_set_halign(fa_center);
		draw_text_transformed_color(room_width/2,room_height/4,"OH, PETER!",4,4,0,c,c,c,c,1);
		draw_text(room_width/2, room_height/2.5,
		@"YOU DID IT PETER!

Press START or SPACE to play again!");
	
		break;
		
	case rm_gameover:
		var c = c_lime;
		draw_set_halign(fa_center);
		draw_text_transformed_color(room_width/2,room_height/4,"OH, PETER",4,4,0,c,c,c,c,1);
		draw_text(room_width/2, room_height/2.5,
		@"YOU LOST, PETER

Press START to try again!
SCORE: "+string(score));
		break;
}