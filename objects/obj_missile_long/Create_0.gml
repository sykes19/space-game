/// @description Insert description here
// You can write your code in this editor
thrusterCooldown = 20;
damage = 35;
angle = 0;
target = noone;

image_xscale = 0.1;
image_yscale = 0.1;
spd = 4;
topSpeed = 12;
splashTarget = 0;

searchRange = 1400;
searchCoin = 1;
canSearch = 0;

thrusters = 0;
angleThrust = 0;
ID = 0;
_splash = ds_list_create();
_othersHit = 0;
alarm_set(1,thrusterCooldown);
alarm_set(0,thrusterCooldown);
alarm_set(2,1);
alarm_set(3,10);
alarm_set(4,360);


