/// @description Insert description here
// You can write your code in this editor
if alarm[0]			<= 0 {
	//-----------RESET SPAWN LOCATION
	horizontal		= 0;
	vertical		= 0;
	spawnX			= 0;
	spawnY			= 0;
	
	//-----------DETERMINE WHICH SIDE OF THE SCREEN TO SPAWN ON
	horizontal		= irandom(1)
	vertical		= irandom(1);
	
	//-----------DETERMINE SPECIFIC SPAWN LOCATION
	// Left
	if horizontal == 0 && vertical == 0{
		spawnX		= irandom_range(room_width, room_width + 10);
		spawnY		= irandom_range(0, room_height);
	} 
	
	// Right
	else if horizontal == 1 && vertical == 0{	
		spawnX		= irandom_range(-10, 0);
		spawnY		= irandom_range(0, room_height);
	}
	
	// Up
	else if horizontal	== 0 && vertical == 1{
		spawnX		= irandom_range(0, room_width);
		spawnY		= irandom_range(-10, 0);
	} 
	
	// Down
	else if horizontal == 1 && vertical == 1{
		spawnX		= irandom_range(0, room_width);
		spawnY		= irandom_range(room_height, room_height + 10);
	}
	
	//----------SPAWN ENEMY
	instance_create_layer(spawnX, spawnY, "Instances", o_enemy);
	alarm[0] = cooldown;
}