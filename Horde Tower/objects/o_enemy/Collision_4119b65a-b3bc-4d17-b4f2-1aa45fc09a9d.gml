//----------TAKE DAMAGE AND DESTROY THE BULLET + ADD TO COMBO
if instance_exists(o_tower)	o_tower.combo++;
hp -= 1;
instance_destroy(other);

audio_play_sound(snd_enemy_hit, 1, 0);

//----------SWITCH TO HIT STATE
state = states.hit;

//----------CHANGE TO OPPOSITE SPEED
hit_dir = other.dir;
moveX = lengthdir_x(push_spd, hit_dir);
moveY = lengthdir_y(push_spd, hit_dir);