/// @description Check for QUIT	
if(keyboard_check_released(vk_escape))
{
	game_end();
}

if(keyboard_check_released(vk_f8)){
	if(recGIF == false)
	{
		gifImg = gif_open(camera_get_view_width(0), camera_get_view_height(0));
		recGIF = true;
	}else {
		recGIF = false;
		show_debug_message("imaged saved to " + string(game_save_id));
		gif_save(gifImg, "GameCapture_camera.gif")
	}	
}

if (recGIF)
{
	gif_add_surface(gifImg, application_surface, 2,0,0,1);
}