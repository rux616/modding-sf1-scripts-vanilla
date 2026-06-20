Scriptname SFBGS00D:SFFL_R02_TargetFactionScript extends ReferenceAlias

Keyword Property CrimeFactionNeon_Keyword Auto Const Mandatory
Keyword Property CrimeFactionAkilaCity_Keyword Auto Const Mandatory
Keyword Property CrimeFactionFreestar_Keyword Auto Const Mandatory
Keyword Property CrimeFactionUC_Keyword Auto Const Mandatory
Keyword Property CrimeFactionParadiso_Keyword Auto Const Mandatory
Keyword Property CrimeFactionHopeTown_Keyword Auto Const Mandatory

Faction Property CrimeFactionNeon Auto Const Mandatory
Faction Property CrimeFactionFreestar Auto Const Mandatory
Faction Property CrimeFactionUC Auto Const Mandatory
Faction Property CrimeFactionParadiso Auto Const Mandatory

LocationAlias Property ChosenLocation Auto Const Mandatory


;set target npc crime faction when they load
Event OnLoad()

    Actor TargetActor = Self.GetActorRef()
    Location MyLocation = ChosenLocation.GetLocation()

    If MyLocation.HasKeyword(CrimeFactionNeon_Keyword)
        TargetActor.AddToFaction(CrimeFactionNeon)
        TargetActor.SetCrimeFaction(CrimeFactionNeon)
    EndIf

    If MyLocation.HasKeyword(CrimeFactionAkilaCity_Keyword)
        TargetActor.AddToFaction(CrimeFactionFreestar)
        TargetActor.SetCrimeFaction(CrimeFactionFreestar)
    EndIf

    If MyLocation.HasKeyword(CrimeFactionFreestar_Keyword)
        TargetActor.AddToFaction(CrimeFactionFreestar)
        TargetActor.SetCrimeFaction(CrimeFactionFreestar)
     EndIf

    If MyLocation.HasKeyword(CrimeFactionUC_Keyword)
        TargetActor.AddToFaction(CrimeFactionUC)
        TargetActor.SetCrimeFaction(CrimeFactionUC)
     EndIf

    If MyLocation.HasKeyword(CrimeFactionParadiso_Keyword)
        TargetActor.AddToFaction(CrimeFactionParadiso)
        TargetActor.SetCrimeFaction(CrimeFactionParadiso)
    EndIf

    If MyLocation.HasKeyword(CrimeFactionHopeTown_Keyword)
        TargetActor.AddToFaction(CrimeFactionFreestar)
        TargetActor.SetCrimeFaction(CrimeFactionFreestar)
    EndIf

EndEvent


