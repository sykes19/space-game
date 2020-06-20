/// @description Debug commands
// You can write your code in this editor

// DEBUG COMMANDS
if keyboard_check_pressed(vk_f1) {
	if debugMode == 0 then debugMode = 1;
	else debugMode = 0;
}

if keyboard_check_pressed(vk_f5)
{
	spawn_enemy("sniper", choose(1,2,3,4,5));
}
if keyboard_check_pressed(vk_f6)
{
	spawn_enemy("turret", choose(1,2,3,4,5));
}
if keyboard_check_pressed(vk_f2) {
	instance_create_layer(mouse_x,mouse_y,"InstancesHigh",obj_pickup);
}