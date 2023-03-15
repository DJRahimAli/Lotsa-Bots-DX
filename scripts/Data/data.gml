function WeaponData()
{
	weapon[weapons.none]	= [ 0,  0, 0,  0,   0,  0,  true,  0, 0,  sMissing, sMissing,	1, 1, 0, c_white, 1 ];
	weapon[weapons.unarmed] = [ 20, 1, 10, 132, 0,  18, false, 0, 0,  -1,		sBatHitbox, 1, 1, 0, c_white, 1 ];
	weapon[weapons.smg]		= [ 7,  1, 30, 0,   20, 15, true,  0, 5,  sBullet,  sBullet,	1, 1, 0, c_white, 1 ];
	weapon[weapons.shotgun] = [ 40, 3, 20, 0,   20, 15, true,  2, 15, sBullet,  sBullet,	1, 1, 0, c_white, 1 ];
}

function PlayerSpriteData()
{
	spriteData[character.arrow][playerstate.idle]  = [ [sArrowr, sArrowd, 1, 1, 0, c_white],  [sArrowur, sArrowd, 1, 1, 0, c_white],  [sArrowu, sArrowd, 1, 1, 0, c_white],  [sArrowul, sArrowd, 1, 1, 0, c_white],   [sArrowl, sArrowd, 1, 1, 0, c_white],   [sArrowdl, sArrowd, 1, 1, 0, c_white],   [sArrowd, sArrowd, 1, 1, 0, c_white],  [sArrowdr, sArrowd, 1, 1, 0, c_white]  ];

	spriteData[character.arrow][playerstate.idle]  = [ [sArrowr, sArrowd, 1, 1, 0, c_red],  [sArrowur, sArrowd, 1, 1, 0, c_red],  [sArrowu, sArrowd, 1, 1, 0, c_red],  [sArrowul, sArrowd, 1, 1, 0, c_red],   [sArrowl, sArrowd, 1, 1, 0, c_red],   [sArrowdl, sArrowd, 1, 1, 0, c_red],   [sArrowd, sArrowd, 1, 1, 0, c_red],  [sArrowdr, sArrowd, 1, 1, 0, c_red]  ];
	
	
	spriteData[character.player][playerstate.idle] = [ [sPlayerR, sPlayerD], [sPlayerUR, sPlayerD], [sPlayerU, sPlayerD], [sPlayerUR, sPlayerD, -1], [sPlayerR, sPlayerD, -1], [sPlayerDR, sPlayerD, -1], [sPlayerD, -2], [sPlayerDR, sPlayerD] ];
	
	spriteData[character.player][playerstate.dead] = [ [sPlayerDeadR, sPlayerD], [sPlayerDeadU, sPlayerD], [sPlayerDeadU, sPlayerD], [sPlayerDeadU, sPlayerD], [sPlayerDeadR, sPlayerD, -1 ], [sPlayerDeadD, sPlayerD], [sPlayerDeadD, sPlayerD], [sPlayerDeadD, sPlayerD] ];
	
	
}

function WeaponSpriteData()
{
	spriteData[character.player][weapons.unarmed][weaponstate.idle]    = [ [sWeaponPlayerBatR], [sWeaponPlayerBatUR], [sWeaponPlayerBatU], [sWeaponPlayerBatUR, -1], [sWeaponPlayerBatR, -1], [sWeaponPlayerBatDR, -1], [sWeaponPlayerBatD], [sWeaponPlayerBatDR] ];
	spriteData[character.player][weapons.unarmed][weaponstate.primary] = [ [sWeaponPlayerBatSwingR], [sWeaponPlayerBatSwingUR], [sWeaponPlayerBatSwingU], [sWeaponPlayerBatSwingUR, -1], [sWeaponPlayerBatSwingR, -1], [sWeaponPlayerBatSwingDR, -1], [sWeaponPlayerBatSwingD], [sWeaponPlayerBatSwingDR] ];
	
	spriteData[character.player][weapons.smg][weaponstate.idle]     = [ [sWeaponPlayerSMGR], [sWeaponPlayerSMGUR], [sWeaponPlayerSMGU], [sWeaponPlayerSMGUR, -1], [sWeaponPlayerSMGR, -1], [sWeaponPlayerSMGDR, -1], [sWeaponPlayerSMGD], [sWeaponPlayerSMGDR] ];
	spriteData[character.player][weapons.smg][weaponstate.primary]     = [ [sWeaponPlayerShootSMGR], [sWeaponPlayerShootSMGUR], [sWeaponPlayerShootSMGU], [sWeaponPlayerShootSMGUR, -1], [sWeaponPlayerShootSMGR, -1], [sWeaponPlayerShootSMGDR, -1], [sWeaponPlayerShootSMGD], [sWeaponPlayerShootSMGDR] ];
	
	spriteData[character.player][weapons.shotgun][weaponstate.idle] = [ [sWeaponPlayerShotgunR, 1, 1], [sWeaponPlayerShotgunUR, 1, 1], [sWeaponPlayerShotgunU, 1, 1], [sWeaponPlayerShotgunUR, -1, 1], [sWeaponPlayerShotgunR, -1, 1], [sWeaponPlayerShotgunDR, -1, 1], [sWeaponPlayerShotgunD, 1, 1], [sWeaponPlayerShotgunDR, 1, 1] ];
	spriteData[character.player][weapons.shotgun][weaponstate.primary] = [ [sWeaponPlayerShootShotgunR, 1, 1], [sWeaponPlayerShootShotgunUR, 1, 1], [sWeaponPlayerShootShotgunU, 1, 1], [sWeaponPlayerShootShotgunUR, -1, 1], [sWeaponPlayerShootShotgunR, -1, 1], [sWeaponPlayerShootShotgunDR, -1, 1], [sWeaponPlayerShootShotgunD, 1, 1], [sWeaponPlayerShootShotgunDR, 1, 1] ];
}


