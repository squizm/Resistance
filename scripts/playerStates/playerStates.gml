function player_state_idle() {
	stretch = 1 + sin(timer * frequency) * amplitude;
	timer++;

	key_right = keyboard_check_released(ord("D"));
	key_left = keyboard_check_released(ord("A"));
	key_up = keyboard_check_released(ord("W"));
	key_down = keyboard_check_released(ord("S"));

	hmove = key_right - key_left
	vmove = key_down - key_up

	if(hmove != 0 or vmove != 0)
	{
		if(hmove != 0 and vmove != 0)
		{
			vmove = 0;
		}		
		
		var myTileX = x div 16;
		var myTileY = y div 16;
		var destTileX = hmove + myTileX
		var destTileY = vmove + myTileY
		var tilemap_width = tilemap_get_width(global.map_id);
		var tilemap_height = tilemap_get_height(global.map_id);

	
		if(destTileX >= 0 && destTileX < tilemap_width && destTileY >= 0 && destTileY < tilemap_height)
		{			
			if(IsTileEmpty(destTileX, destTileY) and isOccupied(destTileX,destTileY) == noone ){
				destX = destTileX * 16;
				destY = destTileY * 16;
				surface_free(surf_fov);
				ds_grid_clear(ds_visibleTiles,false);
				state_switch("Move");
			} else if(isOccupied(destTileX,destTileY) != noone){
				startX = x;
				startY= y;
				destX = destTileX * 16;
				destY = destTileY * 16;
				var popOut = instance_create_depth(destX, destY-16, isOccupied(destTileX,destTileY).depth-100, objPopOut)
				popOut.txt = ("OUCH!");
				state_switch("Attack");
			}else{
				startX = x;
				startY= y;
				destX = destTileX * 16;
				destY = destTileY * 16;
				//chop down tree
				SetTile(destTileX,destTileY, 6);
				surface_free(surf_fov);
				ds_grid_clear(ds_visibleTiles,false);
				state_switch("Bump");
			}
		}
	}
}

function player_state_move() {

	if(x != destX) {
		x = lerp(x, destX, 0.25);
		if(abs(destX - x) < 1) { x = destX}
	}

	if(y != destY) {
		y = lerp(y, destY, 0.25);
		if(abs(destY - y) < 1) { y = destY}
	}

	if(x == destX && y == destY) {
		state_switch("Idle");
	}
}

function player_state_bump() {

	if(x != destX) {
		x = lerp(x, destX, 0.5);
		if(abs(destX - x) <= 4) { destX = startX }
	}

	if(y != destY) {
		y = lerp(y, destY, 0.5);
		if(abs(destY - y) <= 4) { destY = startY}
	}

	if(x == startX && y == startY) {
		state_switch("Idle");
	}
}

function player_state_attack() {
	if(x != destX) {
		x = lerp(x, destX, 0.5);
		if(abs(destX - x) < 1) { destX = startX }
	}

	if(y != destY) {
		y = lerp(y, destY, 0.5);
		if(abs(destY - y) < 1) { destY = startY}
	}


	if(x == startX && y == startY) {
		state_switch("Idle");
	}
}