/// @description Fire laser beam
// You can write your code in this editor

// Simultaneously check for ship and asteroids within line of fire
var rAst	= collision_line_point(x, y, obj_player.x, obj_player.y, obj_asteroid, true, true);
var rShip	= collision_line_point(x, y, obj_player.x, obj_player.y, obj_player, true, true);
var dAst	= point_distance(x,y,rAst[1],rAst[2]);
var dShip	= point_distance(x,y,rShip[1],rShip[2]);
var aAst	= point_direction(x,y,rAst[1],rAst[2]);
var aShip	= point_direction(x,y,rShip[1],rShip[2]);
// r[0] holds the nearest (hit) instance.
// r[1], r[2] are X and Y coordinates of said instance.
// dAst/dShip holds the distance to hit instance.
// aAst/aShip holds the angle toward the instance.

if (rAst[0] != noone && rShip[0] = noone) { 		// If only an asteroid is hit
	var b = instance_create_layer(x,y,"InstancesHigh",obj_beam);
	b.image_xscale = dAst;
	b.image_angle = aAst;
	rAst[0].dBuffer += beamDamage;
}
else if (rShip[0] != noone && rAst[0] = noone) {		// If only the ship is hit
	var b = instance_create_layer(x,y,"InstancesHigh",obj_beam);
	b.image_xscale = dShip;
	b.image_angle = aShip;
	rShip[0].dBuffer += beamDamage;
}
else if (rShip[0] && rAst[0] != noone) {		// If both asteroid and ship are detected in firing line
	if (dAst < dShip) {			// Asteroid is closer than ship
		var b = instance_create_layer(x,y,"InstancesHigh",obj_beam);
		b.image_xscale = dAst;
		b.image_angle = aAst;
		rAst[0].dBuffer += beamDamage;
	}
	else {			// Ship is closer than asteroid
		var b = instance_create_layer(x,y,"InstancesHigh",obj_beam);
		b.image_xscale = dShip;
		b.image_angle = aShip;
		rShip[0].dBuffer += beamDamage;
	}
}
else {
	var b = instance_create_layer(x,y,"InstancesHigh",obj_beam);
	b.image_xscale = room_width*1.5;
}
audio_stop_sound(chargeID);
audio_play_sound(sfx_lasFire, 2, 0);
audio_play_sound(sfx_lasEvil, 2, 0);

stance = "holding"





