# This project is now archived and no longer under development.
As the scope expanded beyond loadouts, I decided to rebrand and expand the scope of it to the Mission Support Framework (MSF).  See [here](https://github.com/zeiktuvai/MSF_Arma_3) for the new project.

# Dynamic Loadout System for Arma 3

The Dynamic Loadout System is intended to make using standard defined loadouts much easier.  Loadouts defined in ACE Arsenal can be inported into this system and used to apply the loadouts to a unit on initial spawn, and allowing players to select their loadout when respawning.

It achieves this by recognizing what NATO units have been placed and automatically inferring the loadout based on the unit type.  This **ONLY WORKS WITH STANDARD NATO UNITS**.

The following steps will walk you through using the DLS:

1. Clone this repo into your mission folder using `git clone https://github.com/zeiktuvai/TFY_DLS_Arma3.git` (You will be able to update it easily if new loadouts are added by moving into the `TFY_DLS_Arma3` folder and running `git pull`).
2. Modify your `description.ext` to have the following code at the top: `#include "TFY_DLS_Arma3\Respawn.cfg"`.  (I have included one if you wish to use it, just copy it from the example files folder into your main mission folder).
    - WARNING: Make sure your `description.ext` doesn't have any respawn properties in it, also make sure class CfgRoles and CfgRespawnInventory is not in the file.
3. In your `initPlayerLocal.sqf` (if you do not have one then you will have to create one) add the following code: `#include "TFY_DLS_Arma3\DLS.sqf"` (I have included one if you wish to use it, just copy it from the example files folder into your main mission folder).
4. Create a file in your root mission folder called `DLS_Settings.sqf` (Or copy the one in the example files folder into your root mission folder.) and update the settings to your needs.  Right now the following options are available:  
    - Enable Respawn positions on each player. (true: to enable; false: to disable).
        - _RoPFaction needs to be set as well, for blufor it is 0.
    - Enable night uniforms.
    - ACE End Mission Option.
        - When this option is enabled, an ACE self interaction menu item will be added to certain players upon activation of a trigger.
        - Add a trigger to your mission with the mission ending criteria and name it `trig_end_mission`.
        - Two players can have the option to end the mission, give the player unit the name SL or GM to add the menu item to them. (SL Squad Leader/Commander; GM Game Master).
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

# Overriding defatult loadouts

You can ignore the auto chosen loadout or if using units that are not supported, you can use this to apply loadouts to them.  In the units init add the following code:

```c
    playerConfig = createHashMapFromArray[["initialLoadout","STARTING LOADOUT"],["respawnLoadouts",["RESPAWN","LOADOUTS"]]];
    this setVariable ["override", [playerConfig]];                
```
You can use the below list to set the initial loadout and any respawn loadouts you want to add.  Remember if you put `["respawnLoadouts",["all"]]` in the respawn loadouts array it will give that unit all loadouts.

**Loadout List**

- TFY_Commander
- TFY_Autorifleman
- TFY_Marksman
- TFY_Teamleader
- TFY_Rifleman
- TFY_ATRifleman
- TFY_AARifleman
- TFY_UAVOperator
- TFY_VehicleCrewman
- TFY_Medic
- TFY_Diver_Expl
- TFY_Diver
- TFY_Grenadier
- TFY_MineSpec

[Change Log](/Docs/Changelog.md)  

[How to update which loadouts are assigned](/Docs/Updating%20Assigned%20Loadouts.md)
