/* "What's this" code
if ( cooldownCurrent <= 0 && textAmountCurrent != 0 )
{
	arrayCurrent++;
	arrayCurrent = arrayCurrent mod array_length(array);
	
	cooldownCurrent = array[arrayCurrent,1];
	
	text = string_insert( text, array[arrayCurrent,0], 0);
	if ( array[arrayCurrent,0] == -1 && is_real(array[arrayCurrent,0]) ) text = "";
	
	textAmountCurrent--;
}

if ( cooldownCurrent > 0 ) cooldownCurrent--;


if ( array[arrayCurrent,0] == -2 && is_real(array[arrayCurrent,0]) )
{
	arrayCurrent = array[arrayCurrent,1];
	
	cooldownCurrent = array[arrayCurrent,1];
	
	text = array[arrayCurrent,0];
	if ( array[arrayCurrent,0] == -1 && is_real(array[arrayCurrent,0]) ) text = "";
	
	textAmountCurrent = textAmount;
}*/

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
