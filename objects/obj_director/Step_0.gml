/// @description Difficulty adjustment
// You can write your code in this editor

global.dir_astThreat = instance_number(obj_asteroid)*3;

// Wait for >>Alarm 1 before difficulty scaling begins
if spawn_cooldown = 0 {
	// Threat goal (par) will increase as the difficulty rises
	global.dir_par = par_target_base * global.dir_difficulty;

	// The timer for increasing difficulty is based on how much stress the player is under
	// Lower stress, faster time
	difficulty_crawl = base_difficulty_crawl * stress;
}

// Threat adjusted for asteroid amount and player threat.
adjThreat = global.dir_threat + global.dir_astThreat - global.pThreat;
if adjThreat < 10 then adjThreat = 10;

// Budget is how much threat is available to convert into enemies and hazards
global.dir_budget = global.dir_par - adjThreat;

// Excitement is a raw percentage representing how much of the budget is compared to the par
// It's used in >>Alarm 3 to decide chance to spawn a wave
excitement = (global.dir_budget / global.dir_par) * 100


// A ratio of how dangerous the world is VS how dangerous it should be. Higher value is more danger.
stress = adjThreat / global.dir_par;
if stress < 0.1 then stress = 0.1;


// DEBUG COMMANDS
if keyboard_check_pressed(vk_f5)
{
	spawn_enemy("turret");
}
if keyboard_check_pressed(vk_f2) {
	instance_create_layer(mouse_x,mouse_y,"InstancesHigh",obj_pickup);
}