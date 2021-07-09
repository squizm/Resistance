recGIF = false;
gifImg = noone;
depth = -1;
randomize();
draw_set_font(fntSystem)

global.activeCharacter = noone;

global.tileMap = layer_tilemap_get_id("tiles")
//GenerateTerrain()
//SpawnNPCs( 1 + random_range(5,10))
var player = instance_create_layer(room_width/2,room_height/2, "Instances", objCharacter);
setupCharacter(player, CHARACTER_TYPE.PLAYER)
global.activeCharacter = player;