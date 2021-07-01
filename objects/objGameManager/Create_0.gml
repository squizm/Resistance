#macro TILE_EMPTY 0
#macro TILE_TREE 13
#macro TILE_GRASS 5

recGIF = false;
gifImg = noone;
depth = -1;
randomize();
draw_set_font(fntSystem)

grid_width = room_width/16;
grid_height = room_height/16;

grid = ds_grid_create(grid_width, grid_height);
grid = GenerateTerrain(grid);

surf_tilemap = noone;

for(var i = 0; i < 10; i+= 1)
{
	var found = false;
	var foundX;
	var foundY;
	while(!found){
		var randX = floor(random_range(0,ds_grid_width(grid)));
		var randY = floor(random_range(0,ds_grid_height(grid)));
		if(ds_grid_get(grid, randX, randY) != TILE_TREE){
			found = true
			foundX = randX;
			foundY = randY;
		}
	}
	var char = instance_create_layer(foundX*16, foundY*16, "Instances", objCharacter);
	char.isPlayer = false;
	char.depth = -2;
	if(i == 0)
	{
		char.isPlayer = true;
		char.image_index = 1;
		camera_set_view_target(view_camera[0],char)
	}
}

