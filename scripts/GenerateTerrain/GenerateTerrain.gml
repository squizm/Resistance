function GenerateTerrain(){

	tilemap_clear(global.tileMap,1);
	
	for(var i = 0; i < tilemap_get_width(global.tileMap); i++)
	{
		for(var j = 0; j < tilemap_get_height(global.tileMap); j++){
			var tile = tilemap_get(global.tileMap, i, j);
			tile_set_index(tile,3)
			tilemap_set(global.tileMap,tile,i,j)
		}		
	}
}

function SetTile(cell_x,cell_y,tile_ID)
{
	
}

function GetTile(cell_x,cell_y,tile_ID)
{
	
}

function IsTileEmpty(cell_x,cell_y)
{
	return true;
}