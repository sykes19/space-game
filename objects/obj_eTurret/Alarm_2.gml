/// @description Refire timer
// You can write your code in this editor

// If you have ammo, fire a shot and reset timer
if ammoLeft > 0 {
	event_user(1);			// Fire a "shot"
	ammoLeft -= 1;			// Reduce ammo left to use this volley
	alarm[2] = refireTime;	// Reset this alarm
	alarm[1] = -1;			// Reset the movement delay each shot fired
}
// If out of ammo, chill out for a second and stop this timer
else {
	stance = "holding";
	alarm[2] = -1;			// Stop this alarm
	alarm[1] = hold_time;	
}