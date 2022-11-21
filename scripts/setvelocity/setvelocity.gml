/// @desc SetVelocity(horizontal, vertical)
/// @arg horizontal
/// @arg vertical

function SetVelocity(argument0, argument1)
{
	if ( object_index == oPlayer )
	{
		hspPlayer = argument0;
		vspPlayer = argument1;
	}
	
	hspVelocity = argument0;
	vspVelocity = argument1;
	
	hspMove = argument0;
	vspMove = argument1;
	
	hsp = argument0;
	vsp = argument1;
}