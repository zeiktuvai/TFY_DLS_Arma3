/*
	Author: zeik_tuvai

	Dynamic Loadout System v1.2
*/
// Update These Values:
// Enable respawn selection on each player.
private _enableRespawnOnPlayer = true;
// Set faction for player respawn positions (0: BLUFOR, 1: OPFOR, 2: INDEPENDANT)
private _RoPFaction = 0;
// Enable Night Uniform
private _night = true;

// ====== DO NOT MODIFY BELOW THIS LINE ======
// Register custom functions
TFY_fnc_ApplyCustomLoadout = compile preprocessFile "TFY_DLS_Arma3\functions\TFY_fnc_ApplyCustomLoadout.sqf";
TFY_fnc_ApplyRespawnInventories = compile preprocessFile "TFY_DLS_Arma3\functions\TFY_fnc_ApplyRespawnInventories.sqf";
TFY_fnc_AddPlayerRespawn = compile preprocessFile "TFY_DLS_Arma3\functions\TFY_fnc_AddPlayerRespawn.sqf";
DLS_GetLoadout = compile preprocessFile "TFY_DLS_Arma3\DLS_Loadouts.sqf";

// Declare local variables
private _playerClass = typeOf player;
private _playerObject = player;

// Get class loadouts
private _ldType = if (_night == true) then { 1 } else { 0 };
private _playerLoadout = [_playerClass, _ldType] call DLS_GetLoadout;

// Check for null loadout var
if (!(isNil "_playerLoadout")) then
{	
	// Set initial loadout
	[_playerObject, _playerLoadout select 0] call TFY_fnc_ApplyCustomLoadout;
	// Set respawn loadout
	[_playerObject, _playerLoadout select 1] call TFY_fnc_ApplyRespawnInventories;
};

// Set each player as respawn point if enabled
if(_enableRespawnOnPlayer == true) then
{
	[_playerObject, 0] call TFY_fnc_AddPlayerRespawn;
};

