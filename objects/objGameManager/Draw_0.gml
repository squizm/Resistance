if(!surface_exists(surf_tilemap)){
	surf_tilemap = surface_create(room_width, room_height)
	surface_set_target(surf_tilemap)
	for (var xx = 0; xx < grid_width ; ++xx){
	    for (var yy = 0; yy < grid_height; ++yy){ 
			draw_sprite(sprTerrain, ds_grid_get(grid,xx,yy), xx*16, yy*16)
		}
	}	
	surface_reset_target()
	draw_surface(surf_tilemap,0,0);
} else {
	draw_surface(surf_tilemap,0,0);
}

if(recGIF){
	draw_circle_color(16, room_height - 16, 8, c_red, c_red,false)
}