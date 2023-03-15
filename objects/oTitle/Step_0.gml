//Fade in
if ( cooldownCurrent > 0 )
{
	oLogo.image_alpha = approach(oLogo.image_alpha, 1, fadeinAmountCurrent);
	oButton.image_alpha = approach(oButton.image_alpha, 1, fadeinAmountCurrent);
	oTitle.image_alpha = approach(oTitle.image_alpha, 1, fadeinAmountCurrent);
}

//Decrease cooldown
//if ( cooldownCurrent > 0 ) cooldownCurrent--;
cooldownCurrent = max( 0, cooldownCurrent-1 );

//Fade out
if ( cooldownCurrent <= 0 )
{
	oLogo.image_alpha = approach(oLogo.image_alpha, 0, fadeoutAmountCurrent);
	oButton.image_alpha = approach(oButton.image_alpha, 0, fadeoutAmountCurrent);
	oTitle.image_alpha = approach(oTitle.image_alpha, 0, fadeoutAmountCurrent);
}

//Reset cooldown
if (!oButton.clicked) && ( (mousexPrevious != mouse_x || mouseyPrevious != mouse_y) || device_mouse_check_button(0,mb_left) ) cooldownCurrent = cooldown;

mousexPrevious = mouse_x;
mouseyPrevious = mouse_y;


//Button
if (oButton.image_alpha == 0) && (oButton.clicked && oButton.buttonCurrent == 0)
{
	audio_stop_all();
	room_goto_next();
}
