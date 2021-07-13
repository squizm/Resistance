recGIF = false;
gifImg = noone;
depth = -1;
randomize();
draw_set_font(fntSystem)

global.activeCharacter = noone;
//global.map_id = layer_tilemap_get_id(layer_get_id("Tiles"));
GenerateTerrain(TERRAIN_TYPE.CELLULAR);

global.characterList = ds_list_create()

repeat(10){
	var monster = instance_create_layer(room_width/2,room_height/2, "Instances", objCharacter);
	setupCharacter(monster, CHARACTER_TYPE.MONSTER)
	ds_list_add(global.characterList, monster);
}


var player = instance_create_layer(room_width/2,room_height/2, "Instances", objCharacter);
setupCharacter(player, CHARACTER_TYPE.PLAYER)
ds_list_add(global.characterList, player);
global.activeCharacter = player;