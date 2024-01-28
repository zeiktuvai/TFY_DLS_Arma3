# Changelog

## [Unreleased]

## [1.4] - 2024-01-28
- Updated DLS to allow overriding automatic selection by putting variable in unit init field.
- This allows for using loadouts with non-automatic unit classes.

## [1.3]
- Updated DLS to get the config automatically based on unit class for certain nato units.
- Moved config into separate file to allow for git pull to work better.

## [1.2] - 2024-01-14
- Updated code to have configuration in DLS.sqf instead of pasting code in each player object.
- Updated DLS.sqf to infer loadouts based on class of NATO unit placed.
- Added TFAR radios to all loadouts.

## [1.1] - 2024-01-11

### Added 
- Respawn loadout is now added based on `initialLoadout` when the `respawnLoadout` property is omitted.
- Null handling for player objects that do not have properties set.

### Changed
- Updated Apply Custom Loadout code to use new BIS mehod to apply loadouts using the RespawnInventory format.
- Changed the player object variable type from an array of multiple variables to a single hashmap of key/value pairs.

## [1.0] - Initial Release