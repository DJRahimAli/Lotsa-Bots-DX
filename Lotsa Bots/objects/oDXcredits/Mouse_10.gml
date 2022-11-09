global.dxcredits = 1;
layer_background_visible(layer_background_get_id("CREDITSLINE"), true);
audio_play_sound( sndcursor, 4, false );
if bumpeffect == 0
{
	if y == 310
	{
		bumpeffect = 1
	}
	else
	{
		y += (-2)
	}
}
if bumpeffect == 1
{
	if y == 320
	{
		bumpeffect = 2 
	}
	else
	{
		y += 1
	}
}