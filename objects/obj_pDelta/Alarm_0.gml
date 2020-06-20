/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

missiles += 1;

if missiles == mCap {
	audio_play_sound(sfx_charged,2,false);
}