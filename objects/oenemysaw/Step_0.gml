if ( flashColorCurrent == flashColorSpawn ) flashAlphaCurrent = max( 0, flashAlphaCurrent-flashSubtractSpawn );

if ( flashColorCurrent == flashColorHurt ) flashAlphaCurrent = max( 0, flashAlphaCurrent-flashSubtractHurt );

if (hpCurrent != hpLast)
{
	if (hpCurrent < hpLast)
	{
		flashAlphaCurrent = flashAlphaHurt;
		flashColorCurrent = flashColorHurt;
	}
	hpLast = hpCurrent;
}

#region Movement Code
//Horizontal Movement
if ( instance_exists( target ) ) hDir = sign(target.x - x);

if ( hDir == 0 )
{
	if ( hDecelCurrent == -1 )
	{
		hsp = 0;
	}
	else
	{
		//Deceleration
		hsp = approach( hsp, 0, hDecelCurrent );
	}
}
else
{
	if ( hAccelCurrent == -1 )
	{
		hsp = hspMaxCurrent * hDir;
					
		//Clamp Horizontal Speed to Max Horizontal Speed
		hsp = clamp( hsp, -hspMaxCurrent * abs( hDir ), hspMaxCurrent * abs( hDir ) );
	}
	else
	{
		//Acceleration
		hsp += hAccelCurrent * hDir;
					
		//Clamp Horizontal Speed to Max Horizontal Speed
		hsp = clamp( hsp, -hspMaxCurrent * abs( hDir ), hspMaxCurrent * abs( hDir ) );
	}
}


//Vertical Movement
if ( instance_exists( target ) ) vDir = sign(target.bbox_bottom - y);

if ( vDir == 0 )
{
	if ( vDecelCurrent == -1 )
	{
		vsp = 0;
	}
	else
	{
		//Deceleration
		vsp = approach( vsp, 0, vDecelCurrent );
	}
}
else
{
	if ( vAccelCurrent == -1 )
	{
		vsp = vspMaxCurrent * vDir;
					
		//Clamp Horizontal Speed to Max Horizontal Speed
		vsp = clamp( vsp, -vspMaxCurrent * abs( vDir ), vspMaxCurrent * abs( vDir ) );
	}
	else
	{
		//Acceleration
		vsp += vAccelCurrent * vDir;
					
		//Clamp Horizontal Speed to Max Horizontal Speed
		vsp = clamp( vsp, -vspMaxCurrent * abs( vDir ), vspMaxCurrent * abs( vDir ) );
	}
}


//Re apply fractions
hsp += hspFraction;
vsp += vspFraction;

//Store and Remove fractions
//Important: go into collision with whole integers ONLY!
hspFraction = hsp - (floor(abs(hsp)) * sign(hsp));
hsp -= hspFraction;
vspFraction = vsp - (floor(abs(vsp)) * sign(vsp));
vsp -= vspFraction;


//Horizontal Collision
if ( place_meeting( round( x ) + ceil_signed( hsp ), round( y ), oCollision ) )
{
	while( !place_meeting( x + sign( hsp ), y, oCollision) ) x += sign( hsp );
	hsp = 0;
}

if ( instance_place( round( x ) + ceil_signed( hsp ), round( y ), oParEnemy ) )
{
	while( !instance_place( x + sign( hsp ), y, oParEnemy) ) x += sign( hsp );
	hsp = 0;
}
x += hsp;

//Vertical Collision
if ( place_meeting( round( x ), round( y ) + ceil_signed( vsp ), oCollision ) )
{
	while( !place_meeting(x, y + sign( vsp ), oCollision ) ) y += sign( vsp );
	vsp = 0;
}

if ( instance_place( round( x ), round( y ) + ceil_signed( vsp ), oParEnemy ) )
{
	while( !instance_place(x, y + sign( vsp ), oParEnemy ) ) y += sign( vsp );
	vsp = 0;
}
y += vsp;

//wall_escape( oCollision );
wall_escape( oParEnemy );

//image_speed = clamp(abs(abs(hDir) + abs(vDir)), 0, 1);
//if ( abs(hsp) + abs(vsp) == 0 )
//{
//	image_speed = 0;
//	//image_index = 0;
//}
#endregion

switch (state)
{
	case 0:
	{
		if ( place_meeting( x, y, target ) )
		{
			cooldownCurrent = cooldown;
			target.hpCurrent = max( 0, target.hpCurrent-damage );
			if ( cooldown != 0 ) state = 1;
		}
	} break;
	
	case 1:
	{
		cooldownCurrent = max( 0, cooldownCurrent-1 );
		
		if ( cooldownCurrent == 0 ) state = 0;
	} break;
}
