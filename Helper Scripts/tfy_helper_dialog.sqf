/*
	Author: zeik_tuvai

	Description:
		Sets up an ace interaction option to start a dialog conversation with the given unit.  Be sure to configure the dialog in description.ext
		and create a bikb file for the dialog.

	Parameter(s):
        object - Unit object (player or unit).
		string - Task ID of task to complete when conversation begins
		string - Name of conversation class (referencing bikb file) in description.ext
		string - Name of parent class (class containing above class) in description.ext
        
	Examples:
		Assuming you place this helper script into a folder called scripts in your root mission directory.
		null = [this, "taskTalk", "TNAOff", "OperationRadioSilenceM2"] execVM "scripts\tfy_helper_dialog.sqf";

	Script version 1.0
*/

params ["_unit", "_taskID", "_convName", "_containerName"];

private _startConvo = ["start conversation",format ["Start Conversation with %1", name _unit],"",{ 
	[_taskID,"SUCCEEDED"] call BIS_fnc_taskSetState;
	[_convName, _containerName] call bis_fnc_kbtell;
}, {!(_taskID call BIS_fnc_taskCompleted)}] call ace_interact_menu_fnc_createAction; 

[_unit,0,["ACE_MainActions"],_startConvo] call ace_interact_menu_fnc_addActionToObject;