/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

//draw_text(x-20,y-20,(string(image_index)+"+"+string(image_number)));
//draw_text(room_width/2, 30, debugWeapons);

if missiles > 0 {
	draw_rectangle(x-31, y+40, x-23, y+43, false);
	if missiles > 1 {
	draw_rectangle(x-20, y+40, x-12, y+43, false);
	if missiles > 2 {
	draw_rectangle(x-9, y+40, x-1, y+43, false);
	if missiles > 3 {
	draw_rectangle(x+2, y+40, x+10, y+43, false);
	if missiles > 4 {
	draw_rectangle(x+13, y+40, x+21, y+43, false);
	if missiles > 5 {
	draw_rectangle(x+24, y+40, x+32, y+43, false);
					}
				}
			}
		}
	}
}