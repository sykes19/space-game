/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
abilityActive = barrageActive;

if state == "alive" {
	if (missiles < 6 && alarm[0] == 0) then alarm_set(0, mReload) // Reload missiles passively	
	if stance == "free" {
		// Missile Barrage ability activation
		if(gamepad_button_check(0, global.gp_fire2) || mouse_check_button(global.key_fire2))
		{ missile_barrage("prep"); }	// Initiate firing prep sequence if button is pressed
		if barrageActive == 1
		{ missile_barrage("active"); }	// Continue firing as long as conditions are met
	}
}
