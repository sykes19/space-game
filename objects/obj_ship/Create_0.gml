/// @description Insert description here
// You can write your code in this editor
spawnShield = noone;
if lives < 4
{
	spawnShield = instance_create_layer(x,y,"Instances",obj_shield);
	alarm_set(1,120);
}
alarm_set(0,60);
input = "mouse"; // This is to prevent errors when ship spawns
fire = 18;
refire = 18;
accel = 0.3;
topspeed = 3.5;
decel = 0.09;
missiles = 0;