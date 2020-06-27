/// @description Damage check
// You can write your code in this editor

// Set condition to normal if not already
condition = "normal";

// Only process damage if not currently in hitstun
if stance != "stun" {
	// Verify status of shields, if any
	if shields > 0 || instance_exists(spawnShield) {
		shielded = true;
	}
	else shielded = false;

	// Apply damage from buffer, if it exists, and trigger damage scenario
	if dBuffer > 0 and shielded == true {		// Took damage, but are shielded
		condition = "damaged";					// Tell engine about it
		audio_play_sound(sfx_shield_buzz,2,0);	// Bzzt
		dBuffer = 0;							// Empty damage buffer
		if instance_exists(spawnShield) != true {
			shields -= 1	// Remove a layer of shielding if it's not the spawnShield
		}	
	}
	if dBuffer > 0 and shielded == false {		// Took damage, and have no shields
		condition = "damaged";
		hp -= dBuffer;							// Reduce HP
		dBuffer = 0;							// Empty damage buffer
		audio_play_sound(sfx_oof,2,0);
	}
}

// Sanity check. Used for debugging if negative damage is dealt.
if dBuffer < 0 then dBuffer = 0;	

// Trigger death scenario for step event if so
if hp <= 0 && state == "alive"
{
	state = "dead";
}