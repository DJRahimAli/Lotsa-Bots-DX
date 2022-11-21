for (var i = 0; i < rows; i++)
{
	for (var j = 0; j < columns; j++)
	{
		var _cur_grid_x = x + (i * (width + widthSpacing));
		var _cur_grid_y = y + (j * (height + heightSpacing));
		
		var spriteid = layer_sprite_create(layer, _cur_grid_x, _cur_grid_y, sprite_index);
		layer_sprite_blend(spriteid,image_blend);
		if Chance(percent, range) layer_sprite_index(spriteid, irandom_range(0, image_number));
	}
}

instance_destroy();
