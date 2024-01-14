# Dynamic Loadout System for Arma 3

The Dynamic Loadout System is intended to make using standard defined loadouts much easier.  Loadouts defined in ACE Arsenal can be inported into this system and used to apply the loadouts to a unit on initial spawn, and allowing players to select their loadout when respawning.

It achieves this by recognizing what NATO units have been placed and automatically inferring the loadout based on the unit type.  This **ONLY WORKS WITH STANDARD NATO UNITS**.

The following steps will walk you through using the DLS:

1. Clone this repo into your mission folder using `git clone https://github.com/zeiktuvai/TFY_DLS_Arma3.git` (You will be able to update it easily if new loadouts are added by moving into the `TFY_DLS_Arma3` folder and running `git pull`).
2. Modify your `description.ext` to have the following code at the top: `#include "TFY_DLS_Arma3\Respawn.cfg"`.  (I have included one if you wish to use it, just copy it from this folder into your main mission folder).
    - WARNING: Make sure your `description.ext` doesn't have any respawn properties in it, also make sure class CfgRoles and CfgRespawnInventory is not in the file.
3. In your `initPlayerLocal.sqf` (if you do not have one then you will have to create one) add the following code: `#include "TFY_DLS_Arma3\DLS.sqf"` (I have included one if you wish to use it, just copy it from this folder into your main mission folder).
4. Update the paramaters at the top of DLS.sqf to change features per mission.  Currently, the following features are:
    - Enable Respawn positions on each player. (true: to enable; false: to disable).
        - _RoPFaction needs to be set as well, for blufor it is 0.
    - Enable night uniforms.
5. Place your playable units on the map using the standard **NATO - MEN** units. (See below for a list of supported units).

**Supported NATO Units**
- Ammo Bearer
- Autorifleman
- Combat Life Saver
- Crewman
- Engineer
- Grenadier
- All three Gunners
- Heavy Gunner
- Marksman
- Both Missile Specialists
- Rifleman/(AT)/(LightAT)/(Light)
- Sharpshooter
- Squad Leader
- Team Leader
- All UAV/UGV

[Change Log](/Docs/Changelog.md)  

[How to update which loadouts are assigned](/Docs/Updating%20Assigned%20Loadouts.md)