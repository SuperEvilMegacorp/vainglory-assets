Feature: Telemetry Requests


This issue will keep track of all feature requests that are made as issues and are blocked for some reason or being worked on in regards to **Telemetry**. When an issue is blocked or unblocked this issue will be updated. If you wish to get an update on any of these issues you can check back here or leave a comment below. Please note that as soon as a feature is blocked or unblocked, this issue will be updated.

- [ ] Ability String Naming Is Inconsistent                **Status: In Progress**
- [ ] HeroBan is Missing Player                                 **Status: Pending**
- [ ] Team Naming Is Inconsistent                             **Status: Pending**
- [ ] Pause Event In Telemetry                                   **Status: Pending**
- [ ] Add Match Start Timestamp                              **Status: Pending**
- [ ] Assists in Telemetry                                            **Status: Pending**
- [ ] Blitz Coin Earned                                                **Status: Pending**
- [ ] Stacking Stats                                                    **Status: Pending**
- [ ] DealDamage for Turrets to Heroes                   **Status: Blocked**
- [ ] Amount of Energy when UseAbility                  **Status: Blocked**
- [ ] In-Lane Minion Kills                                            **Status: Blocked**
- [ ] Identify Critical Attacks                                      **Status: Blocked**
- [ ] KillActor missing for AI Kills                               **Status: Blocked**
- [ ] Rename the TankMinion                                     **Status: Blocked**
- [ ] HP Information                                                    **Status: Blocked**
- [ ] Revealed/Hidden Status                                     **Status: Blocked**
- [ ] Kill Bounties Not Showing                                  **Status: Blocked**
- [ ] Ambient Gold                                                      **Status: Blocked**
- [ ] Telemetry Kill Streaks and Ace                          **Status: Blocked**
- [ ] Add current itemization information                 **Status: Blocked**
- [ ] Add Pings to Telemetry                                      **Status: Blocked**
- [ ] Type of Damage                                                  **Status: Blocked**
- [ ] Position Data for Good Positional Analysis       **Status: Blocked**
- [ ] Gold Balance Over Time                                     **Status: Blocked**
- [ ] Telemetry KillActor gold                                     **Status: Blocked**
- [ ] Add Shared XP Hero in XPEarned typeData     **Status: Blocked**
- [ ] Add player respawn events                                 **Status: Blocked**
- [ ] Healing spells                                                       **Status: Blocked**
- [ ] Include Activatables                                             **Status: Blocked**

# In Progress
Here will be a list of all feature requests that are currently being worked on for future updates.

## Ability String Naming is Inconsistent 
Seen on: #189 
Solution in: #197 #222 
Example:
&#x60;&#x60;&#x60;
{
    &quot;Ability__Grace__A&quot;: &quot;Grace A&quot;,
    &quot;Ability__Grace__AltAttack&quot;: &quot;Grace AA&quot;,
    &quot;Ability__Grace__B&quot;: &quot;Grace B&quot;,
    &quot;Ability__Grace__DefaultAttack&quot;: &quot;Grace AA&quot;,
    &quot;HERO_ABILITY_HERO042_A_NAME&quot;: &quot;Grace A&quot;,
    &quot;HERO_ABILITY_HERO042_B_NAME&quot;: &quot;Grace B&quot;,
    &quot;HERO_ABILITY_HERO042_C_NAME&quot;: &quot;Grace C&quot;,
    &quot;Ability__B_Bounce&quot;: &quot;Ozo B&quot;,
    &quot;AbilityB_Bounce&quot;: &quot;Ozo B&quot;,
    &quot;Ability__B_EndingAttack&quot;: &quot;Ozo B&quot;,
    &quot;AbilityCLeapOff&quot;: &quot;Idris C&quot;,
    &quot;Ability_Dash&quot;: &quot;Vox A&quot;,
    &quot;Ability_Grumpjaw_Eat&quot;: &quot;Grumpjaw C&quot;,
    &quot;Ability__Idris__A_Blink&quot;: &quot;Idris A&quot;,
    &quot;Ability__Idris__A_Dash&quot;: &quot;Idris A&quot;,

    &quot;*Item_Flaregun*&quot;: &quot;Flare Gun&quot;,

    &quot;Armor2&quot;: &quot;Coat of Plates&quot;,

    &quot;Candy - VO Taunt&quot;: &quot;Voice over Taunt&quot;
}
&#x60;&#x60;&#x60;
# Pending
Here will be a list of all feature requests that have not been designated a Status.

