/// @description Insert description here
// You can write your code in this editor
score += 10;
audio_play_sound(sfx_hit_sm,2,0);
instance_create_layer(x,y,"Instances",obj_explosion);
instance_destroy();

with(other){
	instance_destroy();
	
	if(sprite_index == spr_asteroid_huge){
		audio_play_sound(sfx_hit_bg,2,0);
		repeat(2){
			var new_asteroid = instance_create_layer(x,y,"Instances",obj_asteroid);
			new_asteroid.sprite_index = spr_asteroid_med;
		}
	}
	if(sprite_index == spr_asteroid_med){
		repeat(2){
			var new_asteroid = instance_create_layer(x,y,"Instances",obj_asteroid);
			new_asteroid.sprite_index = spr_asteroid_small;
		}
	}
	
	repeat(10){
		instance_create_layer(x,y,"Instances",obj_debris);
	}
}