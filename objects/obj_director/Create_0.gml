/// @description Insert description here
// You can write your code in this editor
#region Star spawning
instance_create_layer(0,0,"Instances",obj_cursor);
// Create the cursor
repeat(500){ instance_create_layer(irandom_range(-room_width/2, room_width),irandom_range(-room_height, room_height), "Instances", obj_star); }
// Fill the screen with stars, as well as those off to the left of the screen, as they will fall in
room_goto(rm_start);
alarm[0] = 1; // Trigger star spawn code
#endregion
#region Director INIT
global.dir_threat		= 0; // How much threat exists globally.
global.dir_difficulty	= 1; // How hard is the game right now.
global.dir_par			= 0; // Target for threat to be at.
global.dir_boredom		= 0; // Value to determine when the director will spice things up.
#endregion