## Add Match Start Timestamp
Knowing when the match actually starts would be helpful in correlating event time in the telemetry with that shown on the match timer in-game (replays, recordings, broadcasts). Right now, they do not agree.
Seen on: #213
Example:
&#x60;&#x60;&#x60;
To Be Added
&#x60;&#x60;&#x60;

## Pause Event in Telemetry 
Extremely important as currently in game time is determined using the time stamp therefore when a game is paused the timing is not correct.
Seen on: #167
Example:
&#x60;&#x60;&#x60;
{ &quot;time&quot;: &quot;2017-05-03T01:26:27+0000&quot;, &quot;type&quot;: &quot;pause&quot;, &quot;payload&quot;: { &quot;onOff&quot;: &quot;paused&quot;, &quot;Actor&quot;: &quot;*Kestrel*&quot; } }

{ &quot;time&quot;: &quot;2017-05-03T01:26:27+0000&quot;, &quot;type&quot;: &quot;pause&quot;, &quot;payload&quot;: { &quot;onOff&quot;: &quot;continue&quot;, &quot;Actor&quot;: &quot;*Kestrel*&quot; } }
&#x60;&#x60;&#x60;

## Blitz Coins Earned
Seen on #214 
It would be a great asset to be able to use the API to see how many Blitz Coins a player has at the end of each Blitz match and how they earned it in the Telemetry. Additionally, a team&#x27;s Blitz coins should be a roster stats attribute.
Example:
&#x60;&#x60;&#x60;
{ &quot;time&quot;: &quot;2017-05-03T01:26:27+0000&quot;, &quot;type&quot;: &quot;BlitzCoinEarned&quot;, &quot;payload&quot;: { &quot;Team&quot;: &quot;Left&quot;, &quot;Actor&quot;: &quot;*Kestrel*&quot;, &quot;Balance&quot;: 2 } }
&#x60;&#x60;&#x60;

## HeroBan is Missing Player 
Seen on: #182
Example:
&#x60;&#x60;&#x60;
  {
    &quot;time&quot;: &quot;2017-06-08T07:25:09+0000&quot;,
    &quot;type&quot;: &quot;HeroSelect&quot;,
    &quot;payload&quot;: {
      &quot;Hero&quot;: &quot;*Lance*&quot;,
      &quot;Team&quot;: &quot;1&quot;,
      &quot;Player&quot;: &quot;4c75f332-6b5d-11e4-aef9-06641bcbf424&quot;,
      &quot;Handle&quot;: &quot;lensjo&quot;
    }
  },
&#x60;&#x60;&#x60;

## Team Naming is Inconsistent 
Seen on: #181
Example:
&#x60;&#x60;&#x60;
In HeroBan and HeroSelect, Team is either &quot;1&quot; or &quot;2&quot; (strings, not integers). LevelUp has Team as either &quot;Right&quot; or &quot;Left&quot;. Also &quot;Hero&quot; instead of &quot;Actor&quot;
&#x60;&#x60;&#x60;

## Item/Ability Stacks
Seen on #208 
Certain Items and abilities stack that apply stacks on damage or lose without any damage.
Example: 
&#x60;&#x60;&#x60;
{ &quot;time&quot;: &quot;2017-05-03T01:26:27+0000&quot;, &quot;type&quot;: &quot;itemStack&quot;, &quot;payload&quot;: { &quot;Team&quot;: &quot;Left&quot;, &quot;Actor&quot;: &quot;*Skye*&quot;, &quot;Item&quot;: &quot;Broken Myth&quot;, &quot;currentStacks&quot; : &quot;7&quot; } }

