/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if obj_game.debugMode == 1
{
	draw_text(x+30,y+30,"Lv "+string(level));
	draw_text(x+30,y+50,"St "+string(stance));
	draw_text(x+30,y+70,"Tm "+string(alarm[1]));
}