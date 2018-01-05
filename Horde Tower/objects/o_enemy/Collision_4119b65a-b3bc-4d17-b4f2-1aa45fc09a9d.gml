//----------TAKE DAMAGE AND DESTROY THE BULLET
hp -= 1;
instance_destroy(other);

audio_play_sound(snd_enemy_hit, 1, 0);

//----------SWITCH TO HIT STATE
state = states.hit;

//----------CHANGE TO OPPOSITE SPEED
var hit_dir = other.dir;
moveX = lengthdir_x(push_spd, hit_dir);
moveY = lengthdir_y(push_spd, hit_dir);