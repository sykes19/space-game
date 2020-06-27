function spawn_asteroid() {
	var type = argument[0];
	var satisfied = 0;

	// Choose a random location on the edge of the screen to spawn an asteroid
	// If it's near the player, try again until it isn't
	while (!satisfied) {
		if(choose(0,1) == 0) {
			var xx = choose(irandom_range(20,800), room_width-(irandom_range(20,800)));			// Spawn on the sides
			var yy = irandom_range(20, room_height-20);
		} else {
			var xx = irandom_range(20, room_width-20);	// Spawn on the top or bottom
			var yy = choose(irandom_range(20,400), room_height-(irandom_range(20,400)));
		}
		if instance_exists(obj_player) {  // If the player exists, check if the spawn is too close
			if (point_distance(xx,yy,obj_player.x,obj_player.y) > 500) {
				satisfied = 1;							// Confirm the spawn is safe
			}
		}
		// If the player doesn't exist, default the no-spawn zone to the center.
		else if point_distance(xx,yy,room_width/2,room_height/2) > 500 then satisfied = 1;
	}

	// Spawn the asteroid, and tell it to move toward the center of the screen roughly.
	if type == "small" {
		var new_asteroid = instance_create_layer(xx,yy,"Instances",obj_asteroid);
		global.dir_threat += new_asteroid.threat_small; // Add threat
		new_asteroid.sprite_index = spr_asteroid_small;
		new_asteroid.dir = point_direction(new_asteroid.x, new_asteroid.y, room_width/2, room_height/2) + irandom_range(-30,30);
		return new_asteroid.threat_small;
	}
	if type == "med" {
		var new_asteroid = instance_create_layer(xx,yy,"Instances",obj_asteroid);
		global.dir_threat += new_asteroid.threat_med;
		new_asteroid.sprite_index = spr_asteroid_med;
		new_asteroid.dir = point_direction(new_asteroid.x, new_asteroid.y, room_width/2, room_height/2) + irandom_range(-30,30);
		return new_asteroid.threat_med;
	}
	if type == "huge" {
		var new_asteroid = instance_create_layer(xx,yy,"Instances",obj_asteroid);
		global.dir_threat += new_asteroid.threat_huge;
		new_asteroid.sprite_index = spr_asteroid_huge;
		new_asteroid.dir = point_direction(new_asteroid.x, new_asteroid.y, room_width/2, room_height/2) + irandom_range(-30,30);
		return new_asteroid.threat_huge;
	}



}
