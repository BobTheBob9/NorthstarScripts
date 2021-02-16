global function SetGameState
global function GameState_EntitiesDidLoad

global function GameState_GetTimeLimitOverride
global function IsRoundBasedGameOver
global function ShouldRunEvac
global function GiveTitanToPlayer
global function GetTimeLimit_ForGameMode
global function PIN_GameStart

void function SetGameState( int newState )
{
	level.nv.gameStartTime = Time()
	level.nv.gameStateChangeTime = Time()
	level.nv.gameState = newState
	svGlobal.levelEnt.Signal( "GameStateChanged" )

	foreach ( callbackFunc in svGlobal.gameStateEnterCallbacks[ newState ] )
	{
		callbackFunc()
	}
}

void function GameState_EntitiesDidLoad()
{
	if ( GetClassicMPMode() )
	{
		//if ( level.classicMP_introLevelSetupFunc != null && )
	}
}

// idk

float function GameState_GetTimeLimitOverride()
{
	return 100
}

bool function IsRoundBasedGameOver()
{
	return false
}

bool function ShouldRunEvac()
{
	return true
}

void function GiveTitanToPlayer(entity player)
{

}

float function GetTimeLimit_ForGameMode()
{
	return 100.0
}

void function PIN_GameStart()
{

}