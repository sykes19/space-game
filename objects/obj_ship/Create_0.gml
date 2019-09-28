/// @description Insert description here
// You can write your code in this editor

#region INIT

script_execute(ship_weapons, "init");
image_speed = 0;
pod =				noone;
missiles =			0;
barrageActive =		0;
barrageCooldown =	0;
spawnShield =		noone;
input =				"mouse"; // This is to prevent errors when ship spawns
#endregion

#region BALANCE
mRefire =	6;
mReload =	45;
accel =		0.3;
topspeed =	3.5;
decel =		0.1;

// Variable which will reference what missile pod to fire out of
activePod = noone;
// Missile launch directions
pod = array_create(6);
array_set(pod, 0, 100);
array_set(pod, 1, 260);
array_set(pod, 2, 80);
array_set(pod, 3, 280);
array_set(pod, 4, 60);
array_set(pod, 5, 300);

#endregion

if lives < 4
{
	spawnShield = instance_create_layer(x,y,"Instances",obj_shield);
	alarm_set(1,120);
}
alarm_set(0,60);





