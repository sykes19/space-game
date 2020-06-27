/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if stance = "firing"
{
	draw_line_width_color(x,y,xL,yL,2,c_red,c_red);
	draw_line_width_color(x,y,xR,yR,2,c_red,c_red);
}

if obj_game.debugMode == 1
{
	draw_text(x+30,y+30,"Lv "+string(level));
}