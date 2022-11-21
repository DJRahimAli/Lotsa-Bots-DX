if ( Chance(0.2, 1) ) image_index = irandom_range(0, image_number);

var spriteid = layer_sprite_create(layer, x, y, sprite_index);
layer_sprite_blend(spriteid,image_blend);
layer_sprite_index(spriteid, image_index);

instance_destroy();
