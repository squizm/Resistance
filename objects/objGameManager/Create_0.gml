recGIF = false;
gifImg = noone;
depth = -1;
randomize();
draw_set_font(fntSystem)

global.activeCharacter = noone;

global.tileMap = layer_tilemap_get_id("tiles")
var player = instance_create_layer(room_width/2,room_height/2, "Instances", objCharacter);
setupCharacter(player, CHARACTER_TYPE.PLAYER)
global.activeCharacter = player;