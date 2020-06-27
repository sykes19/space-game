/// @description Thruster ignition
// You can write your code in this editor
thrusters = 1;
repeat(30)
{
	sparkle = instance_create_layer(x,y,"InstancesHigh",obj_thrusterParticle);
	sparkle.dir = angle-180;
}
audio_play_sound(sfx_whoosh,2,0);