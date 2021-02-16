global function CodeCallback_MapInit

struct {

} file

void function CodeCallback_MapInit()
{
	AddCallback_GameStateEnter( eGameState.WaitingForPlayers, WargamesIntroStart )  // This starts the main intro control thread
	AddCallback_GameStateEnter( eGameState.PickLoadout, Wargames_GameStateEnterFunc_PickLoadout )
	AddCallback_GameStateEnter( eGameState.Prematch, Wargames_GameStateEnterFunc_PrematchCallback )
}

void function Wargames_Intro_LevelSetupFunc()
{
	
}

void function Wargames_ClassicMPIntroSpawn()
{

}

void function Wargames_PrematchSpawnPlayersFunc()
{

}

void function WargamesIntroStart()
{

}

void function Wargames_GameStateEnterFunc_PickLoadout()
{
	level.nv.minPickLoadOutTime = Time() + 0.5
}

void function Wargames_GameStateEnterFunc_PrematchCallback()
{

}