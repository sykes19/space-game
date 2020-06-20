/// @description Insert description here
// You can write your code in this editor

// On death, have a % chance to drop a powerup
if irandom_range(1,100) > 8 then spawn_powerup(x,y,"any");

// Inherit the parent event
event_inherited();

