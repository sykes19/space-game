/// @description Insert description here
// You can write your code in this editor

#region INIT
script_execute(ship_weapons, "init");
_list = ds_list_create();
condition			= "normal";
stance				= "free";
state				= "alive";
dBuffer				= 0;	// Buffer to apply damage from outside sources
hp					= 1;	// Absolute health value
image_speed			= 0;
image_index			= 0;
spawnShield			= noone;
image_xscale		= 0.01;		// Start tiny! Expands in >>Step
image_yscale		= 0.01;
input				= "mouse";	// This is to prevent errors when ship spawns
alarm[0]			= 60;		// Start missile recharging
#endregion
#region BALANCE
aniSpeed =	2;		// Speed the ship animation plays
aniDelay =	10;		// Delay before closing ship up after firing missiles
mRefire =	6;		// Time between missiles firing
mReload =	25;		// How long between missile recharging
accel =		1.5;	// Acceleration value
topspeed =	7;		// Speed value
decel =		0.8;	// Used to calculate drag
#endregion
#region MISSILES
pod					= noone;
missiles			= 0;	// How many missiles
barrageActive		= 0;
barrageCooldown		= 0;
missilesCharged		= 0;
activePod			= noone;// INIT - - -
podSide				= 0;	// Which side to fire the first missile
pod = array_create(6);		// Missile launch directions
array_set(pod, 0, 100);
array_set(pod, 1, 260);
array_set(pod, 2, 80);
array_set(pod, 3, 280);
array_set(pod, 4, 60);
array_set(pod, 5, 300);
// Start missile recharging
alarm[0] = mReload*2.5;
#endregion