Scriptname RIR06_OperativeAliasScript extends ReferenceAlias

Keyword Property CrimeFactionNeon_Keyword Auto Const Mandatory
Keyword Property CrimeFactionFreestar_Keyword Auto Const Mandatory
Keyword Property CrimeFactionUC_Keyword Auto Const Mandatory
Keyword Property CrimeFactionParadiso_Keyword Auto Const Mandatory

Faction Property CrimeFactionNeon Auto Const Mandatory
Faction Property CrimeFactionFreestar Auto Const Mandatory
Faction Property CrimeFactionUC Auto Const Mandatory
Faction Property CrimeFactionParadiso Auto Const Mandatory

Event OnAliasInit()

    Actor Operative = Self.GetActorRef()
    Location MyLocation = Self.GetRef().GetCurrentLocation()

    If MyLocation.HasKeyword(CrimeFactionNeon_Keyword)
        Operative.AddToFaction(CrimeFactionNeon)
        Operative.SetCrimeFaction(CrimeFactionNeon)
    EndIf

    If MyLocation.HasKeyword(CrimeFactionFreestar_Keyword)
        Operative.AddToFaction(CrimeFactionFreestar)
        Operative.SetCrimeFaction(CrimeFactionFreestar)
    EndIf

    If MyLocation.HasKeyword(CrimeFactionUC_Keyword)
        Operative.AddToFaction(CrimeFactionUC)
        Operative.SetCrimeFaction(CrimeFactionUC)
    EndIf

    If MyLocation.HasKeyword(CrimeFactionParadiso_Keyword)
        Operative.AddToFaction(CrimeFactionParadiso)
        Operative.SetCrimeFaction(CrimeFactionParadiso)
    EndIf

EndEvent
