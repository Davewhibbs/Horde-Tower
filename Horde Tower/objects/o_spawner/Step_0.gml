/// @description Insert description here
// You can write your code in this editor
if alarm[0]			<= 0 {
	//-----------RESET SPAWN LOCATION
	horizontal		= 0;
	vertical		= 0;
	spawnX			= 0;
	spawnY			= 0;
	
	//-----------DETERMINE WHICH SIDE OF THE SCREEN TO SPAWN ON
	horizontal		= random_range(0, 1);
	vertical		= random_range(0,1);
	
	//-----------DETERMINE SPECIFIC SPAWN LOCATION
	if horizontal	== 0{
		spawnX		= random_range(-10, 0);
	} else {	
		spawnX		= random_range(room_width, room_width + 10);
	}
	
	if vertical		== 0{
		spawnY		= random_range(-10, 0);
	} else {
		spawnY		= random_range(room_height, room_height + 10);
	}
	
	//----------SPAWN ENEMY
	instance_create_layer(spawnX, spawnY, "Instances", o_enemy);
	alarm[0] = cooldown;
}