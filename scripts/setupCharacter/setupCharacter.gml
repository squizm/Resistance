/// @function                 setupCharacter(characterType);
/// @param {real}  character The character object
/// @param {string}  characterType If the character being seutp is a player
/// @description              Adds states to character
function setupCharacter(character,characterType){

	with(character){
		//Define States
		if(characterType == CHARACTER_TYPE.PLAYER){
			state_create("Idle", player_state_idle);
			state_create("Move", player_state_move);
			state_create("Bump", player_state_bump);
			//Set the default state
			state_init("Idle");
		} else {
			state_create("Idle",monster_state_idle);
			state_init("Idle");
		}
	}
}