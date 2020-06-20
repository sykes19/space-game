/// @description Insert description here
// You can write your code in this editor
if state == "alive" then draw_self();
if stance = "firing"
{
	draw_line_width_color(x,y,xL,yL,2,c_red,c_red);
	draw_line_width_color(x,y,xR,yR,2,c_red,c_red);
}
// DEBUG
//draw_text(x,y+40,+string(condition))