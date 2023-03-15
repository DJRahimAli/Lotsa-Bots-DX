if (!oButton.clicked)
{
	audio_play_sound( pressSound, 4, false, 1, 0, pressPitch );
	
	//Shake
	if ( shakeMagnitude > shake )
	{
		shake = shakeMagnitude;
	}
}

oButton.buttonCurrent = button;
oButton.clicked = true;
oTitle.cooldownCurrent = 0;
oTitle.fadeoutAmountCurrent = oTitle.fadeoutAmountClicked;
