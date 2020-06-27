/// @description Star spawn timer
// You can write your code in this editor

// Spawn stars throughout the game across the top of the screen, and to the left so they fall inward
var xx = irandom_range(-room_width, room_width);
var yy = 0;
instance_create_layer(xx, yy, "InstancesLow", obj_star);
alarm[0] = 3; // This is the tick rate for star spawning.


