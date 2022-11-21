audio_play_sound( sndEnemySpawn, 4, false );

hp = 60;
hpCurrent = hp;
hpLast = hpCurrent;

target = oPlayer;


flashAlphaSpawn = 0.8;
flashAlphaHurt = 0.8;
flashAlphaCurrent = flashAlphaSpawn;

flashSubtractSpawn = 0.05;
flashSubtractHurt = 0.1;

flashColorSpawn = c_red;
flashColorHurt = c_white;
flashColorCurrent = flashColorSpawn;

#region Movement Code
hsp = 0;
hspFraction = 0;


hDir = 0;


hspMaxCurrent = 2;

hAccelCurrent = 0.5;

hDecelCurrent = 0.2;


vsp = 0;
vspFraction = 0;


vDir = 0;


vspMaxCurrent = 2;

vAccelCurrent = 0.5;

vDecelCurrent = 0.2;

noclip = false;
#endregion


#region Weapon
cooldown = 0;
EnemyWeaponData();
weaponCurrent = weapons.smg;
#endregion


#region Directional Sprite Code
direction = 270;
mDir = 0;

directions = 8;

angle = 0;
angleAimDelay = 0.2;
anglePrevious = 0;
angleInterval = ( 360 / directions );


for (var i = 0; i < weapons.size; i++)
{
	for (var j = 0; j < directions; j++)
	{
		spriteData[i][j] = [-3, -3, 1, 1, 0, c_white, 1];
	}
}


EnemySpriteData();


defaultarray = spriteData[0][0];

for (var i = 0; i < weapons.size; i++)
{
	while( array_length(spriteData[i]) < directions ) array_push(spriteData[i], [-3, -3, 1, 1, 0, c_white, 1]);
	
	for (var j = 0; j < directions; j++)
	{
		while( array_length(spriteData[i][j]) < array_length(defaultarray) ) array_push(spriteData[i][j], defaultarray[array_length(spriteData[i][j])]);
	}
}
#endregion
