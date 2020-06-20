/// @description Fire Bullets
// You can write your code in this editor

var i = 0
if level <= 2 {
	repeat(4) {
		var shot = instance_create_layer(x,y,"InstancesHigh",obj_eBullet);
		shot.direction = angle+i;
		i += 90;
	}
	audio_play_sound(sfx_pewSoft,2,0);
}
if level <= 4 && level > 2 {
	repeat(6) {
		var shot = instance_create_layer(x,y,"InstancesHigh",obj_eBullet);
		shot.direction = angle+i;
		i += 60;
	}
	audio_play_sound(sfx_pewSoft,2,0);
}
if level > 4 {
	repeat(8) {
		var shot = instance_create_layer(x,y,"InstancesHigh",obj_eBullet);
		shot.direction = angle+i;
		i += 45;
	}
	audio_play_sound(sfx_pewSoft,2,0);
}
