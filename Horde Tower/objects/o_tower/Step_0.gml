//-----------UPDATE INPUT
input_left = keyboard_check(vk_left);
input_right = keyboard_check(vk_right);
input_shoot = keyboard_check(vk_up);

//-----------CHECK FOR DEATH
if life >= 4{
	instance_destroy();
}

//-----------RESET MOVE VARIABLES
move_dir = 0;


//-----------INTENDED MOVEMENT
move_dir += (input_left - input_right);
velocity += move_dir;
if velocity >= spd
{
	velocity = spd;
}

velocity = lerp(velocity, 0, frict);

//-----------UPDATE DIRECTION AND POSITION OF GUN
dir += velocity;
x_offset = lengthdir_x(90, dir);
y_offset = lengthdir_y(90, dir);


//-----------SHOOTING
if (input_shoot) {
	// Check cooldown
	if (alarm[0] <= 0){
		// If off cooldown, create a bullet
		var bullet = instance_create_layer(x + x_offset, y + y_offset, "Instances", o_bullet);
		bullet.dir = dir;
		bullet.image_angle = dir;
		alarm[0] = shoot_cooldown;
	}
}

