audio_play_sound( sndEnemySpawn, 4, false );

hp = 20;
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


state = 0;
cooldown = 50;
cooldownCurrent = 0;
damage = 5;

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
