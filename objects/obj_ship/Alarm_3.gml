/// @description Open animation timer
// You can write your code in this editor
if image_index < image_number -1 {
	image_index += 1;
	show_debug_message("Opening pods...");
	alarm[3] = aniSpeed;
}
else if barrageActive == 0 
{
	alarm[4] = aniDelay;
	alarm[3] = -1;
}
else alarm[3] = 1;