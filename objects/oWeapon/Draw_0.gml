var array = spriteData[oPlayer.characterCurrent][oPlayer.weaponCurrent][oPlayer.weaponStateCurrent][oPlayer.angle];
//show_debug_message(oPlayer.weaponStateCurrent)

sprite_index = array[sprite.index];

image_xscale = array[sprite.xscale];
image_yscale = array[sprite.yscale];

image_angle = array[sprite.rot];

image_blend = array[sprite.col];

image_alpha = array[sprite.alpha];

if ( sprite_index <= -3 ) sprite_index = sMissing;

if ( sprite_index != -1 ) draw_sprite_ext(sprite_index, image_index, oPlayer.x, oPlayer.y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);


if ( oPlayer.flashAlphaCurrent != 0 )
{
	shader_set(shFlash);
	
	draw_sprite_ext(sprite_index, image_index, oPlayer.x, oPlayer.y, image_xscale, image_yscale, image_angle, oPlayer.flashColorCurrent, oPlayer.flashAlphaCurrent);
	
	shader_reset();
}
