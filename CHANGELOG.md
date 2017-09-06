# Gamelocker / Vainglory Changelog

## [GAMELOCKER API] (UPCOMING)

Data retention will be lowered from 12 to 4 months.
NOTE: This will happen continuously.

Players that have not been updated since May 1 will be removed.
NOTE: This is a one time only purge to clear out old players.

## [VG DATA] Version 2.8

Skins:
* `Glaive_Skin_Lion` (Glaive)
* `Ringo_Skin_Cowboy` (Ringo)
* `Idris_Skin_Egypt` (Idris)

Items:
* `*Item_HealingFlask*` (Healing Flask)
* `*Item_Spellsword*` (Spellsword)


## [GAMELOCKER API] Version 6.8.6
- PBE data is now available to approved community developers.
- Future times are now supported

## [VG DATA] Version 2.7

The next version of VG will include fixes for the following fields:
  * xp
  * levelMinXP
  * levelMaxXP
  * level
  * karmaLevel
  * wins
  * completed
  * completed_casual
  * completed_ranked
  * completed_blitz
  * completed_aral

A bug was introduced whereby these fields showed the pre-match value, rather
than the post match value.  

The following new mappings are required to support the new hero, Reza!

Abilities:
  * Spell A - HERO_ABILITY_REZA_A_NAME
  * Spell B - HERO_ABILITY_REZA_B_NAME
  * Spell C - HERO_ABILITY_REZA_C_NAME

Sources of Damage:
  * Ability__Reza__DefaultAttack
  * Ability__Reza__AltAttack
  * Buff_Reza_Perk_VolatileSparkControl
  * Buff_Reza_B_EmpoweredAttack
  * Ability__Reza__C
  * Ability__Reza__C_NetherformAttack
  * Ability__Reza__CritAttack

Skins:
  * Grace_Skin_Valkyrie
  * Rona_Skin_Red
  * Celeste_Skin_Butterfly
  * Fortress_Skin_Warg
  * Reza_DefaultSkin

## [GAMELOCKER API] Version 4.2.3
- Hero name fixes:

```
Sayoc  *Taka*  
Hero009 *Krul*  
Hero010 *Skaarf*
Hero016 *Rona*
```

- We are adding an additional field to particpants called "gold". (Gold for the match).
- In the player object we are fixing "shardId" to have the proper shard instead of being blank.

## [GAMELOCKER API] Version 4.2.2
- TELEMETRY DATA IS LIVE!!
- New match data reaper: quicker match data availability!
- Player filters: you can now filter by up to six players
- Sample data performance fixes
- Optimizations and bug fixes
- Stay up to date with API Documentation [API Docs](https://developer.vainglorygame.com/docs?).
