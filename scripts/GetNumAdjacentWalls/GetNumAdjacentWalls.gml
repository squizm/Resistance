// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
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