function EnemySpriteData()
{
	spriteData[weapons.unarmed] = [ [sEnemyBigSwingBatR, sEnemyBigD], [sEnemyBigSwingBatUR, sEnemyBigD], [sEnemyBigSwingBatU, sEnemyBigD], [sEnemyBigSwingBatUR, sEnemyBigD, -1], [sEnemyBigSwingBatR, sEnemyBigD, -1], [sEnemyBigSwingBatDR, sEnemyBigD, -1], [sEnemyBigSwingBatD, sEnemyBigD], [sEnemyBigSwingBatDR, sEnemyBigD] ];
	spriteData[weapons.smg]		= [ [sEnemyBigSMGR, sEnemyBigD], [sEnemyBigSMGUR, sEnemyBigD], [sEnemyBigSMGU, sEnemyBigD], [sEnemyBigSMGUR, sEnemyBigD, -1], [sEnemyBigSMGR, sEnemyBigD, -1], [sEnemyBigSMGDR, sEnemyBigD, -1], [sEnemyBigSMGD, sEnemyBigD], [sEnemyBigSMGDR, sEnemyBigD] ];
	spriteData[weapons.shotgun] = [ [sEnemyBigShotgunR, sEnemyBigD], [sEnemyBigShotgunUR, sEnemyBigD], [sEnemyBigShotgunU, sEnemyBigD], [sEnemyBigShotgunUR, sEnemyBigD, -1], [sEnemyBigShotgunR, sEnemyBigD, -1], [sEnemyBigShotgunDR, sEnemyBigD, -1], [sEnemyBigShotgunD, sEnemyBigD], [sEnemyBigShotgunDR, sEnemyBigD] ];
}

function EnemyWeaponData()
{
	weapon[weapons.none]	= [ 0,  0, 0,  0,  0,  0, true,  0, 0,  sMissing,	  sMissing,		1, 1, 0, c_white, 1 ];
	weapon[weapons.unarmed] = [ 80, 1, 10, 50, 0,  6, false, 0, 0,	-1,			  sBatHitbox,   1, 1, 0, c_white, 1 ];
	weapon[weapons.smg]		= [ 36, 1, 30, 0,  15, 5, true,  0, 5,  sBulletEnemy, sBulletEnemy, 1, 1, 0, c_white, 1 ];
	weapon[weapons.shotgun] = [ 80, 3, 20, 0,  15, 3, true,  2, 30, sBulletEnemy, sBulletEnemy, 1, 1, 0, c_white, 1 ];
}


function WaveData()
{
	waveData[arena.white][wave.one]   = [ 240, 5,  240 ];
	waveData[arena.white][wave.two]   = [ 180, 10, 240 ];
	waveData[arena.white][wave.three] = [ 120, 15, 240 ];
	
	waveEnemies[arena.white][wave.one]   = [ oEnemySaw ];
	waveEnemies[arena.white][wave.two]   = [ oEnemySaw, oEnemyBat ];
	waveEnemies[arena.white][wave.three] = [ oEnemySaw, oEnemyBat, oEnemyShotgun ];
	
	
	waveData[arena.blue][wave.one]   = [ 240, 10, 240 ];
	waveData[arena.blue][wave.two]   = [ 180, 15, 240 ];
	waveData[arena.blue][wave.three] = [ 120, 20, 240 ];
	
	waveEnemies[arena.blue][wave.one]   = [ oEnemySaw, oEnemyBat, oEnemyShotgun ];
	waveEnemies[arena.blue][wave.two]   = [ oEnemySaw, oEnemyBat, oEnemyShotgun ];
	waveEnemies[arena.blue][wave.three] = [ oEnemySaw, oEnemyBat, oEnemyShotgun, oEnemySMG ];
	
	
	waveData[arena.red][wave.one]   = [ 240, 25, 240 ];
	waveData[arena.red][wave.two]   = [ 180, 35, 240 ];
	waveData[arena.red][wave.three] = [ 120, 50, 240 ];
	
	waveEnemies[arena.red][wave.one]   = [ oEnemySaw, oEnemyBat, oEnemyShotgun, oEnemySMG ];
	waveEnemies[arena.red][wave.two]   = [ oEnemySaw, oEnemyBat, oEnemyShotgun, oEnemySMG ];
	waveEnemies[arena.red][wave.three] = [ oEnemySaw, oEnemyBat, oEnemyShotgun, oEnemySMG ];
}
