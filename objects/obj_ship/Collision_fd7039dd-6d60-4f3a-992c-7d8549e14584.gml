/// @description Insert description here
// You can write your code in this editor
if instance_exists(spawnShield) == false
{
	lives -= 1;
	audio_play_sound(sfx_explode, 2, 0);
	repeat(10){
	instance_create_layer(x,y,"Instances",obj_debris);
}

obj_game.alarm[1] = 60;

instance_destroy();
}

if instance_exists(spawnShield) == true
{
	audio_play_sound(sfx_hit_sm,2,0);
	with(other)
	{
		instance_destroy();
	}
	repeat(10){
		instance_create_layer(x,y,"Instances",obj_debris);
	}
}