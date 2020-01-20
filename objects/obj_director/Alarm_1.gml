/// @description Spawn cooldown
// You can write your code in this editor
if global.dir_par < par_target_base {
	global.dir_par += par_inc_amount;
	alarm[1] = par_inc_wait;
}
else {
	// Begin difficulty scaling and disable spawn cooldown marker
	alarm[10] = base_difficulty_crawl;
	alarm[11] = base_boredom_crawl;
	spawn_cooldown = 0; // >>Step
}