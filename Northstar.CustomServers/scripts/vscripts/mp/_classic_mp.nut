untyped
global function ClassicMp_Init
global function ClassicMP_TryDefaultIntroSetup
global function ClassicMP_SetIntroLevelSetupFunc
global function ClassicMP_SetIntroPlayerSpawnFunc
global function ClassicMP_SetPrematchSpawnPlayersFunc
global function ClassicMP_CallIntroLevelSetupFunc
global function ClassicMP_CallIntroPlayerSpawnFunc
global function ClassicMP_CallPrematchSpawnPlayersFunc
global function GetClassicMPMode

struct {
	array< string > dropshipIdleAnimsList
	array< string > dropshipIdlePOVAnimsList
	array< string > dropshipJumpAnimsList
	array< string > dropshipJumpPOVAnimsList
	array< int > dropshipAnimsYawList
	
	bool functionref() introLevelSetupFunc
	void functionref( entity ) introPlayerSpawnFunc
	void functionref( array< entity > ) prematchSpawnPlayersFunc
} file

void function ClassicMp_Init()
{
	file.dropshipIdleAnimsList = [ 	"Classic_MP_flyin_exit_playerA_idle",
									"Classic_MP_flyin_exit_playerB_idle",
									"Classic_MP_flyin_exit_playerC_idle",
									"Classic_MP_flyin_exit_playerD_idle" ]
									
	file.dropshipIdlePOVAnimsList = [ "Classic_MP_flyin_exit_povA_idle",
									  "Classic_MP_flyin_exit_povB_idle",
									  "Classic_MP_flyin_exit_povC_idle",
									  "Classic_MP_flyin_exit_povD_idle" ]
								
	file.dropshipJumpAnimsList = [ 	"Classic_MP_flyin_exit_playerA_jump",
									"Classic_MP_flyin_exit_playerB_jump",
									"Classic_MP_flyin_exit_playerC_jump",
									"Classic_MP_flyin_exit_playerD_jump" ]
	
	file.dropshipJumpPOVAnimsList = [ "Classic_MP_flyin_exit_povA_jump",
									  "Classic_MP_flyin_exit_povB_jump",
									  "Classic_MP_flyin_exit_povC_jump",
									  "Classic_MP_flyin_exit_povD_jump" ]
									 
	file.dropshipAnimsYawList = [ -18, 8, 8, -16 ]

	FlagInit( "ClassicMP_UsingCustomIntro", false )
	FlagInit( "GameModeAlwaysAllowsClassicIntro", false )
	
	level.classicMP_levelSetupForIntro <- false
	level.canStillSpawnIntoIntro <- false
}

void function ClassicMP_TryDefaultIntroSetup()
{
	// check if there's already a custom intro
	if ( file.introPlayerSpawnFunc != null )
	{
		// if we are, don't bother doing dropship stuff
		FlagSet( "ClassicMP_UsingCustomIntro" )
		print( "ClassicMP: using custom intro" )
		return
	}
	
	// we're using the standard dropship intro
	// todo
	print( "ClassicMP: using standard dropship intro" )
	AddSpawnCallback( "info_spawnpoint_dropship_start", OnDropshipStartSpawn )
}

void function ClassicMP_SetIntroLevelSetupFunc( bool functionref() setupFunc )
{
	file.introLevelSetupFunc = setupFunc
}

void function ClassicMP_SetIntroPlayerSpawnFunc( void functionref( entity ) playerSpawnFunc )
{
	file.introPlayerSpawnFunc = playerSpawnFunc
}

void function ClassicMP_SetPrematchSpawnPlayersFunc( void functionref( array< entity > ) spawnPlayersFunc )
{
	file.prematchSpawnPlayersFunc = spawnPlayersFunc
}

bool function ClassicMP_CallIntroLevelSetupFunc()
{
	if ( file.introLevelSetupFunc != null )
		return file.introLevelSetupFunc()
	
	return false
}

void function ClassicMP_CallIntroPlayerSpawnFunc( entity player )
{
	file.introPlayerSpawnFunc( player )
}

void function ClassicMP_CallPrematchSpawnPlayersFunc( array< entity > players )
{
	file.prematchSpawnPlayersFunc( players )
}

void function OnDropshipStartSpawn( entity dropship )
{
	// todo
}

bool function GetClassicMPMode()
{
	return true
}