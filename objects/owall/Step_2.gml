if ( variation != 0 )
{
	var spriteid = layer_sprite_create(layer, x, y, sWallVariations);
	layer_sprite_index(spriteid, variation);
}

spriteid = layer_sprite_create(layer, x, y, sprite_index);
layer_sprite_blend(spriteid,image_blend);

instance_destroy();
