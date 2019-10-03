/// @description Insert description here
// You can write your code in this editor
if hovered == 1
{
	image_index = 1;
	if mouse_check_button_pressed(mb_left)
	{
		audio_play_sound(sfx_fanfare,2,0);
		alarm[0] = 30;
	}
}

else { image_index = 0; }