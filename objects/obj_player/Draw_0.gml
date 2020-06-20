/// @description Insert description here
// You can write your code in this editor
if state == "alive" {
	draw_self();
	
	if powAbility == true {
		draw_line_width_color(x-(alarm[6]/120),y+34,x+(alarm[6]/120),y+34,2,c_blue,c_blue);
		draw_sprite_ext(spr_powBlue,0,x-38,y+42,0.8,0.8,0,-1,1);
	}	
	if powSpread == true {
		draw_line_width_color(x-(alarm[7]/120),y+36,x+(alarm[7]/120),y+36,2,c_green,c_green);
		draw_sprite_ext(spr_powGreen,0,x-38,y+30,0.8,0.8,0,-1,1);
	}	
}