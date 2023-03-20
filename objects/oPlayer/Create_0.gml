x = oSpawnerPlayer.x;
y = oSpawnerPlayer.y - sprite_height/2;

audio_play_sound( sndPlayerSpawn, 5, false );

flashAlphaSpawn = 0.8;
flashAlphaHurt = 0.8;
flashAlphaCurrent = flashAlphaSpawn;

flashSubtractSpawn = 0.05;
flashSubtractHurt = 0.1;

flashColorSpawn = c_blue;
flashColorHurt = c_white;
flashColorCurrent = flashColorSpawn;

hp = 100;
hpCurrent = hp;
hpLast = hpCurrent;

respawnCooldown = 120;
respawnCooldownCurrent = respawnCooldown;

#region Controls
keyLeft = false;
keyRight = false;

keyUp = false;
keyDown = false;

keyPrimary = false;

keyNoclip = false;

deadzone = 0.2;
#endregion

#region Movement Code
hsp = 0;
hspPlayer = 0;
hspReal = 0;
hspFraction = 0;


hDir = 0;


hspMaxCurrent = 5;

hAccelCurrent = 0.2;

hDecelCurrent = 0.2;


vsp = 0;
vspPlayer = 0;
vspReal = 0;
vspFraction = 0;


vDir = 0;


vspMaxCurrent = 5;

vAccelCurrent = 0.2;

vDecelCurrent = 0.2;

noclip = false;
#endregion


playerStateCurrent = playerstate.idle;


#region Weapon
cooldown = 0;
WeaponData();
weaponCurrent = weapons.shotgun;
#endregion


#region Directional Sprite Code
direction = 270;
pDir = 0;
mDir = 0;

directions = 8;

angle = 0;
anglePlayerDelay = 0.2;
angleAimDelay = 0.2;
anglePrevious = 0;
angleInterval = ( 360 / directions );

crosshairDistance = 180;

//angleInterval = 45;
//directions = ( 360 / angleInterval );
//directions = 8;

characterCurrent = character.player;
weaponStateCurrent = weaponstate.idle;


for (var i = 0; i < character.size; i++)
{
	for (var j = 0; j < playerstate.size; j++)
	{
		for (var k = 0; k < directions; k++)
		{
			spriteData[i][j][k] = [-3, -3, 1, 1, 0, c_white, 1];
		}
	}
}


//PlayerSpriteData();


defaultarray = spriteData[0][0][0];

for (var i = 0; i < character.size; i++)
{
	for (var j = 0; j < playerstate.size; j++)
	{
		while( array_length(spriteData[i][j]) < directions ) array_push(spriteData[i][j], [-3, -3, 1, 1, 0, c_white, 1]);
		
		for (var k = 0; k < directions; k++)
		{
			while( array_length(spriteData[i][j][k]) < array_length(defaultarray) ) array_push(spriteData[i][j][k], defaultarray[array_length(spriteData[i][j][k])]);
		}
	}
}
#endregion

instance_create_depth( 0, 0, depth-1, oWeapon );