{ &quot;time&quot;: &quot;2017-05-03T01:26:27+0000&quot;, &quot;type&quot;: &quot;abilityStack&quot;, &quot;payload&quot;: { &quot;Team&quot;: &quot;Left&quot;, &quot;Actor&quot;: &quot;*Saw*&quot;, &quot;Ability&quot;: &quot;Saw_Perk&quot;, &quot;currentStacks&quot; : &quot;12&quot; } }
&#x60;&#x60;&#x60;

## Assists in Telemetry 
Seen On: #207
Example:
&#x60;&#x60;&#x60;
 {
    &quot;time&quot;: &quot;2017-04-22T15:39:56+0000&quot;,
    &quot;type&quot;: &quot;KillActor&quot;,
    &quot;payload&quot;: {
      &quot;Team&quot;: &quot;Left&quot;,
      &quot;Actor&quot;: &quot;*Taka*&quot;,
       &quot;Assist&quot;: &quot;*Lyra*&quot;,
      &quot;Killed&quot;: &quot;*Lyra*&quot;,
      &quot;KilledTeam&quot;: &quot;Right&quot;
      &quot;Gold&quot;: &quot;0&quot;,
      &quot;IsHero&quot;: 1,
      &quot;TargetIsHero&quot;: 1,
      &quot;Position&quot;: [
        -74.13,
        0.4,
        23.16
      ]
    }
  },
&#x60;&#x60;&#x60;

# Blocked
Here will be a list of all feature requests that are currently blocked.

## Deal Damage For AI(Turrets/Kraken/Minders/Minions/Jungle Monsters
Seen on #75 
Damage done by AI is extremely crucial for analysis. How much damage can a minion take from a turret at X time in a game etc...
Example: 
&#x60;&#x60;&#x60;
To Be Added
&#x60;&#x60;&#x60;

## Amount of Energy when UseAbility 
Seen on: #70
Example:
&#x60;&#x60;&#x60;
{ &quot;time&quot;: &quot;2017-02-18T12:55:46+0000&quot;, &quot;type&quot;: &quot;UseAbility&quot;, &quot;payload&quot;: { &quot;Team&quot;: &quot;Left&quot;, &quot;Actor&quot;: &quot;*Phinn*&quot;, &quot;Ability&quot;: &quot;HERO_ABILITY_PHINN_A_NAME&quot;, &quot;Position&quot;: [ -43.50, 0.00, 30.50 ] } }
&#x60;&#x60;&#x60;

## Identify Critical Attacks
Seen on: #63
Example:
&#x60;&#x60;&#x60;
{ &quot;time&quot;: &quot;2017-02-18T12:55:24+0000&quot;, &quot;type&quot;: &quot;DealDamage&quot;, &quot;payload&quot;: { &quot;Team&quot;: &quot;Left&quot;, &quot;Actor&quot;: &quot;*SAW*&quot;, &quot;Target&quot;: &quot;*Glaive*&quot;, &quot;Source&quot;: &quot;Unknown&quot;, &quot;criticalHit&quot;: &quot;1&quot;, Damage&quot;: 53, &quot;Delt&quot;:  41, &quot;IsHero&quot;: 1, &quot;TargetIsHero&quot;: 1 } }
&#x60;&#x60;&#x60;

## KillActor Missing For AI Kills
Can we please add in the ability to show when a lane minion dies from a lane minion or a turret. This would allow us to determine the efficiency of teams farming and understand how much gold is being lost and what the causes are.
Seen on: #60
Example:
&#x60;&#x60;&#x60;
To Be Added
&#x60;&#x60;&#x60;

### Rename the TankMinion
I am hoping to have the name of the tankMinions be changed to say TankMinion1 and TankMinion2. Knowing the precise minion which was killed allows us to know and determine how efficient a player farms. It can allow us to analyze much more in depth, about whether a player is focusing damage correctly in order to farm efficiently and is getting those last hits efficiently.
Seen on: #53
Example:
&#x60;&#x60;&#x60;
To Be Added
&#x60;&#x60;&#x60;

