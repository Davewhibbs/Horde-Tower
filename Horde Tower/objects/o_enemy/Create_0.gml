dir = 0;
spd = 4;
push_spd = 10;
hp = 1;
tower_collide = 0;
death_sound = snd_enemy_death;
hit_dir = 0;

// states
enum states
{
	move,
	hit
}
state = states.move;