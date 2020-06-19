/// @description Init Spawn
// You can write your code in this editor
if(room == rm_game){
	alarm[1] = par_inc_wait;	// Begin the spawn cool off period
	alarm[3] = wave_interval;	// Kick off the Director
	instance_create_layer(room_width/2,room_height/2,"Instances",obj_player); // It's me!
		repeat(10){					// Create some basic asteroids to begin play.
		switch(choose(1,1,1,1,2,2,2,3))		// Choose an asteroid to spawn
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
	}
}