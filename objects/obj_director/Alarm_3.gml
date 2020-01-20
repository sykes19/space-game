/// @description Threat Wave
// You can write your code in this editor

if(room == rm_game){ // If we are on the game screen
	
// Threat-based spawning
	if (global.dir_budget <= global.dir_par) // Make sure there's any budget at all
	{
		if (random_range(1,100) <= excitement/4) // Chance to spawn a wave, max of 20% if map is clear
		{
			//audio_play_sound(sfx_pew3,2,0);
			var new = global.dir_budget;
			var old = 0;
			/* The budget for this spawn wave is 25% of availble budget + 12.5% of available budget increased
			by a multiplier based on how many waves we've not spawned anything */
			budget_usable = (global.dir_budget/4) + ((global.dir_budget/8)*(budget_bonus/4));
			// Budget per-spawn cannot exceed 70% of threat value
			if budget_usable > global.dir_par*0.7 {
				var old_budget = budget_usable;
				budget_usable = global.dir_par*0.7;			// How much budget was trimmed off?
				var budget_diff = abs(budget_usable-old_budget);
				// Convert trimmed budget to boredom currency
				// Difference divided by budget creates a % of budget that was trimmed
				// Multiply that by difficulty, which is usually a multiplier that starts at 1 and goes up
				// Then multiply the entire thing by 20 because that number just felt right
				var boredom_boost = (global.dir_difficulty*(budget_diff/global.dir_budget))*20
				global.dir_boredom += boredom_boost;
				show_debug_message("Boredom increased by: "+string(boredom_boost));
			}
			while (budget_usable > 0) // While we have budget to spend
			{
				if new == old then {break;}			// If budget hasn't changed since last loop, break
				old = new;							// Save last wave's budget value
				
				switch(choose(1,1,1,2,2,3))		// Choose an asteroid to spawn
				{									// Asteroids provide threat/reduce budget themselves
				case 1:
				spawn_asteroid("huge");
				break;
				case 2:
				spawn_asteroid("med");	// These asteroids subtract from global.dir_budget
				break;					// Which then makes the calculation on line 35 progress the loop
				case 3:
				spawn_asteroid("small");
				break;
				}
				
				// Refresh budget value after asteroid spawn
				global.dir_budget = global.dir_par - global.dir_threat;
				// Remember what the new budget value is
				new = global.dir_budget
				// Subtract the difference between the new and old budget from usable budget
				if old != 0 then budget_usable -= (old-new);				
			}
			budget_bonus = 0; // Mark that we've successfully spawned enemies this time.
		}
		// Count how many times we have not spawned anything while under par
		else if (stress < 1 && spawn_cooldown == 0) { budget_bonus += 1; }
	} 

// Boredom based events

	// If the Director is bored, it will throw in a surprise regardless of budget.
	// Roll a d100, with a success % of half of the Boredom value.
	if (random_range(1,100) <= global.dir_boredom/5) {
		switch (choose("turret")) {
			case "turret":
			spawn_enemy("turret");							// Spawn a sniper platform
			global.dir_boredom -= global.dir_boredom*0.8;	// Reduce Boredom by 80%
			break;
		}
	}

}
alarm[3] = wave_interval;