## HP Information
The player takes damage it shows how much damage done, but doesn&#x27;t show the heroes max hp or his current hp, his health regen, potion regen, fountain regen? Furthermore, maybe Lyra healing, Adagio healing.
Seen o: #48
Example:
&#x60;&#x60;&#x60;
To Be Added
&#x60;&#x60;&#x60;

## Revealed/Hidden Status
Can we have abilities or flares indicate when a hero is revealed and its position when it is revealed. For example, we can have a scout trap and determine the usefulness of a scout trap by determing which position of a trap provided the most amount of help. For example here, Gwen A causes heroes to be revealed for a short duration can we please have that shown and show where the enemy is while flared or revealed.
Issue: #46
Example:
&#x60;&#x60;&#x60;
{
    &quot;time&quot;: &quot;2017-01-25T00:56:43+0000&quot;,
    &quot;type&quot;: &quot;reveal&quot;,
    &quot;payload&quot;: {
        &quot;Team&quot;: &quot;Left&quot;,
        &quot;Actor&quot;: &quot;*Gwen*&quot;,
        &quot;Target&quot;: &quot;*Taka*&quot;,
        &quot;Source&quot;: &quot;Ability__Gwen__A&quot;,
        &quot;Position&quot;: &quot;xxx&quot;
    }
}
{
    &quot;time&quot;: &quot;2017-01-25T00:56:43+0000&quot;,
    &quot;type&quot;: &quot;reveal&quot;,
    &quot;payload&quot;: {
        &quot;Team&quot;: &quot;Left&quot;,
        &quot;Actor&quot;: &quot;*Lyra*&quot;,
        &quot;Target&quot;: &quot;*Taka*&quot;,
        &quot;Source&quot;: &quot;Flare&quot;,
        &quot;Position&quot;: &quot;xxx&quot;
    }
}
&#x60;&#x60;&#x60;

## Kill Bounties Not Showing  
Seen on: #45
Example:
&#x60;&#x60;&#x60;
{
    &quot;time&quot;: &quot;2017-01-25T00:59:05+0000&quot;,
    &quot;type&quot;: &quot;KillActor&quot;,
    &quot;payload&quot;: {
        &quot;Team&quot;: &quot;Right&quot;,
        &quot;Actor&quot;: &quot;*Rona*&quot;,
        &quot;Killed&quot;: &quot;*Reim*&quot;,
        &quot;KilledTeam&quot;: &quot;Left&quot;,
        &quot;Gold&quot;: &quot;200&quot;,
        &quot;killBounty&quot;: &quot;100&quot;
        &quot;IsHero&quot;: 1,
        &quot;TargetIsHero&quot;: 1,
        &quot;Position&quot;: [-9.80, 0.01, 37.12]
    }
} 
&#x60;&#x60;&#x60;

## Ambient Gold
Seen on: #42
Example:
&#x60;&#x60;&#x60;
 &quot;time&quot;: &quot;2017-01-25T00:56:38+0000&quot;,
 &quot;type&quot;: &quot;KillActor&quot;,
 &quot;payload&quot;: {
     &quot;Team&quot;: &quot;Right&quot;,
     &quot;Actor&quot;: &quot;*Hero016*&quot;,
     &quot;Killed&quot;: &quot;*Neutral_JungleMinion_DefaultSmall*&quot;,
     &quot;KilledTeam&quot;: &quot;Neutral&quot;,
     &quot;Gold&quot;: &quot;22&quot;,
      &quot;ambientGoldTarget&quot;: &quot;Ardan&quot;
      &quot;ambientGoldAmount:&quot; &quot;15&quot;
     &quot;IsHero&quot;: 1,
     &quot;TargetIsHero&quot;: 0,
     &quot;Position&quot;: [9.20, 0.01, 32.02]
 }
&#x60;&#x60;&#x60;

## Add Pings to Telemetry  
Seen on: #143
Example:
&#x60;&#x60;&#x60;
To Be Added
&#x60;&#x60;&#x60;

