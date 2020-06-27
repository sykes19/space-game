/// @description  State engine
#region Spawn expansion

if image_xscale < 1 { // Expand magically! For fun!
	image_xscale += 0.2;
	image_yscale = image_xscale;
}


#endregion

// Basic format for state engine

if state == "alive" {
	
	if condition == "damaged" {
		
	}		
}

if state == "dead" {
}