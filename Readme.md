# Using the Dynamic Loadout System

The Dynamic Loadout System is intended to make using standard defined loadouts much easier.  Loadouts defined in ACE Arsenal can be inported into this system and used to apply the loadouts to a unit on initial spawn, and allowing players to select their loadout when respawning.

It achieves this through adding and retrieving variables to the unit object in Eden editor.

The following steps will walk you through using the DLS:

1. Clone this repo into your mission folder using `git clone https://github.com/zeiktuvai/TFY_DLS_Arma3.git` (You will be able to update it easily if new loadouts are added by moving into the `TFY_DLS_Arma3` folder and running `git pull`).
2. Modify your `description.ext` to have the following code at the top: `#include "TFY_DLS_Arma3\Respawn.cfg"`.  (I have included one if you wish to use it, just copy it from this folder into your main mission folder).
    - WARNING: Make sure your `description.ext` doesn't have any respawn properties in it, also make sure class CfgRoles and CfgRespawnInventory is not in the file.
3. In your `initPlayerLocal.sqf` (if you do not have one then you will have to create one) add the following code: `#include "TFY_DLS_Arma3\DLS.sqf"` (I have included one if you wish to use it, just copy it from this folder into your main mission folder).
4. For each unit that you wish to use the system with, place the below code into the units init field:
    ```c
        playerConfig = createHashMapFromArray[["initialLoadout","STARTING LOADOUT"],["respawnLoadouts",["RESPAWN","LOADOUTS"]],["respawnOnPlayers",0]];
        this setVariable ["Loadout_Vars", [playerConfig]];                
    ```
    - initialLoadout is the name of the starting loadout the character will have upon spawning in.  Use the below list to pick a loadout (I will update it as new ones are added).
    - respawnLoadouts is an array of strings, include the class name of the loadouts you want that unit to have access to when respawning. Can be one or multiple separated by commas.  If you want all loadouts available then simply set it to the following: `["respawnLoadouts",["all"]]`.
    - if you wish to have players be respawn locations then keep `respawnOnPlayers` and set the number to one of the following.
        - 0 BLUFOR - WEST
        - 1 OPFOR - EAST
        - 2 INDEPENDANT
    - Leave the setVariable line alone.  
    **HINT: If you set the `InitialLoadout`, but omit the `respawnLoadouts`; the script will use the initial loadout as the respawn loadout.**

> NOTE: Make sure you update the contents of the `Respawn.cfg` to import the loadouts that you want to use.
>  - To use the standard roles, you only need to include `TFY_DLS_Arma3\loadouts\Roles_standard.c` under `CfgRoles`.
>  - Make sure you choose only one standard set of loadouts under `CfgRespawnInventory`; either `Loadouts_standard.c` or `Loadouts_standard_night.c`. They use the same class name so a conflict will occur if you include both of them.
>  - To make use of the Special forces roles just add `TFY_DLS_Arma3\loadouts\Roles_SF.c` to `CfgRoles` and `TFY_DLS_Arma3\loadouts\Loadouts_SF.c` to `CfgRespawnInventory`.
>  - As we add more loadouts they will be in separate loadout files, however they may use the same role file.  (i.e. Adding a russian loadout file for russian equipment but they use the standard roles.)

```c
    class CfgRoles
    {
        #include "TFY_DLS_Arma3\loadouts\Roles_standard.c"
        #include "TFY_DLS_Arma3\loadouts\Roles_SF.c"
    };


    class CfgRespawnInventory
    {
        #include "TFY_DLS_Arma3\loadouts\Loadouts_standard.c"
        #include "TFY_DLS_Arma3\loadouts\Loadouts_SF.c"
    };
```

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
