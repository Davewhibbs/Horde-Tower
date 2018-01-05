//----------UPDATE DIRECTION
dir = point_direction(x, y, o_tower.x, o_tower.y);

// Reset Tower Collide
	tower_collide = 0;

if state == states.move{
	//----------INTENDED MOVEMENT
	moveX = lengthdir_x(spd,dir);
	moveY = lengthdir_y(spd,dir);
	
	//-----------COLLIDE WITH TOWER
	// Horizontal
	if(place_meeting(x + moveX, y, o_tower)){
	repeat(abs(moveX)){
		if(!place_meeting(x + sign(moveX), y, o_tower)){
			x += sign(moveX);	
		} else {
			break;
		}
	}
	moveX = 0;
	tower_collide = 1;
	}
	
	// Vertical
	if(place_meeting(x, y + moveY, o_tower)){
	repeat(abs(moveY)){
		if(!place_meeting(x, y + sign(moveY), o_tower)){
			y += sign(moveY);	
		} else {
			break;
		}
	}
	moveY = 0;
	tower_collide = 1;
	}

}
else if state == states.hit{
	// Gradually decrease movement
	moveX = lerp(moveX, 0, .1);
	moveY = lerp(moveY, 0, .1);
	
	// Reset to move state
	if point_distance(0, 0, moveX, moveY) < 1{
		state = states.move;	
	}
}

//----------DEATH
if hp <= 0 {
	instance_destroy();
}



//----------APPLY MOVEMENT
x += moveX;
y += moveY;

//----------SWITCH TO HIT STATE IF COLLIDING WITH TOWER
if (tower_collide == 1)
{
	state = states.hit;
	var hit_dir = point_direction(o_tower.x, o_tower.y, x, y);
	moveX = lengthdir_x(push_spd, hit_dir);
	moveY = lengthdir_y(push_spd, hit_dir);
}