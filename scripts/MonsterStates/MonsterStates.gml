function monster_state_idle() {
	stretch = 1 + sin(timer * frequency) * amplitude;
	timer++;
}