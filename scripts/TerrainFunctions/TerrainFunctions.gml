function GenerateTerrain(){

	var map_width = tilemap_get_width(layer_tilemap_get_id(layer_get_id("Tiles")));
	var map_height = tilemap_get_height(layer_tilemap_get_id(layer_get_id("Tiles")));
	layer_tilemap_destroy(layer_tilemap_get_id(layer_get_id("Tiles")));
	global.map_id = layer_tilemap_create(layer_get_id("Tiles"),0,0,TileSet1,map_width,map_height);
	
	for(var i = 0; i < map_width; i++)
	{
		for(var j = 0; j < map_height; j++){
			var tile_data = tilemap_get(global.map_id, i, j);
			tile_data = tile_set_index(tile_data,choose(0,5,6,7,35));
			tilemap_set(global.map_id,tile_data,i,j)
		}		
	}
}

function SetTile(cell_x,cell_y,tile_ID)
{
	var tile_data = tilemap_get(global.map_id, cell_x, cell_y);
	tile_data = tile_set_index(tile_data, tile_ID);
	tilemap_set(layer_tilemap_get_id(layer_get_id("Tiles")), tile_data, cell_x, cell_y);
}

function GetTile(cell_x,cell_y)
{
	var tile_data = tilemap_get(global.map_id, cell_x, cell_y);
	return tile_get_index(tile_data);
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