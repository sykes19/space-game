/// @description Insert description here
// You can write your code in this editor
event_inherited();
#region INIT
_list = ds_list_create();
ship_weapon_init();
input				= "mouse";	// This is to prevent errors when ship spawns
alarm[0]			= 60;		// Start missile recharging
aniSpeed			= 2;	// Speed the ship animation plays
aniDelay			= 10;	// Delay before closing ship up after ability expires
abilityActive		= 0;
powAbGet			= false;
powSpGet			= false;
#endregion
#region BALANCE
hp			= 1;
accel		= 1.5;		// Acceleration value
topspeed	= 7;		// Speed value
decel		= 0.8;		// Used to calculate drag
#endregion