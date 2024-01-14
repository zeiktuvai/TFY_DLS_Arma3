/*
	Author: zeik_tuvai

	Dynamic Loadout System v1.2
*/
// Update These Values:
// Enable respawn selection on each player.
private _enableRespawnOnPlayer = true;
// Set faction for player respawn positions (0: BLUFOR, 1: OPFOR, 2: INDEPENDANT)
private _RoPFaction = 0;
// Enable TFAR radios
private _enableTFAR = true;


// Register custom functions
TFY_fnc_ApplyCustomLoadout = compile preprocessFile "TFY_DLS_Arma3\functions\TFY_fnc_ApplyCustomLoadout.sqf";
TFY_fnc_ApplyRespawnInventories = compile preprocessFile "TFY_DLS_Arma3\functions\TFY_fnc_ApplyRespawnInventories.sqf";
TFY_fnc_AddPlayerRespawn = compile preprocessFile "TFY_DLS_Arma3\functions\TFY_fnc_AddPlayerRespawn.sqf";
DLS_GetLoadout = compile preprocessFile "TFY_DLS_Arma3\DLS_Loadouts.sqf";

// Declare local variables
private _playerClass = typeOf player;
private _playerObject = player;

// Get class loadouts
private _playerLoadout = [_playerClass] call DLS_GetLoadout;

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

if(_enableTFAR == true) then
{
	_playerObject unassignItem "rhsusf_radio_anprc152";
	_playerObject removeItem "rhsusf_radio_anprc152";
	_playerObject addItem "TFAR_anprc152";
	_playerObject assignItem "TFAR_anprc152";
};