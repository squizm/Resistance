if(isPlayer){
	var txt = name
	var panelWidth = 16+string_width(txt)
	if(panelWidth < 72) {
		panelWidth = 72
	}
	
	draw_sprite_stretched(sprUI,0,8,8,panelWidth,16+string_height(txt) + 64)
	draw_sprite_ext(sprFaces,faceID,16,40,4,4,0,c_dkgrey,1)	
	draw_sprite_ext(sprHeart,0,88,56,2,2,0,c_dkgrey,1)	
	draw_set_color(c_dkgrey)
	draw_text(16,16,txt)
	draw_text(124, 64, HP)
	draw_set_color(c_white)
}