# Gamelocker / Vainglory Changelog

## [GAMELOCKER API] (UPCOMING)

Data retention will be lowered from 12 to 4 months.
NOTE: This will happen continuously.

Players that have not been updated since May 1 will be removed.
NOTE: This is a one time only purge to clear out old players.

## [VG DATA] Version (UPCOMING)

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

A bug was introduced whereby these fields showed the pre-match valu, rather
than the post match value.  

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
