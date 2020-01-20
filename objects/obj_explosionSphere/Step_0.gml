/// @description Insert description here
// You can write your code in this editor

if expanding = 1 {
	if image_xscale < 1*scale {
	image_xscale += 0.1
	image_yscale += 0.1
	}
	else {
	image_xscale +=0.007
	image_yscale +=0.007
}

}

if image_index >= 29 {
	image_speed = 0;
}

if image_alpha <= 0 {
	instance_destroy();
}

image_alpha -= decay_rate;