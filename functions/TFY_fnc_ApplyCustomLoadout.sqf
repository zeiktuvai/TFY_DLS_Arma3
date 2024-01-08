/*
	Author: zeik_tuvai

	Description:
		Sets the unit loadout from a custom loadout.

	Parameter(s):
        object - Unit object (player or unit).
        string - Name of custom loadout.

	Returns:
		bool

	Examples:
		[player, "TFY_Commander"] call TFY_fnc_ApplyCustomLoadout;

	Dynamic Loadout System v1.0
*/

params ["_unit", "_loadout"];

_ld = [_loadout] call TFY_fnc_getCustomLoadout;

_unit setUnitLoadout (_ld);
