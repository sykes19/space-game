/// @description Insert description here
// You can write your code in this editor
if first = 1 {
	image_xscale = 1*scale;
	image_yscale = image_xscale;
	first = 0;
}

image_xscale	-= 0.02;
image_yscale	= image_xscale;
image_angle		+= 15;

if image_xscale <= 0 then instance_destroy();
