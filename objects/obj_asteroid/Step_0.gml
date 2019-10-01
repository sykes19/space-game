/// @description Insert description here
// You can write your code in this editor

move_wrap(true,true,sprite_width/2);
image_angle += 1;

if hp <= 0
{
	instance_destroy();
	
	if(sprite_index == spr_asteroid_huge){
		audio_play_sound(sfx_hit_bg,2,0);
		repeat(2){
			var new_asteroid = instance_create_layer(x,y,"Instances",obj_asteroid);
			new_asteroid.sprite_index = spr_asteroid_med;
			new_asteroid.hp -= abs(hp)/2;
		}
	}
	if(sprite_index == spr_asteroid_med){
		repeat(2){
			var new_asteroid = instance_create_layer(x,y,"Instances",obj_asteroid);
			new_asteroid.sprite_index = spr_asteroid_small;
			new_asteroid.hp -= abs(hp)/2;
		}
	}

}