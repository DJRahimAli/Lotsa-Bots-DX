switch (other.pickupCurrent)
{
	case pickup.medkit:
	{
		audio_play_sound( sndPickup, 5, false );
		hpCurrent = min( hp, hpCurrent+other.hp );
		instance_destroy(other);
	} break;
	
	case pickup.medkitsmall:
	{
		audio_play_sound( sndPickup, 5, false );
		hpCurrent = min( hp, hpCurrent+other.hpSmall );
		instance_destroy(other);
	} break;
	
	
	case pickup.unarmed:
	{
		audio_play_sound( sndPickup, 5, false );
		weaponCurrent = weapons.unarmed;
		instance_destroy(other);
	} break;
	
	case pickup.smg:
	{
		audio_play_sound( sndPickup, 5, false );
		weaponCurrent = weapons.smg;
		instance_destroy(other);
	} break;
	
	case pickup.shotgun:
	{
		audio_play_sound( sndPickup, 5, false );
		weaponCurrent = weapons.shotgun;
		instance_destroy(other);
	} break;
}
