image_index = random(image_number)
vmove = 0;
hmove = 0;

faceID = random(sprite_get_number(sprFaces)-1);
name = GenerateName();

amplitude = 0.05;
frequency = 0.05;
timer = random(60);
stretch=0;

sprite_set_offset(sprite_index, 8, 15);