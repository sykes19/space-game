/// @description Insert description here
// You can write your code in this editor
thrusterCooldown = 20;
damage = 50;
target = 0;
spd = 4;
topSpeed = 8;
thrusters = 0;
angleThrust = 0;
_splash = ds_list_create();
_othersHit = 0;
alarm_set(1,thrusterCooldown);
alarm_set(0,thrusterCooldown);
