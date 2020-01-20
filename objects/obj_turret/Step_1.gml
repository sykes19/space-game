/// @description Damage and death
// You can write your code in this editor

// Apply damage from buffer, if it exists
if dBuffer != 0 {
	hp -= dBuffer;
	dBuffer = 0;
}

// Death
if hp <= 0
{
	instance_destroy();
}