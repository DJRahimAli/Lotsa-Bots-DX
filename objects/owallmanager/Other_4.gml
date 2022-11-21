for (var i = 0; i < variations; i++)
{
	with( instance_find(oWall, irandom_range( 0, instance_number(oWall)) ) )
	{
		variation = irandom_range( 0, other.image_number );
	}
}

instance_destroy();
