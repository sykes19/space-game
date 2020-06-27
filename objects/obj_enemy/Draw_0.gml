/// @description Insert description here
// You can write your code in this editor
if state == "alive" then draw_self();

if condition == "damaged" {
	image_index = 1;
}
else image_index = 0;

// DEBUG
if obj_game.debugMode == 1
{
	draw_text(x+30,y+30,"Lv "+string(level));
	draw_text(x+30,y+50,"St "+string(stance));
}