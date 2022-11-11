if ( hover )
{
	draw_set_color(make_color_rgb(245,73,149));
	draw_rectangle( 0, bbox_top + 1 + yOffsetCurrent + 16, room_width, bbox_top + yOffsetCurrent + 48, false );
	draw_set_color(c_white);
	for ( var i = 0; i < room_width + lineWidth; i += lineWidth ) draw_sprite( sButtonLine, button, lineX + i, bbox_top + 1 + yOffsetCurrent + 16 );
}

draw_sprite_ext( sprite_index, 0, x, yDraw, image_xscale, image_yscale, 0, c_white, 1 );
