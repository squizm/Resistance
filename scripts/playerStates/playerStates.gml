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
		var myTileX = x div 16;
		var myTileY = y div 16;
		var destTileX = hmove + myTileX
		var destTileY = vmove + myTileY
		var tilemapID = layer_get_id("Tiles");
		var tilemap_cell_width = tilemap_get_width(layer_tilemap_get_id(tilemapID));
		var tilemap_cell_height = tilemap_get_height(layer_tilemap_get_id(tilemapID));
	
		if(destTileX > 0 && destTileX < tilemap_cell_width && destTileY > 0 && destTileY < tilemap_cell_height)
		{
			if(TileIsWalkable(destTileX, destTileY)){
				destX = destTileX * 16;
			}
	
			if(TileIsWalkable(destTileX, destTileY)){
				destY = destTileY * 16;
			}
			state_switch("Move")
		} else {
			destX = destTileX * 16;
			destY = destTileY * 16;
			state_switch("Bump")
		}
	}
}

function player_state_move() {

	if(x != destX) {
		x = lerp(x, destX, 0.5);
		if(abs(destX - x) < 1) { x = destX}
	}

	if(y != destY) {
		y = lerp(y, destY, 0.5);
		if(abs(destY - y) < 1) { y = destY}
	}

	if(x == destX && y == destY) {
		state_switch("Idle");
	}
}

function player_state_bump() {

	if(x != destX) {
		x = lerp(x, destX, 0.5);
		if(abs(destX - x) <= 1) { destX = startX }
	}

	if(y != destY) {
		y = lerp(y, destY, 0.5);
		if(abs(destY - y) <= 1) { destY = startY}
	}


	if(x == startX && y == startY) {
		state_switch("Idle");
	}
}