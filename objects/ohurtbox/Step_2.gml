if ( bullet )
{
	x += lengthdir_x(spd, dir);
	y += lengthdir_y(spd, dir);
}
else
{
	if ( instance_exists(oPlayer) )
	{
		x = oPlayer.x;
		y = oPlayer.y;
		
		x += lengthdir_x(length, round(oPlayer.direction));
		y += lengthdir_y(length, round(oPlayer.direction));
	}
}

round_position();


if ( instance_exists(oPlayer) ) depth = oPlayer.depth + 2*sign(oPlayer.y+8 - y);


if ( timer >= 0 ) timer = max( 0, timer-1 );

if ( timer == 0
|| bullet && place_meeting(x, y, oCollision)
) instance_destroy();
