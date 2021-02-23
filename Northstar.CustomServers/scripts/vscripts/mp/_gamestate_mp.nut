global function PIN_GameStart
global function SetGameState
global function GameState_EntitiesDidLoad
global function WaittillGameStateOrHigher

global function GameState_GetTimeLimitOverride
global function IsRoundBasedGameOver
global function ShouldRunEvac
global function GiveTitanToPlayer
global function GetTimeLimit_ForGameMode

void function PIN_GameStart()
{
	// called from InitGameState
	FlagInit( "ReadyToStartMatch" )
	
	
	AddCallback_GameStateEnter( eGameState.WaitingForCustomStart, GameStateEnter_WaitingForCustomStart )
	AddCallback_GameStateEnter( eGameState.WaitingForPlayers, GameStateEnter_WaitingForPlayers )
	AddCallback_GameStateEnter( eGameState.PickLoadout, GameStateEnter_PickLoadout )
	AddCallback_GameStateEnter( eGameState.Prematch, GameStateEnter_Prematch )
	AddCallback_GameStateEnter( eGameState.Playing, GameStateEnter_Playing )
	// todo others
}

void function SetGameState( int newState )
{
	level.nv.gameStartTime = Time()
	level.nv.gameStateChangeTime = Time()
	level.nv.gameState = newState
	svGlobal.levelEnt.Signal( "GameStateChanged" )

	// added in AddCallback_GameStateEnter
	foreach ( callbackFunc in svGlobal.gameStateEnterCallbacks[ newState ] )
	{
		callbackFunc()
	}
}

void function GameState_EntitiesDidLoad()
{
	if ( GetClassicMPMode() )
	{
		level.classicMP_levelSetupForIntro = ClassicMP_CallIntroLevelSetupFunc()			
		level.canStillSpawnIntoIntro = level.classicMP_levelSetupForIntro
	}
}

void function WaittillGameStateOrHigher( int gameState )
{
	while ( GetGameState() < gameState )
		svGlobal.levelEnt.WaitSignal( "GameStateChanged" )
}

void function GameStateEnter_WaitingForCustomStart()
{

}

void function GameStateEnter_WaitingForPlayers()
{

}

void function GameStateEnter_PickLoadout()
{

}

void function GameStateEnter_Prematch()
{

}

void function GameStateEnter_Playing()
{

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

