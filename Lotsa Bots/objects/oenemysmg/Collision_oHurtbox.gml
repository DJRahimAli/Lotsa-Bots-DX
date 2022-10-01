audio_play_sound(sndEnemyHit, 4, false );
hpCurrent = max( 0, hpCurrent-other.damage );

other.timer = 0;
if ( hpCurrent == 0 ) instance_destroy();
