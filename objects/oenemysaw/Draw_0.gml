draw_self();

if ( flashAlphaCurrent != 0 )
{
	shader_set(shFlash);
	
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashColorCurrent, flashAlphaCurrent);
	
	shader_reset();
}
