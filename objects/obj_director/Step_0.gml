/// @description Difficulty adjustment
// You can write your code in this editor

// Wait for >>Alarm 1 before difficulty scaling begins
if spawn_cooldown = 0 {
	// Threat goal (par) will increase as the difficulty rises
	global.dir_par = par_target_base * global.dir_difficulty;

	// The timer for increasing difficulty is based on how much stress the player is under
	// Lower stress, faster time
	difficulty_crawl = base_difficulty_crawl * stress;
}

// Budget is how much threat is available to convert into enemies and hazards
global.dir_budget = global.dir_par - global.dir_threat;

// Excitement is a raw percentage representing how much of the budget is compared to the par
// It's used in >>Alarm 3 to decide chance to spawn a wave
excitement = (global.dir_budget / global.dir_par) * 100


// A ratio of how dangerous the world is VS how dangerous it should be. Higher value is more danger.
stress = global.dir_threat / global.dir_par;

if keyboard_check_pressed(vk_f5)
{
	spawn_enemy("turret");
}