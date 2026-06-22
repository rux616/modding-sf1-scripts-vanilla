Scriptname RIR07_ExecutiveAliasScript extends ReferenceAlias

Keyword Property CrimeFactionNeon_Keyword Auto Const Mandatory
Keyword Property CrimeFactionFreestar_Keyword Auto Const Mandatory
Keyword Property CrimeFactionUC_Keyword Auto Const Mandatory
Keyword Property CrimeFactionParadiso_Keyword Auto Const Mandatory
Keyword Property CrimeFactionHopeTown_Keyword Auto Const Mandatory

Faction Property CrimeFactionNeon Auto Const Mandatory
Faction Property CrimeFactionFreestar Auto Const Mandatory
Faction Property CrimeFactionUC Auto Const Mandatory
Faction Property CrimeFactionParadiso Auto Const Mandatory

Outfit Property Outfit_Clothes_Neon_BusinessSuit_02 Auto Const Mandatory
Outfit Property Outfit_Clothes_Business_Any_NoRyujin Auto Const Mandatory

Event OnAliasInit()

    Actor Executive = Self.GetActorRef()
    Location MyLocation = Self.GetRef().GetCurrentLocation()

    If MyLocation.HasKeyword(CrimeFactionNeon_Keyword)
        Executive.SetOutfit(Outfit_Clothes_Neon_BusinessSuit_02)
        Executive.AddToFaction(CrimeFactionNeon)
        Executive.SetCrimeFaction(CrimeFactionNeon)
    EndIf

    If MyLocation.HasKeyword(CrimeFactionFreestar_Keyword) || MyLocation.HasKeyword(CrimeFactionHopeTown_Keyword) 
        Executive.SetOutfit(Outfit_Clothes_Business_Any_NoRyujin)
        Executive.AddToFaction(CrimeFactionFreestar)
        Executive.SetCrimeFaction(CrimeFactionFreestar)
    EndIf

    If MyLocation.HasKeyword(CrimeFactionUC_Keyword)
        Executive.SetOutfit(Outfit_Clothes_Business_Any_NoRyujin)
        Executive.AddToFaction(CrimeFactionUC)
        Executive.SetCrimeFaction(CrimeFactionUC)
    EndIf

    If MyLocation.HasKeyword(CrimeFactionParadiso_Keyword)
        Executive.SetOutfit(Outfit_Clothes_Business_Any_NoRyujin)
        Executive.AddToFaction(CrimeFactionParadiso)
        Executive.SetCrimeFaction(CrimeFactionParadiso)
    EndIf

EndEvent

