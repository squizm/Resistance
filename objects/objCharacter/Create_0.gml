image_index = random(image_number)
vmove = 0;
hmove = 0;

faceID = random(sprite_get_number(sprFaces)-1);
name = GenerateName();

amplitude = 0.05;
frequency = 0.05;
timer = random(60);
stretch=0;

destX = 0;
destY = 0;
startX = x;
startY = y;

sprite_set_offset(sprite_index, 8, 15);

///Setup State Machine
state_machine_init();

//Outline shader
upixelH = shader_get_uniform(outline, "pixelH");
upixelW = shader_get_uniform(outline, "pixelW");
texelW = texture_get_texel_width(sprite_get_texture(sprite_index,0));
texelH = texture_get_texel_height(sprite_get_texture(sprite_index,0));

// FOV surface
ds_seenTiles = ds_grid_create(room_width/16,room_height/16);
ds_grid_clear(ds_seenTiles, false);

ds_visibleTiles = ds_grid_create(room_width/16,room_height/16);
ds_grid_clear(ds_visibleTiles, false);

surf_fov = noone;
