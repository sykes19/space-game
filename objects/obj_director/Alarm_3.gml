/// @description Threat Wave
// You can write your code in this editor

if(room == rm_game){ // If we are on the game screen
	
// Threat-based spawning
if (global.dir_budget <= global.dir_par) // Make sure there's any budget at all
{
	if (random_range(1,100) <= excitement/3) // Chance to spawn a wave, max of 33% if map is clear
	{
		//audio_play_sound(sfx_pew3,2,0);
		/* The budget for this spawn wave is 25% of availble budget + 12.5% of available budget increased
		by a multiplier based on how many waves we've not spawned anything */
		budget_usable = (global.dir_budget/4) + ((global.dir_budget/8)*(budget_bonus/4));
		// Budget per-spawn cannot exceed 70% of target threat level
		if budget_usable > global.dir_par*0.7 {
			var old_budget = budget_usable;
			budget_usable = global.dir_par*0.7;			// How much budget was trimmed off?
			var budget_diff = abs(budget_usable-old_budget);
			// Convert trimmed budget to boredom currency
			// This currency is used for spawning enemies and events
			var boredom_boost = (global.dir_difficulty*(budget_diff/global.dir_budget))*25
			// Gain less boredom for each enemy on the screen. Enemies aren't boring.
			global.dir_boredom += boredom_boost / (1+(instance_number(obj_enemy)/4));
			show_debug_message("Boredom increased by: "+string(boredom_boost));
		}
		while (budget_usable > 0) // While we have budget to spend
		{
			var aThreat = 0;				// This is used to keep track of how much threat I've spawned
			switch(choose(1,1,2,2,3))		// Choose an asteroid to spawn
			{								// Asteroids provide threat/reduce budget themselves
				case 1:
				aThreat = spawn_asteroid("huge");
				break;
				case 2:
				aThreat = spawn_asteroid("med");
				break;					
				case 3:
				aThreat = spawn_asteroid("small");
				break;
			}
			budget_usable -= aThreat;
		}
		budget_bonus = 0; // Mark that we've successfully spawned enemies this time.
	}
	// Count how many times we have not spawned anything while under par
	else if (stress < 1 && spawn_cooldown == 0) { budget_bonus += 1; }
} 

// Boredom based events

// If the Director is bored, it will throw in a surprise regardless of budget.
// Roll a d100, with a success % of a third of the Boredom value.
if (random_range(1,100) <= global.dir_boredom/3) {
	// Decide whether it will be a good or a bad event based on stress.
	// Roll within a 50 unit range and multiple it by the stress ratio.
	// Weighted naturally to be enemies. Powerups should be rare here.
	var flip = 0;
	if(random_range(25,75)*stress) >= 60 then flip = 1; else flip = 0;
		// 1 is good, 0 is evil
		switch (flip) {
			// Time for some bullshit
			case 0:							// Spawn an enemy
			var amount = choose(1,1,2,3)	// Determine how many to spawn and remember that
			repeat(amount) {
				// Determine lvl of spawn by difficulty taking stress and amount into account.
				// Low stress means higher level, and higher spawn amount means lower overall level.
				// I also made it give or take a level just to add some spice to the mix.
				var eLevel = ( round(global.dir_difficulty) + round((1/stress)/2) ) + round( choose(-1,0,1) - (amount/1.5) )
				// These lines clamp the spawn level to a max of +3 over the current difficulty rating
				// And then I further clamp that to a max of 8 because that's just silly business
				eLevel = clamp(eLevel,1,(global.dir_difficulty+3));
				// Level 1 sniper is equal to level 3 turret. Prevent sniper spawn at low level.
				if eLevel <= 2 {
					eLevel = clamp(eLevel,1,8);
					spawn_enemy("turret", eLevel);
				}
				else if eLevel >= 3 {
					var eType = choose("sniper", "turret");
					if eType == "sniper" { eLevel = eLevel-2; }
					spawn_enemy(eType, eLevel);
				}
			}
			global.dir_boredom -= global.dir_boredom*(0.6+(amount/8));	// Reduce Boredom based on how many spawned
			break;
				
			case 1:		// Spawn a powerup
			spawn_powerup(irandom_range(150,room_width-150),irandom_range(150,room_height-150),"any");
			global.dir_boredom -= global.dir_boredom*0.4;	// Reduce Boredom by 40%
			break;
	}
}
	

}
alarm[3] = wave_interval;