view_width = 1920/6;
view_height = 1080/6;

zoom = 1;
zoom_speed = 0.1;

window_scale = 3;

window_set_size(view_width*window_scale, view_height*window_scale);
alarm[0] = 1;

surface_resize(application_surface,view_width*window_scale, view_height*window_scale);

if(active_character != noone)
{
	var _x = clamp((active_character.x + active_character.sprite_width/2) - (view_width*zoom)/2, 0, room_width-(view_width*zoom));
	var _y = clamp((active_character.y + active_character.sprite_height/2) - (view_height*zoom)/2,0, room_height-(view_height*zoom));
	camera_set_view_pos(view, _x, _y);
}