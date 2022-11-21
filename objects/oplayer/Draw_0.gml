var array = spriteData[characterCurrent][playerStateCurrent][angle];

sprite_index = array[playersprite.index];

mask_index = array[playersprite.mask];

image_xscale = array[playersprite.xscale];
image_yscale = array[playersprite.yscale];

image_angle = array[playersprite.rot];

image_blend = array[playersprite.col];

image_alpha = array[playersprite.alpha];


if ( sprite_index <= -3 ) sprite_index = sMissing;

if ( mask_index <= -3 ) mask_index = sMissing;

if ( mask_index == -2 ) mask_index = sprite_index;

if ( sprite_index != -1 ) draw_self();


if ( flashAlphaCurrent != 0 )
{
	shader_set(shFlash);
	
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashColorCurrent, flashAlphaCurrent);
	
	shader_reset();
}
