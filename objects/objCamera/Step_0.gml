if(mouse_wheel_up()){
	zoom -= zoom_speed;
	zoom = clamp(zoom, 0.5, 2);
}

if(mouse_wheel_down()){
	zoom += zoom_speed;
	zoom = clamp(zoom, 0.5, 2);
}