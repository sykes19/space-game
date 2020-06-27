/// @description Insert description here
// You can write your code in this editor
if powType != 0 {
	draw_self();
	switch (powType) {
		case "spread":
			draw_sprite_ext(spr_powGreen,0,x,y,dScale,dScale,0,-1,1);
			break;
		case "shield":
			draw_sprite_ext(spr_powOrange,0,x,y,dScale,dScale,0,-1,1);
			break;
		case "ability":
			draw_sprite_ext(spr_powBlue,0,x,y,dScale,dScale,0,-1,1);
			break;
	}
}