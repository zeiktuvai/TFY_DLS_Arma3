/*
	Author: zeik_tuvai

	Dynamic Loadout System v1.2
*/

// Register custom functions
TFY_fnc_ApplyCustomLoadout = compile preprocessFile "TFY_DLS_Arma3\functions\TFY_fnc_ApplyCustomLoadout.sqf";
TFY_fnc_ApplyRespawnInventories = compile preprocessFile "TFY_DLS_Arma3\functions\TFY_fnc_ApplyRespawnInventories.sqf";

// Declare local variables
private _playerObject = player;
_vars = player getVariable ["Loadout_Vars",[]];
_vars params ["_playerConfig"];

// Check hashmap for initialLoadout key
if ("initialLoadout" in _playerConfig) then
{
	private _initial = _playerConfig get "initialLoadout"; 
	[_playerObject, _initial] call TFY_fnc_ApplyCustomLoadout;
};

// Check hashmap for respawnLoadouts key
if ("respawnLoadouts" in _playerConfig) then
{
    private _respawn = _playerConfig get "respawnLoadouts";
	[_playerObject, _respawn] call TFY_fnc_ApplyRespawnInventories
};

// Add initialLoadout as respawnLoadout if initial is set but respawn isnt
if (!("respawnLoadouts" in _playerConfig) && "initialLoadout" in _playerConfig) then
{
	private _load = _playerConfig get "initialLoadout"; 
	[_playerObject, _load] call BIS_fnc_addRespawnInventory;
};

// Set each player as respawn point if enabled
if("respawnOnPlayers" in _playerConfig) then
{
	private _side = _playerConfig get "respawnOnPlayers";
	switch (_side) do
	{
		case 0:
		{
			[WEST,_this select 0] call BIS_fnc_addRespawnPosition;
		};
		case 1:
		{
			[EAST,_this select 0] call BIS_fnc_addRespawnPosition;
		};
		case 2:
		{
			[INDEPENDANT,_this select 0] call BIS_fnc_addRespawnPosition;
		};
		default	{};
	};
};
