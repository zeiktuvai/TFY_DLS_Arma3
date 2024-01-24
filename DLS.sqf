/*
	Author: zeik_tuvai

	Dynamic Loadout System v1.3
*/
#include "..\DLS_Settings.sqf"

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

// Set end mission menu option 
if(_ACE_endMission) then
{
	if (vehicleVarName player == 'SL' || vehicleVarName player == 'GM') then 
	{ 
		_end_mission = ["end_mission","End Mission","",{ ["end"] remoteExec ["BIS_fnc_endMission", 0]; }, 
		{ triggerActivated trig_end_mission }] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions"], _end_mission] call ace_interact_menu_fnc_addActionToObject;
	};
};
