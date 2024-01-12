# How to manually implement selectable loadouts on respawn

> It is suggested that you use the Dynamic Loadout System referenced [Here](). But if you choose to do it manually then use the following steps.

1. Clone this repo into your mission folder using `git clone https://github.com/zeiktuvai/TFY_DLS_Arma3.git` (You will be able to update it easily if new loadouts are added by moving into the `TFY_DLS_Arma3` folder and running `git pull`).
2. Make sure your `description.ext` contains the following content; adding or commenting out loadouts if you don't need them. Remember, only use one version of standard.

```c
respawnTemplates[] = { "Counter","MenuPosition", "MenuInventory", "Spectator" };
respawnOnStart = -1;
respawn = 3;
respawnDialog = 0;
respawnDelay = 15;

// These are the roles that loadouts are organized into
// You can include (or not) each one if you choose; just make sure they don't conflict.
class CfgRoles
{
    #include "loadouts\Roles_standard.c"
    #include "loadouts\Roles_SF.c"
};

// These are the loadouts themselves.
class CfgRespawnInventory
{
    #include "loadouts\Loadouts_standard.c"
    #include "loadouts\Loadouts_SF.c"
};
```
3. Modify the **Roles** and **Loadouts**.
    - You can add all or some of the included files (To add one just include the path to the file under `CfgRoles` and `CfgRespawn..`):
        - Standard: The standard multicam/tropic loadouts.
        - Standard-Night: Same as standard but with black uniforms/gear.
        - SF: Special Forces loadouts (Only Divers as of right now.)        
4. On each player you will need to add the following into the init field:
    ```c 
    //Faction name (ie east, west, etc), Name of loadout class from loadout file
    [this, LOADOUT NAME] call BIS_fnc_addRespawnInventory;
    ```
    ```c 
    // example
    [this, "TFY_Autorifleman"] call BIS_fnc_addRespawnInventory;
    ```
    - If you want that player to have access to more than one, just add a new line with the same code but change the loadout class name to the one you want.