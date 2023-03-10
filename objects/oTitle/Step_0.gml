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

var fadeinAmount = 0.1;
var fadeoutAmount = 0.1;

//Fade in
if ( cooldownCurrent > 0 )
{
	oLogo.image_alpha = approach(oLogo.image_alpha, 1, fadeinAmount);
	oButton.image_alpha = approach(oButton.image_alpha, 1, fadeinAmount);
	oTitle.image_alpha = approach(oTitle.image_alpha, 1, fadeinAmount);
}

//Decrease cooldown
if ( cooldownCurrent > 0 ) cooldownCurrent--;

//Fade out
if ( cooldownCurrent <= 0 )
{
	oLogo.image_alpha = approach(oLogo.image_alpha, 0, fadeoutAmount);
	oButton.image_alpha = approach(oButton.image_alpha, 0, fadeoutAmount);
	oTitle.image_alpha = approach(oTitle.image_alpha, 0, fadeoutAmount);
}

//Reset cooldown
if ( mousexChanged != mouse_x || mouseyChanged != mouse_y )
{
	mousexChanged = mouse_x;
	mouseyChanged = mouse_y;
	cooldownCurrent = cooldown;
}
