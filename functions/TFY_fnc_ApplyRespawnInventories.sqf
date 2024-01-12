/*
	Author: zeik_tuvai

	Description:
		Sets the unit respawn loadouts based on provided names from CfgRespawnInventory.

	Parameter(s):
        object - Unit object (player or unit).
        array - Array of loadout names from CfgRespawnInventory (string)

	Examples:
		[player, loadouts] call TFY_fnc_ApplyRespawnInventories;

	Dynamic Loadout System v1.2
*/

params ["_unit", "_respawn"];

if ("all" in _respawn) then
{
    private _configClasses = "true" configClasses (missionConfigFile >> "CfgRespawnInventory");
    private _loadouts = _configClasses apply { configName _x };

    {
        [_unit, _x] call BIS_fnc_addRespawnInventory;
    } forEach _loadouts;

}
else
{
    {
        [_unit, _x] call BIS_fnc_addRespawnInventory;
    } forEach _respawn;
};