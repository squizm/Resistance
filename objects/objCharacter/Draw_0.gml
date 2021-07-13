shader_set(outline)
shader_set_uniform_f(upixelW, texelW);
shader_set_uniform_f(upixelH, texelH);
if(isPlayer){
	draw_sprite_ext(sprite_index, image_index, x+8, y+16, image_xscale, stretch, image_angle, c_yellow, image_alpha);
} else {
	draw_sprite_ext(sprite_index, image_index, x+8, y+16, image_xscale, stretch, image_angle, c_red, image_alpha);
}
shader_reset()

if(isPlayer){
	// update fov surface
	if(!surface_exists(surf_fov)){
		surf_fov = surface_create(room_width, room_height);
		surface_set_target(surf_fov);
		draw_set_color(c_white)
		draw_rectangle(0,0,room_width, room_height, false)
		draw_set_alpha(1.0)
			draw_set_color(c_black)
		for (var xx = 0; xx < room_width div 16 ; ++xx){
		    for (var yy = 0; yy < room_height div 16; ++yy){ 
				if(point_distance(x,y,xx*16,yy*16) div 16 <= 24){
					if(inLOS(x+8,y+8,(xx*16)+8,(yy*16)+8,16)){						
						ds_grid_set(ds_visibleTiles,xx,yy,true);
						ds_grid_set(ds_seenTiles,xx,yy,true);
						draw_rectangle(xx*16,yy*16, xx*16+16, yy*16+16, false);
					}else if(ds_grid_get(ds_seenTiles,xx,yy) == true){
						draw_set_alpha(0.25);
						draw_rectangle(xx*16,yy*16, xx*16+15, yy*16+15, false);
						draw_set_alpha(1);
					}
				}
			}
		}	
		draw_set_color(c_white)
		surface_reset_target()
		gpu_set_blendmode(bm_subtract)
		draw_surface(surf_fov,0,0);
		gpu_set_blendmode(bm_normal)
	} else {
		gpu_set_blendmode(bm_subtract)
		draw_surface(surf_fov,0,0);
		gpu_set_blendmode(bm_normal)
	}
}