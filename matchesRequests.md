This issue will keep track of all feature requests that are made as issues and are blocked for some reason or being worked on. When an issue is blocked or unblocked this issue will be updated. If you wish to get an update on any of these issues you can check back here or leave a comment below. Please note that as soon as a feature is blocked or unblocked, this issue will be updated.

- [ ] AFK Forgiveness                                     **Status: Pending**
- [ ] Honors and Ratings                                  **Status: Pending**
- [ ] Talents                                             **Status: Pending**
- [ ] Ban/Swap Data On Roster                             **Status: Pending**
- [ ] Teams                                               **Status: Blocked**
- [ ] Participants Selected Role.                         **Status: Blocked**
- [ ] Guilds                                              **Status: Blocked**
- [ ] Advance Notice of Changes (PBE)                     **Status: In Progress**
- [ ] China Data                                          **Status: In Progress**
- [ ] Blitz Elo                                           **Status: In Progress**


# In Progress
Here will be a list of all feature requests that are currently being worked on for future updates.

## China Data
Seen on #222 
Folks - We're prepping to begin displaying data from China. As you can imagine, this will be a huge increase in the data volume and requires some changes in order to provide this to you.

## Blitz Elo
Seen on #220 
Since the last update, the game shows a Blitz ranking number (found on the screen where you start a Blitz match below the button) mostly between 0 and 2000.

## Advance Notice of Changes (PBE Access)
Seen on #216 
However, we will be exposing PBE data to approved developers shortly. You should be able to find that info from the PBE data, and send a pull request back to this repository to patch the resource mappings here:
https://github.com/madglory/gamelocker-vainglory/tree/master/resources

# Pending
Here will be a list of all feature requests that have not been designated a Status.

## AFK Forgiveness
Seen on #195 
The game has a mechanism called "AFK forgiveness" which allows a player to keep their current Elo when the team lost 2v3. AFK forgiveness is not given to a team when the player joins the game quickly after an announcement "an ally has deserted". Right now, the API returns the first AFK time and whether the player has been a AFK at one point, but it is not possible to see whether forgiveness has been given.

## Honors And Ratings
Seen on #193 
Add the 5-star rating to the participant and thumbs up/down received and given to participant. Add a finer karmaLevel to participant so that it is possible to look up how close someone is to "Great Karma" or "Bad Karma".

## Talents
Seen on #179 
Vainglory's last update introduced Talents. In Brawl modes (Battle Royale and Blitz), Talents are equipped like skins and alter certain abilities' behavior or stats. Every hero can have one of 3 different Talents (currently) at different levels which affect the strength (= the buffs) of the Talent. Right now, the API does not return data about equipped Talents.

## Ban/Swap Information On Roster
Seen on #178 
Currently, ban/swap information is only available in Telemetry data. It is tied to a team (= roster) there and never changes during the match. It should be on roster.attributes instead.

# Blocked

## Teams
Seen on #85 
A teams endpoint, including information like membership, Team Name, Team Tag, Team Skill Tier, Team Leader, Wins, Team Trophies (from past seasons), Team Creation Date, Member Join Date, Member Join Order

## Participants Selected Role
Seen on #35 
Add an item that tells me whether/what role and build path a participant has locked in before the match - I just realized that I need that badly.

## Guilds
Seen on #8 
Membership(Member Status), Fame Earnings, Guild Level, Guild Description(Motto, Minimum Required Rank, etc)

# List of Features That Will Not Be Possible
Below is a list of requests that were made but were not able to be done for some reason.