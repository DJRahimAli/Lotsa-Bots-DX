if (cooldown = 0)
{
	hp -= 1;
	cooldown = 10;
	
	#region /*Shoot out brick particles when hit*/
	
	repeat(irandom_range(3,5))
	{
		with(instance_create_depth(x + 16, y + 16, 0, oBrickParticle))
		{
			motion_set(random(360), random_range(5, 10));
		}
	}
	
	#endregion /*Shoot out brick particles when hit END*/
	
	#region /*What happens at each hp*/
	if ( hp != 0 )
	{
		if ( !audio_is_playing(sndBulletHitWall) ) audio_play_sound(sndBulletHitWall, 0, false);
		sprite_index = sBrickBreak;
		if ( hp < image_number ) image_index++;
		image_speed = 0;
	}
	else
	{
		if ( !audio_is_playing(sndWallBreak) ) audio_play_sound(sndWallBreak, 0, false);
		instance_destroy();
	}
	#endregion /*What happens at each hp END*/
	
}