/// @description Insert description here
// You can write your code in this editor
if instance_exists(spawnShield) == false
{
	lives -= 1;
	audio_play_sound(sfx_explode, 2, 0);
	instance_destroy();
	repeat(10){
	// CREATE-PARTICLE
}

//obj_director.alarm[2] = 60;

}

if instance_exists(spawnShield) == true
{
	audio_play_sound(sfx_shield_buzz,2,0);
	with(other)
	{
		instance_destroy();
	}
	repeat(10){
		//CREATE-PARTICLE
	}
}