Scriptname CraftingScript extends Quest  
{Script attached to Crafting Quest. Has properties and debug quest stages for Crafting and Item Modification}

Actor Property PlayerRef auto

;Perks that unlock Properties on Component Types:
Perk Property cpl_CompLvlChemical2  Auto  
Perk Property cpl_CompLvlChemical3  Auto  
Perk Property cpl_CompLvlMetallic2  Auto  
Perk Property cpl_CompLvlMetallic3  Auto  
Perk Property cpl_CompLvlOrganic2  Auto  
Perk Property cpl_CompLvlOrganic3  Auto  
Perk Property cpl_CompLvlTechnical2  Auto  
Perk Property cpl_CompLvlTechnical3  Auto  

;Array's holding perks
Perk[] Property Chemical auto
Perk[] Property Metallic auto
Perk[] Property Organic auto
Perk[] Property Technical auto


Function ResetComponentLevels()
;THIS IS PRETTY MUCH A DEBUG FUNCTION - I DON'T EXPECT IT TO BE USED IN GAME
	Debug.TraceSelf(self, "ResetComponentLevels", "")
	PlayerRef.RemovePerk(cpl_CompLvlChemical2)
	PlayerRef.RemovePerk(cpl_CompLvlChemical3)
	PlayerRef.RemovePerk(cpl_CompLvlMetallic2)
	PlayerRef.RemovePerk(cpl_CompLvlMetallic3)
	PlayerRef.RemovePerk(cpl_CompLvlOrganic2)
	PlayerRef.RemovePerk(cpl_CompLvlOrganic3)
	PlayerRef.RemovePerk(cpl_CompLvlTechnical2)
	PlayerRef.RemovePerk(cpl_CompLvlTechnical3)
EndFunction

Function UnlockComponentLevel(Perk[] akComponent, int NewLevel)
	Debug.TraceSelf(self, "UnlockComponentLevel", "Perk[] = " + akComponent + ", NewLevel = " + NewLevel)
	
	NewLevel -= 2 ;because array is zero based, and the first level doesn't have an associated Perk, all player's begin with all components' first properties unlocked

	Perk PerkToAdd = akComponent[NewLevel]

	debug.TraceSelf(self, "UnlockComponentLevel", "Adding perk:" + PerkToAdd)
	PlayerRef.AddPerk(PerkToAdd)

EndFunction

