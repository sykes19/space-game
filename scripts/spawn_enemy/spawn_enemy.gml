var type = argument[0];
var lvl = argument[1];
var satisfied = 0;

// Choose a random location somewhere near the edges of the screen
// If it's near the player, try again until it isn't
while (!satisfied) {
	if(choose(0,1) == 0){
		var xx = choose(irandom_range(80,400), room_width-(irandom_range(80,400)));			// Spawn on the sides
		var yy = irandom_range(80, room_height-80);
	} else {
		var xx = irandom_range(80, room_width-80);	// Spawn on the top or bottom
		var yy = choose(irandom_range(80,400), room_height-(irandom_range(80,400)));
	}
	if instance_exists(obj_player) {  // If the player exists, check if the spawn is too close
		if (point_distance(xx,yy,obj_player.x,obj_player.y) > 500) {
			satisfied = 1;							// Confirm the spawn is safe
		}
	}
	// If the player doesn't exist, default the no-spawn zone to the center.
	else if point_distance(xx,yy,room_width/2,room_height/2) > 500 then satisfied = 1
}

if type == "sniper" {
	var new_enemy = instance_create_layer(xx,yy,"InstancesHigh",obj_eSniper);
	if lvl != 0 then new_enemy.level = lvl;
	with new_enemy {event_user(0);}
}

