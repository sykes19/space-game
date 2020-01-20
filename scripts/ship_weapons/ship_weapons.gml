var weaponAction = argument[0]; // First argument indicates the reason this script is called.

// Objects should call this action during creation (to initialize variables)
if (weaponAction == "init")
{
	weaponType = "basic";		// Currently selected weapon
	weaponLastType = "basic";	// Last weapon if changeed
	weaponCooldown = 18;		// How many frames since weapon last fired
	weaponCooldownCap = 100;	// Some limit to make sure it doesn't overflow

	weaponHunterSeq = 0;		// Used by "hunter" weapon to track burst state
	weaponHunterForce = 0;		// Used to force a 3rd round after firing 2
	return;
}

// Objects should call this action every step
if (weaponAction == "step")
{
	var weaponInput = argument[1]; // Current "fire" button state is passed in as an argument
	if(weaponCooldown < weaponCooldownCap) { weaponCooldown += 1; } // Update cooldown variable
	
	// Some weapons may requre "cleanup" code after changing off them.
	if (weaponType != weaponLastType)
	{
		switch (weaponLastType)
		{
			case "basic":
			{
				break; //basic weapon does not require cleanup
			}
			case "hunter":
			{
				weaponHunterSeq = 0;
				weaponHunterForce = 0;
				break;
			}
		}
	}
	// End cleanup
	
	// Weapon "step" code
	switch (weaponType)
	{		
		case "basic": // Basic cannon
		{
			if ((weaponInput > 0) && (weaponCooldown >= 18))
			{
				var iBullet = instance_create_layer(x,y,"Instances",obj_bullet);
				iBullet.direction = image_angle;
				iBullet.image_angle = image_angle;
				audio_play_sound(sfx_pew2, 2, 0);
				weaponCooldown = 0;
			}
			break;
		}
		
		case "hunter": // Metroid Prime Hunters inspired burst->charge weapon
		{
			if ((weaponInput > 0) || weaponHunterForce)
			// If the fire button is currently pressed, or the next shot is forced
			{
				if ((weaponHunterSeq < 3) && (weaponCooldown >= 7))
				{
					//if (weaponHunterForce == 1) { weaponHunterForce = 0; }
					var iBullet = instance_create_layer(x,y,"Instances",obj_bullet);
					iBullet.direction = image_angle;
					audio_play_sound(sfx_pew2, 2, 0);
					weaponCooldown = 0;
					weaponHunterForce = 0;
					weaponHunterSeq += 1; // We use this to track how many "burst" shots we've fired
					if (weaponHunterSeq == 2) { weaponHunterForce = 1; } //If we've fired two shots, force a third
				}
			}
			else // If the fire button is *not* currently pressed
			{
				if ((weaponHunterSeq == 3) && (weaponCooldown >= 20))
				// If we have already fired three bursts and the weapon has charged at least another 20 frames...
				{
					// Since we don't have any charged shots, I'll just fire a shotgun blast
					var iBullet = instance_create_layer(x,y,"Instances",obj_bullet);
					iBullet.direction = image_angle - 4;
					var iBullet = instance_create_layer(x,y,"Instances",obj_bullet);
					iBullet.direction = image_angle;
					var iBullet = instance_create_layer(x,y,"Instances",obj_bullet);
					iBullet.direction = image_angle + 4;
					if (weaponCooldown >= 35) // More shot if you charged it a bit longer
					{
						var iBullet = instance_create_layer(x,y,"Instances",obj_bullet);
						iBullet.direction = image_angle - 8;
						var iBullet = instance_create_layer(x,y,"Instances",obj_bullet);
						iBullet.direction = image_angle + 8;
					}
					audio_play_sound(sfx_pew2, 2, 0);
					weaponCooldown = 0;
				}
				weaponHunterSeq = 0; //Regardless of if we fired anything right now, releasing fire button resets burst counter
			}			
			break;
		}
	}
	weaponLastType = weaponType;
	return;
}