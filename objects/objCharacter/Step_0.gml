state_execute()
/*
if(isPlayer) {
	key_right = keyboard_check_released(ord("D"));
	key_left = keyboard_check_released(ord("A"));
	key_up = keyboard_check_released(ord("W"));
	key_down = keyboard_check_released(ord("S"));

	hmove = key_right - key_left
	vmove = key_down - key_up
}

if(hmove != 0 || vmove != 0)
{
	var gm = instance_find(objGameManager,0);
	var myTileX = x div 16;
	var myTileY = y div 16;
	var destTileX = hmove + myTileX
	var destTileY = vmove + myTileY
	
	if(destTileX >= 0 && destTileX < ds_grid_width(gm.grid) && destTileY >= 0 && destTileY < ds_grid_height(gm.grid))
	{
		if(ds_grid_get(gm.grid,destTileX,destTileY) != TILE_TREE){
			x = destTileX * 16;
		}
	
		if(ds_grid_get(gm.grid,destTileX,destTileY) != TILE_TREE){
			y = destTileY * 16;
		}
	}
	
}

stretch = 1 + sin(timer * frequency) * amplitude;
timer++;
if(timer > 100){
	timer =  0;
}
*/
	