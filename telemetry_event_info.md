## **Event Data Dictionary**

Telemetry data is classified into several events of interest. Following is a list of every event type with an example.

**PlayerFirstSpawn:**

At the start of the game when players spawn.

    {
    	"time": "2017-03-17T00:38:32+0000",
    	"type": "PlayerFirstSpawn",
    	"payload": {
    		"Team": "Right",
    		"Actor": "*Alpha*"
    	}
    }
    
**Level Up:**

When a player gains a level in the game. In game types Brawl, you will find 9 events at the exact same time.

    {
    	"time": "2017-03-17T00:38:32+0000",
    	"type": "LevelUp",
    	"payload": {
    		"Team": "Right",
    		"Actor": "*Alpha*",
    		"Level": 1,
    		"LifetimeGold": 0
    	}
    }

**BuyItem:**

When a player buys an item.

    {
    	"time": "2017-03-17T00:38:45+0000",
    	"type": "BuyItem",
    	"payload": {
    		"Team": "Left",
    		"Actor": "*Vox*",
    		"Item": "Breaking Point",
    		"Cost": 2600
    	}
    }

**SellItem:**

When a player sells an item.

    {
    	"time": "2017-03-31T02:49:37+0000",
    	"type": "SellItem",
    	"payload": {
    		"Team": "Left",
    		"Actor": "*Lyra*",
    		"Item": "Flare",
    		"Cost": 15
    	}
    }

**LearnAbility:**

When a player puts a point into one of the abilities. Please note there can be a time difference between when a player gains a level and learns an ability

    {
    	"time": "2017-03-17T00:38:52+0000", 
    	"type": "LearnAbility",
    	"payload": {
    		"Team": "Right",
    		"Actor": "*Sayoc*",
    		"Ability": "HERO_ABILITY_SAYOC_C",
    	}
    }

**UseAbility:**

This event is recorded when a player uses an ability and it will hold information about the hero who used it together with the co-ordinates for the map. 

    {
    	"time": "2017-03-17T00:39:08+0000",
    	"type": "UseAbility",
    	"payload": {
    		"Team": "Right",
    		"Actor": "*Kestrel*",
    		"Ability": "HERO_ABILITY_KESTREL_A_NAME",
    		"Position": [ 39.39, 0.01, 27.26 ]
    	}
    }

**UseItemAbility:**

This event is recorded when a player uses an activatable item or a charm/taunt.

    {
    	"time": "2017-03-31T03:10:17+0000",
    	"type": "UseItemAbility",
    	"payload": {
    		"Team": "Left",
    		"Actor": "*Lyra*",
    		"Ability": "Travel Boots",
    		"Position": [ -17.51, 0.01, 41.63 ],
    		"TargetActor": "None",
    		"TargetPosition": [ -17.51, 0.01, 41.63 ]
    	}
    }

**EarnXP:**

This event is recorded when a player gains XP from any source. it could be killing a minion, miner or a hero. 

    {
    	"time": "2017-03-17T00:39:09+0000",
    	"type": "EarnXP",
    	"payload": {
    		"Team": "Left",
    		"Actor": "*Koshka*",
    		"Source": "*JungleMinion_TreeEnt*",
    		"Amount": 67, "Shared With": 1
    	}
    }

**DealDamage:**

This event is recorded when any actor (player, turret, minion, etc.) deals damage to any other.

    {
    	"time": "2017-03-31T02:47:34+0000",
    	"type": "DealDamage",
    	"payload": {
    		"Team": "Left",
    		"Actor": "*Skaarf*",
    		"Target": "*Vox*",
    		"Source": "Unknown",
    		"Damage": 105,
    		"Delt": 80,
    		"IsHero": 1,
    		"TargetIsHero": 1
    	}
    }

**KillActor:**

This event is recorded when a player kills anything in game. it could be a a minion, miner or a hero. You will generally see EarnXP and KillActor events come at the same time.

    {
    	"time": "2017-03-17T00:39:09+0000",
    	"type": "KillActor",
    	"payload": {
    		"Team": "Left",
    		"Actor": "*Koshka*",
    		"Killed": "*JungleMinion_TreeEnt*",
    		"KilledTeam": "Neutral",
    		"Gold": "80",
    		"IsHero": 1,
    		"TargetIsHero": 0,
    		"Position": [
    			-21.95,
    			0,
    			24
    		]
    	}
    }

**NPCkillNPC:**

When one non-player actor kills another, such as the Kraken or a minion killing a turret.

    {
    	"time": "2017-03-31T03:07:21+0000",
    	"type": "NPCkillNPC",
    	"payload": {
    		"Team": "Left",
    		"Actor": "*Kraken_Captured*",
    		"Killed": "*Turret*",
    		"KilledTeam": "Right",
    		"Gold": "300",
    		"IsHero": 0,
    		"TargetIsHero": 0,
    		"Position": [ 54, 0, 2.92 ]
    	}
    }

**GoldFromTowerKill:**

When a player earns gold from the destruction of a turret belonging to the enemy team. 

    {
    	"time": "2017-03-31T02:57:02+0000",
    	"type": "GoldFromTowerKill",
    	"payload": {
    		"Team": "Left",
    		"Actor": "*Idris*",
    		"Amount": 300
    	}
    }

**GoldFromGoldMine:**

When a player earns gold from his or her team capturing the gold miner.

    {
    	"time": "2017-03-31T03:00:43+0000",
    	"type": "GoldFromGoldMine",
    	"payload": {
    		"Team": "Left",
    		"Actor": "*Idris*",
    		"Amount": 300
    	}
    }

**GoldFromKrakenKill:**

When a player earns gold from his or her team killing a Kraken released by the enemy team. 

    {
    	"time": "2017-03-31T03:07:43+0000",
    	"type": "GoldFromKrakenKill",
    	"payload": {
    		"Team": "Right",
    		"Actor": "*Kestrel*",
    		"Amount": 500
    	}
    }
