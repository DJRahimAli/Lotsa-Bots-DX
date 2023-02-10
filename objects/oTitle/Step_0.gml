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
