/// @description Display properties
// You can write your code in this editor

ideal_width = 0;
ideal_height = 540;

aspect_ratio = display_get_width()/display_get_height();

ideal_width = round(ideal_height*aspect_ratio);

// Make sure it's not odd
if(ideal_width & 1) ideal_width++;

/*for (var i = 1; i <= room_last; i++)
{
	if(room_exists(i)
	{
		
	}
}*/

surface_resize(application_surface,ideal_width,ideal_height);
window_set_size(ideal_width,ideal_height);
room_goto(rm_stars);
alarm[0] = 1;