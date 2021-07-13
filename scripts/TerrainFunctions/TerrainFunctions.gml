enum TERRAIN_TYPE {
	RANDOM,
	CELLULAR,
	DUNGEON
}


function GenerateTerrain(terrainType){

	var map_width = room_width/16;
	var map_height = room_height/16;

	layer_tilemap_destroy(layer_tilemap_get_id(layer_get_id("Tiles")));
	global.map_id = layer_tilemap_create(layer_get_id("Tiles"),0,0,TileSet1,map_width,map_height);

	if(terrainType == TERRAIN_TYPE.RANDOM)
	{
		for(var i = 0; i < map_width; i++)
		{
			for(var j = 0; j < map_height; j++){
				var tile_data = tilemap_get(global.map_id, i, j);
				tile_data = tile_set_index(tile_data,choose(0,5,6,7,35));
				tilemap_set(global.map_id,tile_data,i,j)
			}		
		}
	}else if(terrainType == TERRAIN_TYPE.CELLULAR){
		for(var i = 0; i < map_width; i++)
		{
			for(var j = 0; j < map_height; j++){
				var tile_data = tilemap_get(global.map_id, i, j);
				var rnd = irandom(100);
				if(rnd > 50){
					tile_data = tile_set_index(tile_data,35);
				} else {
					tile_data = tile_set_index(tile_data,choose(0,5,6,7));
				}
				tilemap_set(global.map_id,tile_data,i,j)
			}		
		}
		SmoothTerrain(1);
	}
}

function SmoothTerrain(numIterations){
	var map_width = room_width/16;
	var map_height = room_height/16;
	
	repeat(numIterations){
		for(var _x = 0; _x < map_width; _x++)
		{
			for(var _y = 0; _y < map_height; _y++){
				var tile_data = tilemap_get(global.map_id, _x, _y);
				if(GetNumWalls(_x, _y) < 3)
				{
					tile_data = tile_set_index(tile_data,choose(0,5,6,7));
					tilemap_set(global.map_id,tile_data,_x, _y)
				}
			}		
		}
	}
}

function SetTile(cell_x,cell_y,tile_ID)
{
	var tile_data = tilemap_get(global.map_id, cell_x, cell_y);
	tile_data = tile_set_index(tile_data, tile_ID);
	tilemap_set(layer_tilemap_get_id(layer_get_id("Tiles")), tile_data, cell_x, cell_y);
}

function GetTileIndex(cell_x,cell_y)
{
	var tile_data = tilemap_get(global.map_id, cell_x, cell_y);
	return tile_get_index(tile_data);
}

function GetNumWalls(cell_x,cell_y){
	var numWall = 0;
	for(var i = -1; i < 2; i++)
	{
		for(var j = -1; j < 2; j++){
			if(i==0 and j==0) { continue; }
			if(cell_x + i < 0 or cell_y + j < 0 or cell_x + i >= room_width/16 or cell_y + j >= room_height/16){
				continue;
			}
			
			if(GetTileIndex(cell_x + i, cell_y + j) == 35)
			{
				numWall++;
			}
		}
	}
	return numWall
}

function IsTileEmpty(cell_x,cell_y)
{
	var tile_data = tilemap_get(global.map_id, cell_x, cell_y);
	var ind = tile_get_index(tile_data)
	//TODO: make this a list of blocking tiles
	if(ind != 35){
		return true;	
	}
	return false;
}

function inLOS(x1, y1, x2, y2, pixelInterval) {
	var dis = 0;
	var maxDis = point_distance(x1,y1,x2,y2);
	var dir = point_direction(x1,y1,x2,y2);
	var checks = maxDis/pixelInterval;
	repeat (checks)
	{ 
		var xCheck = x1 + lengthdir_x(dis,dir);
		var yCheck = y1 + lengthdir_y(dis,dir);

		var grid = global.activeCharacter.ds_visibleTiles
		var tileData = GetTileIndex(xCheck div 16, yCheck div 16)
		if(tileData == 35)
		{
			return false;
		}
		dis += pixelInterval;
	}
	return true;
}
