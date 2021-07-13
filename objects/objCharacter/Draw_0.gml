shader_set(outline)
shader_set_uniform_f(upixelW, texelW);
shader_set_uniform_f(upixelH, texelH);
if(isPlayer){
	draw_sprite_ext(sprite_index, image_index, x+8, y+16, image_xscale, stretch, image_angle, c_yellow, image_alpha);
} else {
	draw_sprite_ext(sprite_index, image_index, x+8, y+16, image_xscale, stretch, image_angle, c_red, image_alpha);
}
shader_reset()