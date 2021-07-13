
if(isPlayer){
	var txt = name
	var panelWidth = 16+string_width(txt)
	if(panelWidth < 72) {
		panelWidth = 72
	}
	draw_set_color(c_white)
	draw_text(16,16,txt + " - " + state_name)
}
