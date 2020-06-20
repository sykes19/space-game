var xx = argument[0];
var yy = argument[1];
var type = argument[2];
if type == "any" then type = choose("spread", "ability");
var new_powerup = instance_create_layer(xx,yy,"InstancesHigh",obj_pickup);
new_powerup.powType = type;

