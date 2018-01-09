/// @description Insert description here
// You can write your code in this editor
dir					= 0;
spd					= 15;
velocity			= 0;
normal_frict		= .15; 
shoot_frict			= .5;
frict				= normal_frict;

life				= 0;
combo				= 0;
combo_length		= 16;

enum gun_states
{
	basic,
	triple,
	radial2,
	radial3,
	radial4,
}
gun_state			= gun_states.basic;

// Bullet creation
x_offset			= 0;
y_offset			= 0;
inaccuracy			= 10;
shoot_cooldown		= 3;
alarm[0]			= shoot_cooldown;

powerup_cooldown	= 10 * room_speed;
alarm[1]			= 0;