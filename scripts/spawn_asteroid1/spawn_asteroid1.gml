var type = argument[0];
var satisfied = 0;

// Choose a random location on the edge of the screen to spawn an asteroid
// If it's near the player, try again until it isn't
while (!satisfied) {
	if(choose(0,1) == 0){
		var xx = choose(0, room_width);			// Spawn on the sides
		var yy = irandom_range(0, room_height);
	} else {
		var xx = irandom_range(0, room_width);	// Spawn on the top or bottom
		var yy = choose (0, room_height);
	}
	if (point_distance(xx,yy,obj_ship.x,obj_ship.y) > 300) // Is it far enough from the player?
	{ 
		satisfied = 1;							// Tell the queen she's ready
	}
}

// Spawn the asteroid, and tell it to move toward the center of the screen roughly.
if type == "small" {
	var new_asteroid = instance_create_layer(xx,yy,"Instances",obj_asteroid);
	new_asteroid.sprite_index = spr_asteroid_small;
	new_asteroid.dir = point_direction(new_asteroid.x, new_asteroid.y, room_width/2, room_height/2) + irandom_range(-30,30);
}
if type == "med" {
	var new_asteroid = instance_create_layer(xx,yy,"Instances",obj_asteroid);
	new_asteroid.sprite_index = spr_asteroid_med;
	new_asteroid.dir = point_direction(new_asteroid.x, new_asteroid.y, room_width/2, room_height/2) + irandom_range(-30,30);
}
if type == "huge" {
	var new_asteroid = instance_create_layer(xx,yy,"Instances",obj_asteroid);
	new_asteroid.sprite_index = spr_asteroid_huge;
	new_asteroid.dir = point_direction(new_asteroid.x, new_asteroid.y, room_width/2, room_height/2) + irandom_range(-30,30);
}
