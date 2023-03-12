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

wall_escape( oParEnemy );

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
	if ( distance_to_object(oPlayer) <= 100 )
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
}
#endregion

angle = ( round(direction / angleInterval) ) mod directions;

if ( spriteData[weaponCurrent][angle][playersprite.index] != -2 ) anglePrevious = angle; else angle = anglePrevious;
