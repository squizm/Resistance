recGIF = false;
gifImg = noone;
depth = -1;
randomize();
draw_set_font(fntSystem)

global.activeCharacter = noone;
//global.map_id = layer_tilemap_get_id(layer_get_id("Tiles"));
GenerateTerrain()


repeat(10){
	var player = instance_create_layer(room_width/2,room_height/2, "Instances", objCharacter);
	setupCharacter(player, CHARACTER_TYPE.MONSTER)
}


var player = instance_create_layer(room_width/2,room_height/2, "Instances", objCharacter);
setupCharacter(player, CHARACTER_TYPE.PLAYER)
global.activeCharacter = player;