/// @description Insert description here
// You can write your code in this editor
if instance_exists(spawnShield) == false
{

lives -= 1;


audio_play_sound(sfx_pew, 2, 0);
audio_play_sound(sfx_pew3, 2, 0);
repeat(10){
	instance_create_layer(x,y,"Instances",obj_debris);
}

obj_spawner.alarm[0] = 60;

instance_destroy();
}

if instance_exists(spawnShield) == true
{
	with(other)
	{
		instance_destroy();
	}
	audio_play_sound(sfx_pew, 2, 0);
	audio_play_sound(sfx_pew3, 2, 0);
	repeat(10){
		instance_create_layer(x,y,"Instances",obj_debris);
	}
}