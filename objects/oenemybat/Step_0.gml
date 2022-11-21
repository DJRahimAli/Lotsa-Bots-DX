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
if ( instance_exists( target ) && point_distance(x, 0, target.x, 0) >= 100 ) hDir = sign(target.x - x); else hDir = 0;

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
if ( instance_exists( target ) && point_distance(0, y, 0, target.y) >= 100 ) vDir = sign(target.y - y); else vDir = 0;

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

wall_escape( oParEnemy );
#endregion

#region Weapon State
var array = weapon[weaponCurrent];
	
if ( instance_exists(target) ) mDir = point_direction( x, y, target.x, target.y );
var Diff = angle_difference( mDir, direction );

direction += Diff * angleAimDelay;

cooldown = max( 0, cooldown-1 );
			
if ( cooldown != 0 )
{
	if ( image_index == image_number-1 ) image_speed = 0;
}
else
{
	image_speed = 1;
	cooldown = weapon[weaponCurrent][weaponvars.cooldown];
	repeat(weapon[weaponCurrent][weaponvars.amount])
	{
		with ( instance_create_layer( x, y, "Layer1", oHurtboxEnemy ) ) 
		{
			timer  = array[weaponvars.timer];
			length = array[weaponvars.length];
			spd	   = array[weaponvars.spd];
			damage = array[weaponvars.damage];
			bullet = array[weaponvars.bullet];
			var spreadmin = array[weaponvars.spreadmin];
			var spreadmax = array[weaponvars.spreadmax];
			var spread = irandom_range(-spreadmax, spreadmax);
			var spreadfinal = clamp( abs(spread), spreadmin, spreadmax );
			dir = round(other.direction + spreadfinal*sign(spread));
			sprite_index = array[weaponvars.sprite];
			mask_index = array[weaponvars.mask];
			image_xscale = array[weaponvars.xscale];
			image_yscale = array[weaponvars.yscale];
			image_angle = array[weaponvars.rot];
			image_blend = array[weaponvars.col];
			image_alpha = array[weaponvars.alpha];
			enemyid = other.id;
		}
	}
}
#endregion

angle = ( round(direction / angleInterval) ) mod directions;

if ( spriteData[weaponCurrent][angle][playersprite.index] != -2 ) anglePrevious = angle; else angle = anglePrevious;
