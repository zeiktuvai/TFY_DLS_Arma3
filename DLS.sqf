/*
	Author: zeik_tuvai

	Dynamic Loadout System v1.2
*/

// Register custom functions
TFY_fnc_ApplyCustomLoadout = compile preprocessFile "TFY_DLS_Arma3\functions\TFY_fnc_ApplyCustomLoadout.sqf";
TFY_fnc_ApplyRespawnInventories = compile preprocessFile "TFY_DLS_Arma3\functions\TFY_fnc_ApplyRespawnInventories.sqf";
TFY_fnc_AddPlayerRespawn = compile preprocessFile "TFY_DLS_Arma3\functions\TFY_fnc_AddPlayerRespawn.sqf";
DLS_GetLoadout = compile preprocessFile "TFY_DLS_Arma3\DLS_Loadouts.sqf";

// Declare local variables
private _playerClass = typeOf player;

// Get class loadouts
private _playerLoadout = [_playerClass] call DLS_GetLoadout;
hint str _playerLoadout;

// Check for null loadout var
if (!isNull _playerLoadout) then
{	
	// Set initial loadout
	[_playerObject, _playerLoadout select 0] call TFY_fnc_ApplyCustomLoadout;
	// Set respawn loadout
	[_playerObject, _playerLoadout select 1] call TFY_fnc_ApplyRespawnInventories;
};


// Set each player as respawn point if enabled
//if("respawnOnPlayers" in _playerConfig) then
//{
//	private _side = _playerConfig get "respawnOnPlayers";
//	[_playerObject, _side] call TFY_fnc_AddPlayerRespawn;
//};
