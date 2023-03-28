if ( hover )
{
	//Create surface
	if (!surface_exists(surface)) surface = surface_create(room_width, room_height);
	
	//Set surface target
	surface_set_target(surface);
	
	//Clear surface
	draw_clear_alpha(c_black, 0);
	
	//Draw line
	draw_set_color(make_color_rgb(245,73,149));
	draw_rectangle( 0, bbox_top + 1 + int64(yOffsetCurrent) + 16, room_width, bbox_top + int64(yOffsetCurrent) + 48, false );
	draw_set_color(c_white);
	
	//Draw button line
	for ( var i = 0; i < room_width + lineWidth*2; i += lineWidth ) draw_sprite( sButtonLine, button, lineX + i, bbox_top + 1 + int64(yOffsetCurrent) + 16);
	
	//Reset target
	surface_reset_target();
	
	//Draw surface
	draw_surface_ext(surface, 0, 0, 1, 1, 0, c_white, image_alpha);
	
	//Reset surface
	surface_free(surface);
}

draw_sprite_ext( sprite_index, 0, xDraw, yDraw + int64(yOffsetCurrent), image_xscale, image_yscale, 0, c_white, image_alpha );
