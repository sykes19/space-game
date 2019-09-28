/// @description Menu
// You can write your code in this editor
		if window_get_fullscreen() == 0 draw_set_font(fnt_debug_big);
		else draw_set_font(fnt_debug);
		draw_text(10, global.screenh-30, "F4: Toggle Fullscreen");
switch(room){
	case rm_game:
		draw_set_font(fnt_clean);
		draw_text(20, 20, "SCORE: "+string(score));
		draw_text(20, 40, "LIVES: "+string(lives));
		//draw_text(20, 20, "gui h/w: "+string(display_get_gui_width())+" + "+string(display_get_gui_height()));
		//draw_text(20, 40, "ratio: "+string(obj_display_manager.wRatio)+" + "+string(obj_display_manager.hRatio));


		break;
		
	case rm_start:
		var c = c_yellow;
		draw_set_halign(fa_center);
		draw_set_font(fnt_text);
		draw_text_transformed_color(global.screenw/2,global.screenh/4,"SPACE GAME",4,4,0,c,c,c,c,1);
		draw_set_font(fnt_clean);
		draw_text(global.screenw/2, global.screenh/2.5,
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
		draw_set_font(fnt_text);
		draw_text_transformed_color(global.screenw/2,global.screenh/4,"OH, PETER!",4,4,0,c,c,c,c,1);
		draw_set_font(fnt_clean);
		draw_text(global.screenw/2, global.screenh/2.5,
		@"YOU DID IT PETER!

Press START or SPACE to play again!");
	
		break;
		
	case rm_gameover:
		var c = c_lime;
		draw_set_halign(fa_center);
		draw_set_font(fnt_text);
		draw_text_transformed_color(global.screenw/2,global.screenh/4,"OH, PETER",4,4,0,c,c,c,c,1);
		draw_set_font(fnt_clean);
		draw_text(global.screenw/2, global.screenh/2.5,
		@"YOU LOST, PETER

Press START or SPACE to try again!
SCORE: "+string(score));
		break;
}




if(!global.pause) exit;

var gwidth = global.view_width, gheight = global.view_height;

var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);
var y_buffer = 32, x_buffer = 16;
var start_y = (gheight/2) - ((((ds_height-1)/2) * y_buffer)), start_x = gwidth/2;

//Draw Pause Menu "Back"
var c = c_black;
draw_rectangle_color(0,0,gwidth,gheight, c,c,c,c, false);

//Draw elements on Left Side
draw_set_valign(fa_middle);
draw_set_halign(fa_right);

var ltx = start_x - x_buffer, lty;

var yy = 0; repeat(ds_height){
	lty = start_y + (yy*y_buffer);
	draw_text(ltx, lty, ds_grid[# 0, yy]);
	yy++;
}

//Draw Dividing Line
draw_line(start_x, start_y, start_x, lty);


//Draw Elements on Right Side