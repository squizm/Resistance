/// @function                 setupCharacter(characterType);
/// @param {real}  character The character object
/// @param {string}  characterType If the character being seutp is a player
/// @description              Adds states to character
function setupCharacter(character,characterType){

	with(character){
		var foundSpot = false;
		while(!foundSpot)
		{
			var map_width = tilemap_get_width(global.map_id);
			var map_height = tilemap_get_height(global.map_id);
			var _x = irandom(map_width);
			var _y = irandom(map_height);
			if(IsTileEmpty(_x,_y)){
				foundSpot = true;
				character.x = _x*16;
				character.y = _y*16;
			}
		}
	
		//Define States
		if(characterType == CHARACTER_TYPE.PLAYER){
			isPlayer = true;
			depth = -99;
			image_index = 1;
			state_create("Idle", player_state_idle);
			state_create("Move", player_state_move);
			state_create("Bump", player_state_bump);
			state_create("Attack", player_state_attack);
			//Set the default state
			state_init("Idle");
		} else {
			state_create("Idle",monster_state_idle);
			state_init("Idle");
		}
	}
}