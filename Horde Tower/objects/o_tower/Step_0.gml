//-----------UPDATE INPUT
input_left						= keyboard_check(vk_left);
input_right						= keyboard_check(vk_right);
input_shoot						= keyboard_check(vk_up);

//-----------CHECK FOR DEATH
if life >= 4{
	audio_play_sound(snd_tower_death, 1, 0);
	instance_destroy();
}

//-----------RESET MOVE VARIABLES
move_dir						= 0;


//-----------INTENDED MOVEMENT
move_dir						+= (input_left - input_right);
velocity						+= move_dir;
if velocity >= spd
{
	velocity					= spd;
}
	
velocity						= lerp(velocity, 0, frict);

//-----------UPDATE DIRECTION AND POSITION OF GUN
dir += velocity;
x_offset						= lengthdir_x(90, dir);
y_offset						= lengthdir_y(90, dir);


//-----------COMBO SYSTEM
// gain combo from killing enemies
// once the combo is full - activate a random powerup
if(alarm[1] <= 0){
	if combo == combo_length
	{
		// Determine random powerup
		var powerup = irandom_range(1, 1);
		gun_state = gun_states.triple;
		
		// Start counting down to end of powerup
		alarm[1] = powerup_cooldown;
	}
}

// Reset gun_state if combo is less than combo_length
if combo < combo_length
{
	gun_state = gun_states.basic;
}

//-----------SHOOTING
if (input_shoot) {
	
#region BASIC GUN
	if gun_state					== gun_states.basic{
		// Check cooldown
		if (alarm[0] <= 0){
			// If off cooldown, create a bullet
			audio_play_sound(snd_shoot, 1, 0);
			var bullet				= instance_create_layer(x + x_offset, y + y_offset, "Instances", o_bullet);
			var bullet_angle		= dir + random_range(-inaccuracy, inaccuracy);
			bullet.dir				= bullet_angle;
			bullet.image_angle		= bullet_angle;
			alarm[0]				= shoot_cooldown;
		}
	}
#endregion

#region TRIPLE GUN
	if gun_state					== gun_states.triple{
		// Check cooldown
		if (alarm[0] <= 0){
			// If off cooldown, create a bullet
			audio_play_sound(snd_shoot, 1, 0);
			var bullet1				= instance_create_layer(x + x_offset, y + y_offset, "Instances", o_bullet);
			var bullet1_angle		= dir + random_range(-inaccuracy, inaccuracy);
			bullet1.dir				= bullet1_angle;
			bullet1.image_angle		= bullet1_angle;
			
			var bullet2				= instance_create_layer(x + x_offset, y + y_offset, "Instances", o_bullet);
			var bullet2_angle		= dir + random_range(-inaccuracy, inaccuracy);
			bullet2.dir				= bullet2_angle;
			bullet2.image_angle		= bullet2_angle;
			
			var bullet3				= instance_create_layer(x + x_offset, y + y_offset, "Instances", o_bullet);
			var bullet3_angle		= dir + random_range(-inaccuracy, inaccuracy);
			bullet3.dir				= bullet3_angle;
			bullet3.image_angle		= bullet3_angle;
			
			alarm[0]				= shoot_cooldown;
		}
	}
#endregion
	
#region RADIAL 2
	if gun_state					== gun_states.radial2{
		// Check cooldown
		if (alarm[0] <= 0){
			// If off cooldown, create a bullet
			audio_play_sound(snd_shoot, 1, 0);
			var bullet				= instance_create_layer(x + x_offset, y + y_offset, "Instances", o_bullet);
			var bullet_angle		= dir + random_range(-inaccuracy, inaccuracy);
			bullet.dir				= bullet_angle;
			bullet.image_angle		= bullet_angle;
			alarm[0]				= shoot_cooldown;
		}
	}
#endregion

#region RADIAL 3
	if gun_state					== gun_states.radial3{
		
	}
#endregion

#region RADIAL 4
	if gun_state					== gun_states.radial4{
		
	}
#endregion
}

