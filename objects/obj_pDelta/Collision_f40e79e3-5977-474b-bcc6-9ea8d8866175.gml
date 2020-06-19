/// @description Insert description here
// You can write your code in this editor
if instance_exists(spawnShield) == false
{
	dBuffer += 100;
}

if instance_exists(spawnShield) == true
{
	audio_play_sound(sfx_shield_buzz,2,0);
	with(other)
	{
		hp -= maxhp+1;
	}
	repeat(10){
		//CREATE-VOOM-SHIELD-PARTICLE
	}
}