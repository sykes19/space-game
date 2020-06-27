/// @description Insert description here
// You can write your code in this editor
if powType != 0 {
	
	audio_play_sound(sfx_chirp3,2,0);
	switch (powType) {
		case "spread":
			other.powSpGet = true;
			break;
		case "shield":
			other.shields += 1;
			break;
		case "ability":
			other.powAbGet = true;
			break;
	}
	//PARTICLE SPRAY WOOOOO
	instance_destroy();
}
