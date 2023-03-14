 if ( !instance_exists( oPlayer ) )
{
	with (instance_create_layer( x, y - sprite_height/2, "Layer1", oPlayer ))
	{
		instance_create_layer( x, y, layer, oCamera );
	}
}
