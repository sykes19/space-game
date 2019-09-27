/// @description Insert description here
// You can write your code in this editor
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