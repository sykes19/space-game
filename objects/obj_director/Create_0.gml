/// @description AI Initialization
// You can write your code in this editor
#region Star spawning
instance_create_layer(0,0,"Instances",obj_cursor);
// Create the cursor
repeat(500){ instance_create_layer(irandom_range(-room_width/2, room_width),irandom_range(-room_height, room_height), "InstancesLow", obj_star); }
// Fill the screen with stars, as well as those off to the left of the screen, as they will fall in
room_goto(rm_start);
alarm[0] = 1; // Trigger star spawn code
#endregion
#region Director INIT
global.dir_eneThreat	= 0;	// INIT - - - Each enemy adds threat
global.dir_astThreat	= 0;    // INIT - - - Each asteroid adds threat
global.dir_threat		= 1;	// INIT - - - How much hazard currency is in play >>Step
global.dir_difficulty	= 1;	// How hard is the game right now >>Step
global.dir_budget		= 0;	// INIT - - - Free currency to spawn hazards >>Step
global.dir_par			= 200;	// Target for how much threat should be in play >>Step
global.dir_boredom		= 0;	// INIT - - - Value to determine when the director will spice things up
global.pThreat			= 0;	// INIT - - - The threat level of the player
adjThreat				= 0;	// INIT - - - Adjusted threat after taking into account player
budget_usable			= 0;	// INIT - - - How much budget we can spend on the current wave >>Alarm 3
budget_bonus			= 0;	// INIT - - - >>Alarm 3
spawn_cooldown			= 1;	// Pause difficulty climb for first few seconds of game
par_target_base			= 500;	// during cool off period, ramp par up to this amount to start >>Alarm 1
par_inc_wait			= 120;	// How long to wait before increaseing par toward goal
par_inc_amount			= 25;	// Amount to increase initial par toward goal
excitement				= 0;	// INIT - - - >>Step
wave_interval			= 30;	// How often will the Director roll dice to spawn a wave
stress					= 0;	// INIT - - - >>Step

								// 3600 = 1 minute, 900 = 15 seconds, 60 = 1 second					
difficulty_crawl		= 900;	// Time until difficulty increases used in >>Step
base_difficulty_crawl	= 900;	// INIT - - - >>Room Start
boredom_crawl			= 60;	// Time until boredom ticks upwards used in >>Step
base_boredom_crawl		= 60;   // INIT - - - >>Room Start

#endregion
#region States INIT

#endregion