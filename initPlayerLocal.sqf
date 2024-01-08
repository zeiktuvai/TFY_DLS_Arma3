#include "loadouts\player.sqf"

// Use this code to allow players to respawn on other players (WEST is BLUFOR, EAST is OPFOR).
// Or delete this line.
[WEST,_this select 0] call BIS_fnc_addRespawnPosition;