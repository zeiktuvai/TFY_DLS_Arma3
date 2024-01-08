/*
	Author: zeik_tuvai

	Dynamic Loadout System v1.0
*/
TFY_fnc_GetCustomLoadout = compile preprocessFile "TFY_DLS_Arma3\functions\TFY_fnc_GetCustomLoadout.sqf";
TFY_fnc_ApplyCustomLoadout = compile preprocessFile "TFY_DLS_Arma3\functions\TFY_fnc_ApplyCustomLoadout.sqf";

private _playerObject = player;
_vars = player getVariable ["Loadout_Vars",[]];
_vars params ["_initial","_respawn"];

[_playerObject, _initial] call TFY_fnc_ApplyCustomLoadout;

{
    [_playerObject, _x] call BIS_fnc_addRespawnInventory;
} forEach _respawn;