function EnumInit()
{
	enum character
	{
		none,
		player,
		arrow,
		size
	}
	
	enum weapons
	{
		none,
		unarmed,
		smg,
		shotgun,
		size
	}
	
	enum playerstate
	{
		idle,
		dead,
		win,
		size
	}
	
	enum weaponstate
	{
		idle,
		primary,
		size
	}
	
	enum sprite
	{
		index,
		xscale,
		yscale,
		rot,
		col,
		alpha,
		size
	}
	
	enum playersprite
	{
		index,
		mask,
		xscale,
		yscale,
		rot,
		col,
		alpha,
		size
	}
	
	enum weaponvars
	{
		cooldown,
		amount,
		timer,
		length,
		spd,
		damage,
		bullet,
		spreadmin,
		spreadmax,
		sprite,
		mask,
		xscale,
		yscale,
		rot,
		col,
		alpha,
		size
	}
	
	enum arena
	{
		white,
		blue,
		red,
		size
	}
	
	enum wave
	{
		one,
		two,
		three,
		size
	}
	
	enum wavevars
	{
		cooldown,
		enemyamount,
		intermission,
		size
	}
	
	enum pickup
	{
		medkitsmall,
		medkit,
		unarmed,
		smg,
		shotgun,
		size
	}
}

