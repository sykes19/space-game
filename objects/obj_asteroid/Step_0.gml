/// @description Movement and death check
// You can write your code in this editor

// Apply damage from buffer, if it exists.

move_wrap(true,true,sprite_width); // Wrap around the screen

// Spin with some minor variation
image_angle += spin;


	

// Expand rapidly to create a smooth spawning effect
if image_xscale < 1 {
	image_xscale += 0.2;
	image_yscale = image_xscale;
}

// Move in your given direction, with your given speed
moveX = lengthdir_x(spd, dir);
moveY = lengthdir_y(spd, dir);
x += moveX;	
y += moveY;

// Death code activated if health hits 0, keeping track of "overkill" damage
if hp <= 0
{
	instance_destroy();
	
	// Determine what asteroids to spawn on death based on size
	if(sprite_index == spr_asteroid_huge){
		audio_play_sound(sfx_hit_bg,2,0);
		repeat(choose(1,2,2)){	// Decide how many asteroids to spawn on death
			var new_asteroid = instance_create_layer(x,y,"Instances",obj_asteroid);
			global.dir_threat += new_asteroid.threat_med;
			new_asteroid.sprite_index = spr_asteroid_med;
			new_asteroid.hp -= abs(hp)/2;		// Half of overkill damage from parent given to child
			new_asteroid.spd = spd + random_range(-0.8,0.8);	// Add momentum plus random variation
			new_asteroid.dir = dir + random_range(-30,30);		// Child inherets same rough direction
					// Both of these combined give the illusion of momentum
		}
	}
	if(sprite_index == spr_asteroid_med){
		audio_play_sound(sfx_hit_bg,2,0);
		repeat(choose(0,1,2,2)){	// Have a chance to spawn no children if you're a medium size
			var new_asteroid = instance_create_layer(x,y,"Instances",obj_asteroid);
			global.dir_threat += new_asteroid.threat_small;
			new_asteroid.sprite_index = spr_asteroid_small;
			new_asteroid.hp -= abs(hp)/2;
			new_asteroid.spd = spd + random_range(-0.8,0.8);	// This stuff is the same
			new_asteroid.dir = dir + random_range(-30,30);
		}
	}

}