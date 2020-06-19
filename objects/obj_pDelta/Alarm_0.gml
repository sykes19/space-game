/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

missiles += 1;
if missiles == 6 {
	audio_play_sound(sfx_charged,2,false);
	missilesCharged = 1;
}