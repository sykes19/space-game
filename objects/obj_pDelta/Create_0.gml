/// @description Insert description here
// You can write your code in this editor
event_inherited();
#region INIT
_list = ds_list_create();
script_execute(ship_weapons, "init");
input				= "mouse";	// This is to prevent errors when ship spawns
alarm[0]			= 60;		// Start missile recharging
#endregion
#region BALANCE
hp			= 1;
aniSpeed	= 2;		// Speed the ship animation plays
aniDelay	= 10;		// Delay before closing ship up after firing missiles
mRefire		= 6;		// Time between missiles firing
mReload		= 25;		// How long between missile recharging
accel		= 1.5;		// Acceleration value
topspeed	= 7;		// Speed value
decel		= 0.8;		// Used to calculate drag
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