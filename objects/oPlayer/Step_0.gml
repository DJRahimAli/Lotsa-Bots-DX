//Set some rules for the aiming cursor
if (input_source_using(INPUT_GAMEPAD))
{
    //If we're using a gamepad, limit the cursor to 130px away from the player
    input_cursor_limit_circle(x, y, 130);
    
    //We also set an "elastic" rule so that the cursor automatically springs back towards the player
    //Since we've moved the elastic centre we also want to move the cursor itself by the same amount to keep the cursor in sync
    input_cursor_elastic_set(x, y, 0.2, undefined, true);
}
else
{
    //If we're not using the gamepad then remove both the limit and the elastic
    //This allows the cursor to move totally freely as you'd expect with mouse aiming
    input_cursor_elastic_remove();
    input_cursor_limit_remove();
}

//Move the point of aim if the cursor is far enough away from the player
//We perform this distance check so that we don't get twitching when using a gamepad
if (point_distance(x, y, input_cursor_x(), input_cursor_y()) > 10)
{
    aim_direction = point_direction(x, y, input_cursor_x(), input_cursor_y());
}

if ( playerStateCurrent == playerstate.idle )
{
	#region Controls
	if ( !global.mobileControls )
	{
		keyPrimary = input_value("primary");
		keySecondary = input_value("secondary");
	}

	//keyNoclip = keyboard_check_pressed(ord("V"));
	#endregion

	#region Movement Code

	//Horizontal Movement
	hDir = input_x("left", "right", "up", "down");

	if ( hDir == 0 )
	{
		if ( hDecelCurrent == -1 )
		{
			hspPlayer = 0;
		}
		else
		{
			//Deceleration
			hspPlayer += -hspPlayer * hDecelCurrent;
		}
		hMoving = false
	}
	else
	{
		if ( hAccelCurrent == -1 )
		{
			hspPlayer = hspMaxCurrent * hDir;
		}
		else
		{
			//Acceleration
			hspPlayer += ((hspMaxCurrent * hDir) - hspPlayer) * hAccelCurrent;
		}
		hMoving = true;
	}

	hsp = ( hspPlayer );

	//Vertical Movement
	vDir = input_y("left", "right", "up", "down");

	if ( vDir == 0 )
	{
		if ( vDecelCurrent == -1 )
		{
			vspPlayer = 0;
		}
		else
		{
			//Deceleration
			vspPlayer += -vspPlayer * vDecelCurrent;
		}
		vMoving = false;
	}
	else
	{
		if ( vAccelCurrent == -1 )
		{
			vspPlayer = vspMaxCurrent * vDir;
		}
		else
		{
			//Acceleration
			vspPlayer += ((vspMaxCurrent * vDir) - vspPlayer) * vAccelCurrent;
		}
		vMoving = true;
	}

	vsp = ( vspPlayer );
	
	hspReal = hsp;
	vspReal = vsp;
	
	if (hsp == 0) hspFraction = 0;
	if (vsp == 0) vspFraction = 0;
	
	var hspFloat = hsp;
	var vspFloat = vsp;
	
	if ( !noclip )
	{
		//Horizontal Collision
		if ( place_meeting( round( x ) + ceil_signed( hsp ), round( y ), oCollision ) ) hspFloat = 0;
		
		//Vertical Collision
		if ( place_meeting( round( x ), round( y ) + ceil_signed( vsp ), oCollision ) ) vspFloat = 0;
	}
	
	//Player Direction
	pDir = point_direction(0, 0, hspFloat, vspFloat );
	
	
	//Re apply fractions
	hsp += hspFraction;
	vsp += vspFraction;
	
	//Store and Remove fractions
	//Important: go into collision with whole integers ONLY!
	hspFraction = hsp - (floor(abs(hsp)) * sign(hsp));
	hsp -= hspFraction;
	
	vspFraction = vsp - (floor(abs(vsp)) * sign(vsp));
	vsp -= vspFraction;
	
	
	if ( keyNoclip ) noclip = !noclip;
	
	if ( !noclip )
	{
		//Horizontal Collision
		if ( place_meeting( round( x ) + ceil_signed( hspReal ), round( y ), oCollision ) )
		{
			while( !place_meeting( x + sign( hspReal ), y, oCollision) ) x += sign( hspReal );
			hsp = 0;
			hspPlayer = 0;
			hspReal = 0;
			hspFraction = 0;
			hMoving = false;
		}
		x += hsp;
	
		//Vertical Collision
		if ( place_meeting( round( x ), round( y ) + ceil_signed( vspReal ), oCollision ) )
		{
			while( !place_meeting(x, y + sign( vspReal ), oCollision ) ) y += sign( vspReal );
			vsp = 0;
			vspPlayer = 0;
			vspReal = 0;
			vspFraction = 0;
			vMoving = false;
		}
		y += vsp;
	}
	else
	{
		x += hsp;
		y += vsp;
	}
	
	if (hMoving == false && vMoving == false)
	{
		image_speed = 0;
		image_index = 0;
	}
	else image_speed = 1;
	#endregion

	#region Weapon State
	var array = weapon[weaponCurrent];
	
	switch (weaponStateCurrent)
	{
		case weaponstate.idle:
		{
			oWeapon.image_index = 0;
			oWeapon.image_speed = 0;
			
			
			oCamera.camLengthX =  0;
			
			oCamera.camLengthY =  0;
			
			if (audio_is_playing(sndSMG)) audio_stop_sound( sndSMG );
			
			if ( hspReal != 0 || vspReal != 0 ) && ( !keySecondary ) && ( floor(oCamera.camLengthXCurrent) == 0 && floor(oCamera.camLengthYCurrent) == 0 )
			{
				Diff = angle_difference( pDir, direction );
				direction += Diff * anglePlayerDelay;
			}
			
			if ( keyPrimary )
			{
				oWeapon.image_speed = 1;
				if ( !keySecondary ) direction = aim_direction;
				
				weaponStateCurrent = weaponstate.primary;
			}
		} break;
	
		case weaponstate.primary:
		{
			oWeapon.image_speed = 1;
			
			//if ( instance_exists(oAnalogueRight) ) mDir = oAnalogueRight._direction;
			if ( !keySecondary )
			{
				var Diff = angle_difference( aim_direction, direction );
				if ( angleAimDelayPrimary != -1 ) Diff *= angleAimDelayPrimary;
				direction += Diff;
			}
			
			cooldown = max( 0, cooldown-1 );
			
			if ( cooldown != 0 )
			{
				if ( oWeapon.image_index == oWeapon.image_number-1 ) oWeapon.image_speed = 0;
			}
			
			if ( keyPrimary )
			{
				oCamera.camLengthX =  oCamera.camLengthXPrimary;
				
				oCamera.camLengthY =  oCamera.camLengthYPrimary;
				
				if ( cooldown == 0 )
				{
					switch (weaponCurrent)
					{
						case weapons.unarmed:
						{
							if (audio_is_playing(sndSMG)) audio_stop_sound( sndSMG );
							audio_play_sound( sndBat, 5, false );
						} break;
						
						case weapons.smg:
						{
							if (!audio_is_playing(sndSMG)) audio_play_sound( sndSMG, 5, true );
						} break;
						
						case weapons.shotgun:
						{
							if (audio_is_playing(sndSMG)) audio_stop_sound( sndSMG );
							audio_play_sound( sndShotgun, 5, false, 1, 0, random_range(0.9,1) );
						} break;
					}
					
					cooldown = weapon[weaponCurrent][weaponvars.cooldown];
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
				}
			}
			else
			{
				oCamera.camLengthX =  0;
				
				oCamera.camLengthY =  0;
				
				if ( cooldown == 0 ) weaponStateCurrent = weaponstate.idle;
			}
		} break;
	}
	
	
	#endregion
	
	if ( keySecondary )
	{
		oCamera.camLengthX =  oCamera.camLengthXSecondary;
		
		oCamera.camLengthY =  oCamera.camLengthYSecondary;
		
		var Diff = angle_difference( aim_direction, direction );
		if ( angleAimDelaySecondary != -1 ) Diff *= angleAimDelaySecondary;
		direction += Diff;
	}
	
	if ( keyPrimary || keySecondary )
	{
		if (oCamera.camLengthSmoothMax != -1)
		{
			oCamera.camLengthXCurrent += (oCamera.camLengthX - oCamera.camLengthXCurrent) * oCamera.camLengthSmoothMax;
			oCamera.camLengthYCurrent += (oCamera.camLengthY - oCamera.camLengthYCurrent) * oCamera.camLengthSmoothMax;
		}
		else
		{
			oCamera.camLengthXCurrent = oCamera.camLengthX;
			oCamera.camLengthYCurrent = oCamera.camLengthY;
		}
	}
	else
	{
		if (oCamera.camLengthSmoothMin != -1)
		{
			oCamera.camLengthXCurrent += -oCamera.camLengthXCurrent * oCamera.camLengthSmoothMax;
			oCamera.camLengthYCurrent += -oCamera.camLengthYCurrent * oCamera.camLengthSmoothMax;
		}
		else
		{
			oCamera.camLengthXCurrent = 0;
			oCamera.camLengthYCurrent = 0;
		}
	}
	
	angle = ( round(direction / angleInterval) ) mod directions;

	if ( spriteData[characterCurrent][playerStateCurrent][angle][playersprite.index] != -2 ) anglePrevious = angle; else angle = anglePrevious;


	if ( flashColorCurrent == flashColorSpawn ) flashAlphaCurrent = max( 0, flashAlphaCurrent-flashSubtractSpawn );

	if ( flashColorCurrent == flashColorHurt ) flashAlphaCurrent = max( 0, flashAlphaCurrent-flashSubtractHurt );

	if (hpCurrent != hpLast)
	{
		if ( hpCurrent == 0 )
		{
			playerStateCurrent = playerstate.dead;
			flashAlphaCurrent = 0;
			if (audio_is_playing(sndSMG)) audio_stop_sound( sndSMG );
			instance_destroy(oWeapon);
			image_speed = 1;
			hpLast = 0;
		}
		if (hpCurrent < hpLast)
		{
			if ( !audio_is_playing(sndPlayerHit) ) audio_play_sound( sndPlayerHit, 5, false );
			flashAlphaCurrent = flashAlphaHurt;
			flashColorCurrent = flashColorHurt;
		}
		hpLast = hpCurrent;
	}
}


if ( playerStateCurrent == playerstate.dead )
{
	respawnCooldownCurrent = max( 0, respawnCooldownCurrent-1 );
	
	if ( respawnCooldownCurrent == 0 ) instance_destroy();
}
