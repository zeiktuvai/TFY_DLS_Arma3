/*
	Author: zeik_tuvai

	Dynamic Loadout System v1.1
*/
TFY_fnc_ApplyCustomLoadout = compile preprocessFile "TFY_DLS_Arma3\functions\TFY_fnc_ApplyCustomLoadout.sqf";

private _playerObject = player;
_vars = player getVariable ["Loadout_Vars",[]];
_vars params ["_playerConfig"];

if ("initialLoadout" in _playerConfig) then
{
	private _initial = _playerConfig get "initialLoadout"; 
	[_playerObject, _initial] call TFY_fnc_ApplyCustomLoadout;
};

if ("respawnLoadouts" in _playerConfig) then
{
    private _respawn = _playerConfig get "respawnLoadouts";

	if ("all" in _respawn) then
	{
		private _configClasses = "true" configClasses (missionConfigFile >> "CfgRespawnInventory");
		private _loadouts = _configClasses apply { configName _x };

		{
			[_playerObject, _x] call BIS_fnc_addRespawnInventory;
		} forEach _loadouts;

	}
	else
	{
		{
			[_playerObject, _x] call BIS_fnc_addRespawnInventory;
		} forEach _respawn;
	};
};

if (!"respawnLoadouts" in _playerConfig && "initialLoadout" in _playerConfig)
{
	private _load = _playerConfig get "initialLoadout"; 
	[_playerObject, _load] call BIS_fnc_addRespawnInventory;
}

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
