if ( oPlayer.hp == 0 ) instance_destroy( oPlayer );

if ( flashColorCurrent == flashColorSpawn ) flashAlphaCurrent = max( 0, flashAlphaCurrent-flashSubtractSpawn );

if ( flashColorCurrent == flashColorHurt ) flashAlphaCurrent = max( 0, flashAlphaCurrent-flashSubtractHurt );

if (hp != hpLast)
{
	if (hp < hpLast)
	{
		flashAlphaCurrent = flashAlphaHurt;
		flashColorCurrent = flashColorHurt;
	}
	hpLast = hp;
}

#region Controls
keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));

keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));

if ( !global.mobileControls ) keyPrimary = mouse_check_button(mb_left);

keyNoclip = keyboard_check_pressed(ord("V"));
#endregion

#region Movement Code

//Horizontal Movement
if ( !global.mobileControls )
{
	var leftInput = abs( keyLeft );
	var rightInput = abs( keyRight );
	
	if ( leftInput <= deadzone ) leftInput = 0;
	if ( rightInput <= deadzone ) rightInput = 0;
	
	hDir = ( (rightInput*sign(keyRight)) - (leftInput*sign(keyLeft)) );
}
else
{
	var Input = abs( oAnalogueLeft.hDir );
	
	if ( Input <= deadzone ) Input = 0;
	
	hDir = ( Input*sign(oAnalogueLeft.hDir) );
}


if ( hDir == 0 )
{
	if ( hDecelCurrent == -1 )
	{
		hspPlayer = 0;
	}
	else
	{
		//Deceleration
		hspPlayer = approach( hspPlayer, 0, hDecelCurrent );
	}
}
else
{
	if ( hAccelCurrent == -1 )
	{
		hspPlayer = hspMaxCurrent * hDir;
					
		//Clamp Horizontal Speed to Max Horizontal Speed
		hspPlayer = clamp( hspPlayer, -hspMaxCurrent * abs( hDir ), hspMaxCurrent * abs( hDir ) );
	}
	else
	{
		//Acceleration
		hspPlayer += hAccelCurrent * hDir;
					
		//Clamp Horizontal Speed to Max Horizontal Speed
		hspPlayer = clamp( hspPlayer, -hspMaxCurrent * abs( hDir ), hspMaxCurrent * abs( hDir ) );
	}
}

hsp = ( hspPlayer );

//Vertical Movement
if ( !global.mobileControls )
{
	var upInput = abs( keyUp );
	var downInput = abs( keyDown );
	
	if ( upInput <= deadzone ) upInput = 0;
	if ( downInput <= deadzone ) downInput = 0;
	
	vDir = ( (downInput*sign(keyDown)) - (upInput*sign(keyUp)) );
}
else
{
	var Input = abs( oAnalogueLeft.vDir );
	
	if ( Input <= deadzone ) Input = 0;
	
	vDir = ( Input*sign(oAnalogueLeft.vDir) );
}


if ( vDir == 0 )
{
	if ( vDecelCurrent == -1 )
	{
		vspPlayer = 0;
	}
	else
	{
		//Deceleration
		vspPlayer = approach( vspPlayer, 0, vDecelCurrent );
	}
}
else
{
	if ( vAccelCurrent == -1 )
	{
		vspPlayer = vspMaxCurrent * vDir;
					
		//Clamp Horizontal Speed to Max Horizontal Speed
		vspPlayer = clamp( vspPlayer, -vspMaxCurrent * abs( vDir ), vspMaxCurrent * abs( vDir ) );
	}
	else
	{
		//Acceleration
		vspPlayer += vAccelCurrent * vDir;
					
		//Clamp Horizontal Speed to Max Horizontal Speed
		vspPlayer = clamp( vspPlayer, -vspMaxCurrent * abs( vDir ), vspMaxCurrent * abs( vDir ) );
	}
}

vsp = ( vspPlayer );


//Re apply fractions
hsp += hspFraction;
vsp += vspFraction;

//Store and Remove fractions
//Important: go into collision with whole integers ONLY!
hspFraction = hsp - (floor(abs(hsp)) * sign(hsp));
hsp -= hspFraction;
vspFraction = vsp - (floor(abs(vsp)) * sign(vsp));
vsp -= vspFraction;


if ( keyNoclip )
{
	game_restart()
	noclip = !noclip;
}
if ( !noclip )
{
	//Horizontal Collision
	if ( place_meeting( round( x ) + ceil_signed( hsp ), round( y ), oCollision ) )
	{
		while( !place_meeting( x + sign( hsp ), y, oCollision) ) x += sign( hsp );
		hspPlayer = 0;
		hsp = 0;
	}
	x += hsp;
	
	//Vertical Collision
	if ( place_meeting( round( x ), round( y ) + ceil_signed( vsp ), oCollision ) )
	{
		while( !place_meeting(x, y + sign( vsp ), oCollision ) ) y += sign( vsp );
		vspPlayer = 0;
		vsp = 0;
	}
	y += vsp;
}
else
{
	x += hsp;
	y += vsp;
}

image_speed = clamp(abs(abs(hsp) + abs(vsp)), 0, 1);
if ( abs(hsp) + abs(vsp) == 0 )
{
	image_speed = 0;
	image_index = 0;
}
#endregion

#region Weapon State
var array = weapon[other.weaponCurrent];

switch (weaponStateCurrent)
{
	case weaponstate.idle:
	{
		cooldown = other.weapon[weaponCurrent][weaponvars.cooldown];
		
		if ( keyPrimary )
		{
			mDir = point_direction( x, y, mouse_x, mouse_y );
			if ( global.mobileControls ) mDir = oAnalogueRight._direction;
			var Diff = angle_difference( mDir, direction );
			
			if ( !firstShot ) direction += Diff * angleAimDelay; else direction = mDir;
			
			firstShot = false;
			
			repeat(weapon[weaponCurrent][weaponvars.amount])
			{
				with ( instance_create_layer( x, y, "Layer1", oHurtbox ) ) 
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
				}
			}
			
			if ( cooldown != 0 ) weaponStateCurrent = weaponstate.primary;
		}
		else
		{
			firstShot = true;
			
			if ( hsp != 0 || vsp != 0 )
			{
				pDir = point_direction(0, 0, sign(hsp), sign(vsp) );
				Diff = angle_difference( pDir, direction );
				direction += Diff * anglePlayerDelay;
			}
		}
	} break;
	
	case weaponstate.primary:
	{
		mDir = point_direction( x, y, mouse_x, mouse_y );
		if ( global.mobileControls ) mDir = oAnalogueRight._direction;
		var Diff = angle_difference( mDir, direction );
		
		direction += Diff * angleAimDelay;
		
		
		cooldown = max( 0, cooldown-1 );
		
		if ( cooldown == 0 ) weaponStateCurrent = weaponstate.idle;
	} break;
}
#endregion

angle = ( round(direction / angleInterval) ) mod directions;

if ( spriteData[characterCurrent][angle][playersprite.index] != -2 ) anglePrevious = angle; else angle = anglePrevious;
