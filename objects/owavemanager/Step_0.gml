var enemyArray = waveEnemies[arenaCurrent][waveCurrent];

if ( cooldownCurrent != 0 )
{
	cooldownCurrent = max( 0, cooldownCurrent-1 );
}
else
{
	if ( instance_number(oParEnemy) != enemyAmountCurrent )
	{
		with( instance_find(oSpawnerWave, irandom_range( 0, instance_number(oSpawnerWave)) ) )
		{
			instance_create_layer( x, y, "Layer2", enemyArray[irandom_range(0, array_length(enemyArray)-1)] )
		}
	}
	cooldownCurrent = waveData[arenaCurrent][waveCurrent][wavevars.cooldown];
}

if ( enemyAmountCurrent == 0 )
{
	if ( waveCurrent == wave.three )
	{
		if ( intermissionCurrent == waveData[arenaCurrent][waveCurrent][wavevars.intermission] )
		{
			audio_stop_sound(musWave1);
			audio_stop_sound(musWave2);
			audio_stop_sound(musWave3);
			audio_play_sound( musFanfare, 5, false );
			//oPlayer.playerStateCurrent = playerstate.win;
			//oPlayer.flashAlphaCurrent = 0;
			//instance_destroy(oWeapon);
			image_speed = 1;
		}
		//show_debug_message( "set player to win playerstate" );
	}
	
	intermissionCurrent = max( 0, intermissionCurrent-1 );
	
	if ( intermissionCurrent == 0 )
	{
		if ( waveCurrent != wave.three )
		{
			waveCurrent++;
			waveSignCooldownCurrent = waveSignCooldown;
			enemyAmountCurrent = waveData[arenaCurrent][waveCurrent][wavevars.enemyamount];
			cooldownCurrent = 0;
			intermissionCurrent = waveData[arenaCurrent][waveCurrent][wavevars.intermission];
			//show_debug_message( "set to next wave and set enemyamount and cooldown" );
		}
		else room_goto_next();
	}
}


if ( waveSignCooldownCurrent == 0 )
{
	waveSignY = round(lerp(waveSignY, -70, 0.1));
	arenaSignY = round(lerp(arenaSignY, display_get_gui_height() + 70, 0.1));
}
else
{
	waveSignY = round(lerp(waveSignY, 70, 0.1));
	if (waveCurrent = wave.one) arenaSignY = round(lerp(arenaSignY, display_get_gui_height() - 70, 0.1));
	waveSignCooldownCurrent--;
}
