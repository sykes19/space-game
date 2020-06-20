/// @description Refire timer
// You can write your code in this editor

// If you have ammo, fire a shot and reset timer
if ammoLeft > 0 {
	event_user(1);
	ammoLeft -= 1;
	alarm[2] = refireTime;
	alarm[1] = -1;
}
// If out of ammo, chill out for a second and stop this timer
else {
	stance = "holding";
	alarm[2] = -1;
	alarm[1] = hold_time;
}