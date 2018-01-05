//---------UPDATE INPUT
input_left		= keyboard_check(vk_left);
input_right		= keyboard_check(vk_right);
input_up		= keyboard_check(vk_up);
input_down		= keyboard_check(vk_down);

//---------ALTER SPEED

//---------RESET MOVE VARIABLES
moveX = 0;
moveY = 0;

//---------INTENDED MOVEMENT
moveY = (input_down - input_up) * spd;
moveX = (input_right - input_left) * spd;

//---------COLLISION CHECK
// Horixontal
if (!place_meeting(x + moveX, y, o_tower)){
	repeat(abs(moveX)){
		if (place_meeting(x + sign(moveX), y, o_tower)){
			x += sign(moveX);
		} else {
			break;
		}
	}
	moveX = 0;
}

// Vertical
if (!place_meeting(x, y + moveY, o_tower)){
	repeat(abs(moveY)){
		if (place_meeting(x + sign(moveY), y, o_tower)){
			x += sign(moveY);
		} else {
			break;
		}
	}
	moveY = 0;
}

//---------APPLY MOVEMENT
x += moveX;
y += moveY;