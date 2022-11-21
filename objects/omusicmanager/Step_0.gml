if ( room != rTitle )
{
	switch (oWaveManager.waveCurrent)
	{
		case wave.one:
		{
			vol1 = approach( vol1, 1, 0.1 );
			vol2 = approach( vol2, 0, 0.1 );
			vol3 = approach( vol3, 0, 0.1 );
		} break;
		
		case wave.two:
		{
			vol1 = approach( vol1, 0, 0.1 );
			vol2 = approach( vol2, 1, 0.1 );
			vol3 = approach( vol3, 0, 0.1 );
		} break;
		
		case wave.three:
		{
			vol1 = approach( vol1, 0, 0.1 );
			vol2 = approach( vol2, 0, 0.1 );
			vol3 = approach( vol3, 1, 0.1 );
		} break;
	}
	
	audio_sound_gain(mus1, vol1, 0);
	audio_sound_gain(mus2, vol2, 0);
	audio_sound_gain(mus3, vol3, 0);
}
