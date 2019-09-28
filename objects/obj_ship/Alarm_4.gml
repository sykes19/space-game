/// @description Closing animation timer
// You can write your code in this editor
if image_index > 0
{
	image_index -= 1;
	show_debug_message("Closing pods");
	alarm[4] = aniSpeed;
}

else alarm[4] = -1;