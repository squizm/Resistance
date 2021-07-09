#macro view view_camera[0]
#macro active_character global.activeCharacter

// zooming
camera_set_view_size(view, view_width*zoom, view_height*zoom);

if(active_character != noone)
{	
	
	var _x = clamp((active_character.x + active_character.sprite_width/2) - (view_width*zoom)/2, 0, room_width-(view_width*zoom));
	var _y = clamp((active_character.y + active_character.sprite_height/2) - (view_height*zoom)/2,0, room_height-(view_height*zoom));
	camera_set_view_pos(view, _x, _y);	
	
	/*
	var cur_x = camera_get_view_x(view);
	var cur_y = camera_get_view_y(view);
	var camera_speed = 0.1;
	
	camera_set_view_pos(view, 
		lerp(cur_x, _x, camera_speed),
		lerp(cur_y, _y, camera_speed));	
	*/
}