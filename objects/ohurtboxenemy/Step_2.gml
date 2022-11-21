if ( bullet )
{
	x += lengthdir_x(spd, dir);
	y += lengthdir_y(spd, dir);
}
else
{
	if ( instance_exists(enemyid) )
	{
		x = enemyid.x;
		y = enemyid.y;
		
		x += lengthdir_x(length, round(enemyid.direction));
		y += lengthdir_y(length, round(enemyid.direction));
	}
}

round_position();


if ( timer >= 0 ) timer = max( 0, timer-1 );

if ( timer == 0
|| bullet && place_meeting(x, y, oCollision)
) instance_destroy();
