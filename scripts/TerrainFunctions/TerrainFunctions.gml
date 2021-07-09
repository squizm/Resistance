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
	var tile_data = tilemap_get(layer_tilemap_get_id(layer_get_id("tiles")), cell_x, cell_y);
	tile_set_index(tile_data, tile_ID);
	tilemap_set(layer_get_id("tiles"), tile_data, cell_x, cell_y);
}

function GetTile(cell_x,cell_y)
{
	var tile_data = tilemap_get(layer_tilemap_get_id(layer_get_id("tiles")), cell_x, cell_y);
	return tile_get_index(tile_data);
}

function IsTileEmpty(cell_x,cell_y)
{
	return true;
}

function TileIsWalkable(cell_x, cell_y)
{
	var tile_data = tilemap_get(layer_tilemap_get_id(layer_get_id("tiles")), cell_x, cell_y);
	var ind = tile_get_index(tile_data)
	if(ind < 7){
		return true;	
	}
	return false;
}