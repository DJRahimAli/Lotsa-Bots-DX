global.dxplay = 1;
layer_background_visible(layer_background_get_id("PLAYLINE"), true);
audio_play_sound( sndcursor, 4, false );
if bumpeffect == 0
{
	if y == 22
	{
		bumpeffect = 1
	}
	else
	{
		y += -2
	}
}
if bumpeffect == 1
{
	if y == 32
	{
		bumpeffect = 2 
	}
	else
	{
		y += 1
	}
}