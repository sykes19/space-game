/// @description Insert description here
// You can write your code in this editor
thrusters = 1;
repeat(20)
{
	sparkle = instance_create_layer(x,y,"InstancesHigh",obj_thrusterParticle);
	sparkle.dir = angle-180;
}
audio_play_sound(sfx_thrust,2,0);