## Type of Damage  
If its possible, divide the damage by crystal, weapon or true, burn etc
Seen on: #123
Example:
&#x60;&#x60;&#x60;
{ &quot;time&quot;: &quot;2017-02-18T12:55:24+0000&quot;, &quot;type&quot;: &quot;DealDamage&quot;, &quot;payload&quot;: { &quot;Team&quot;: &quot;Left&quot;, &quot;Actor&quot;: &quot;*SAW*&quot;, &quot;Target&quot;: &quot;*Glaive*&quot;, &quot;Source&quot;: &quot;Unknown&quot;, &quot;criticalHit&quot;: &quot;1&quot;, &quot;type&quot;:&quot;weapon&quot;, Damage&quot;: 53, &quot;Delt&quot;:  41, &quot;IsHero&quot;: 1, &quot;TargetIsHero&quot;: 1 } }
&#x60;&#x60;&#x60;

## Not Enough Position Data for Good Positional Analysis  
In particular, positions are only reported when some event other than motion transpires (purchases, damage, item uses, leveling up, etc.). So for example, a player can run across the map and then hit a monster, and we have no data about where they are the entire time they&#x27;re running until they hit the monster on the opposite end of the map. Thus there are long patches of missing motion data.
Seen on: #118
Example:
&#x60;&#x60;&#x60;
To Be Added
&#x60;&#x60;&#x60;

## Gold Balance Over Time  
There is no data about gold in the participant&#x27;s type. I would like to get some stats about gold@time but the only time telemetry is giving lifetimeGold is when someone levels up. I cant pull total gold from every minute of the game since players stop leveling up around ~13min. And I cant calculate from reward gold because then I would be skipping ambient gold and cs gold.
Seen on: #117
Example:
&#x60;&#x60;&#x60;
gold: 5, balance: 25, ambient: 12
&#x60;&#x60;&#x60;

## Telemetry KillActor Gold  
KillActor in TargetIsHero:1 is returning Gold: 0
Seen on: #144
Example:
&#x60;&#x60;&#x60;
{ &quot;time&quot;: &quot;2017-04-10T05:57:31+0000&quot;, &quot;type&quot;: &quot;KillActor&quot;, &quot;payload&quot;: { &quot;Team&quot;: &quot;Right&quot;, &quot;Actor&quot;: &quot;Ozo&quot;, &quot;Killed&quot;: &quot;Glaive&quot;, &quot;KilledTeam&quot;: &quot;Left&quot;, &quot;Gold&quot;: &quot;0&quot;, &quot;IsHero&quot;: 1, &quot;TargetIsHero&quot;: 1, &quot;Position&quot;: [ -6.35, 0.01, 26.80 ] } },
&#x60;&#x60;&#x60;

##  Add Shared XP hero in XPEarned type data   
For the XPEarned type data, could you also add hero which shares the XP earned when killing a neutral minion?
Seen on: #127
Example:
&#x60;&#x60;&#x60;
To Be Added
&#x60;&#x60;&#x60;

## Add Player Respawn Events
As is, it&#x27;s not possible to tell when players are alive or dead. While there are death events, there are not respawn events. We can narrow it down from other events, but not get an exact respawn time, as far as I can tell. (But I&#x27;m glad to be proven wrong on this, especially since it&#x27;s 2am here...)
Seen on: #125
Example:
&#x60;&#x60;&#x60;
To Be Added
&#x60;&#x60;&#x60;

## Healing Spells   
Include healing values for spells and fountain and maybe perks? We should be able to calculate how much heal was done
Seen on: #122
Example:
&#x60;&#x60;&#x60;
To Be Added
&#x60;&#x60;&#x60;

## Include Activatables   
Include when an activable was used e.g. Trap placed, Flare threw from here to there, Fountain used, Crucible used...
Issue: #121
Example:
&#x60;&#x60;&#x60;
To Be Added
&#x60;&#x60;&#x60;

# List of Features That Will Not Be Possible
Below is a list of requests that were made but were not able to be done for some reason.
 
## Add current itemization information
Seen on: #184
Reason: I don&#x27;t know that this makes a lot of sense. I understand the accounting is a pain, but bloating the telemetry with info that&#x27;s already included is probably not a great solution. 
Alternative Solution: Have the item information in the itemDB, then you will be able to map which item is consumable or not and price.
