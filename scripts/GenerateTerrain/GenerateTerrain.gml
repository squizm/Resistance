function GenerateTerrain(grid){
	gridWidth = ds_grid_width(grid);
	gridHeight = ds_grid_height(grid);
	
	for(var xx = 0; xx < gridWidth; xx++)
	{
		for(var yy = 0; yy < gridHeight; yy++)
		{
			ds_grid_set(grid,xx,yy,choose(TILE_TREE, TILE_EMPTY));
		}
	}
	
	for(var xx = 0; xx < gridWidth; xx++)
	{
		for(var yy = 0; yy < gridHeight; yy++)
		{
			if( xx == 0 || xx == gridWidth-1 || yy == 0 || yy == gridHeight-1){
				continue;
			}
			if(GetNumAdjacentWalls(grid,xx,yy) < 4)
			{
				ds_grid_set(grid,xx,yy,choose(TILE_GRASS, TILE_EMPTY))
			}
		}
	}
	
	return grid
}

function GetNumAdjacentWalls(grid,xx,yy){
	var numWalls = 0

	for(var i = xx-1; i <= xx+1; i++)
	{
		if(i < 0) { continue }
		for(var j = yy-1; j <= yy+1; j++)
		{
			if(j < 0){ continue }
			if(i=xx && j=yy) { continue }
			if(ds_grid_get(grid,i,j) == TILE_TREE){
				numWalls++
			}
		}
	}
	return numWalls
}