Scriptname RIR03_GuardAliasScript extends ReferenceAlias

Outfit Property Outfit_Clothes_Neon_Security_NoHelmet Auto Const Mandatory
Outfit Property Outfit_Clothes_Akila_Security_NoHeadwear Auto Const Mandatory
Outfit Property Outfit_Clothes_NewAtlantis_Security_NoHelmet Auto Const Mandatory
Outfit Property Outfit_Clothes_Security_Guard_01_with_Helmet Auto Const Mandatory
Outfit Property Outfit_Freestar_Militia_NoHat Auto Const Mandatory

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
Faction Property GuardFaction Auto Const Mandatory

LocationAlias Property ChosenLocation Auto Const Mandatory

Message Property RIR03_SecurityGuardName_Neon Auto Const Mandatory
Message Property RIR03_SecurityGuardName_AkilaCity Auto Const Mandatory
Message Property RIR03_SecurityGuardName_Freestar Auto Const Mandatory
Message Property RIR03_SecurityGuardName_UC Auto Const Mandatory
Message Property RIR03_SecurityGuardName_Paradiso Auto Const Mandatory
Message Property RIR03_SecurityGuardName_HopeTown Auto Const Mandatory

Message Property RIR03_KeycardName_Neon Auto Const Mandatory
Message Property RIR03_KeycardName_AkilaCity Auto Const Mandatory
Message Property RIR03_KeycardName_Freestar Auto Const Mandatory
Message Property RIR03_KeycardName_UC Auto Const Mandatory
Message Property RIR03_KeycardName_Paradiso Auto Const Mandatory
Message Property RIR03_KeycardName_HopeTown Auto Const Mandatory

ReferenceAlias Property Keycard Auto Const Mandatory
ReferenceAlias Property KeycardSafe Auto Const Mandatory

Event OnLoad()

    Actor GuardActor = Self.GetActorRef()
    Location MyLocation = ChosenLocation.GetLocation()

    If MyLocation.HasKeyword(CrimeFactionNeon_Keyword)
        GuardActor.SetOutfit(Outfit_Clothes_Neon_Security_NoHelmet)
        GuardActor.AddToFaction(CrimeFactionNeon)
        GuardActor.SetCrimeFaction(CrimeFactionNeon)
        GuardActor.SetOverrideName(RIR03_SecurityGuardName_Neon)
        Keycard.GetRef().SetOverrideName(RIR03_KeycardName_Neon)
        KeycardSafe.GetRef().SetOverrideName(RIR03_KeycardName_Neon)
    EndIf

    If MyLocation.HasKeyword(CrimeFactionAkilaCity_Keyword)
        GuardActor.SetOutfit(Outfit_Clothes_Akila_Security_NoHeadwear)
        GuardActor.AddToFaction(CrimeFactionFreestar)
        GuardActor.SetCrimeFaction(CrimeFactionFreestar)
        GuardActor.SetOverrideName(RIR03_SecurityGuardName_AkilaCity)
        Keycard.GetRef().SetOverrideName(RIR03_KeycardName_AkilaCity)
        KeycardSafe.GetRef().SetOverrideName(RIR03_KeycardName_AkilaCity)
    EndIf

    If MyLocation.HasKeyword(CrimeFactionFreestar_Keyword)
        GuardActor.SetOutfit(Outfit_Freestar_Militia_NoHat)
        GuardActor.AddToFaction(CrimeFactionFreestar)
        GuardActor.SetCrimeFaction(CrimeFactionFreestar)
        GuardActor.SetOverrideName(RIR03_SecurityGuardName_Freestar)
        Keycard.GetRef().SetOverrideName(RIR03_KeycardName_Freestar)
        KeycardSafe.GetRef().SetOverrideName(RIR03_KeycardName_Freestar)
    EndIf

    If MyLocation.HasKeyword(CrimeFactionUC_Keyword)
        GuardActor.SetOutfit(Outfit_Clothes_NewAtlantis_Security_NoHelmet)
        GuardActor.AddToFaction(CrimeFactionUC)
        GuardActor.SetCrimeFaction(CrimeFactionUC)
        GuardActor.SetOverrideName(RIR03_SecurityGuardName_UC)
        Keycard.GetRef().SetOverrideName(RIR03_KeycardName_UC)
        KeycardSafe.GetRef().SetOverrideName(RIR03_KeycardName_UC)
    EndIf

    If MyLocation.HasKeyword(CrimeFactionParadiso_Keyword)
        GuardActor.SetOutfit(Outfit_Clothes_Security_Guard_01_with_Helmet)
        GuardActor.AddToFaction(CrimeFactionParadiso)
        GuardActor.SetCrimeFaction(CrimeFactionParadiso)
        GuardActor.SetOverrideName(RIR03_SecurityGuardName_Paradiso)
        Keycard.GetRef().SetOverrideName(RIR03_KeycardName_Paradiso)
        KeycardSafe.GetRef().SetOverrideName(RIR03_KeycardName_Paradiso)
    EndIf

    If MyLocation.HasKeyword(CrimeFactionHopeTown_Keyword)
        GuardActor.SetOutfit(Outfit_Freestar_Militia_NoHat)
        GuardActor.AddToFaction(CrimeFactionFreestar)
        GuardActor.SetCrimeFaction(CrimeFactionFreestar)
        GuardActor.SetOverrideName(RIR03_SecurityGuardName_HopeTown)
        Keycard.GetRef().SetOverrideName(RIR03_KeycardName_HopeTown)
        KeycardSafe.GetRef().SetOverrideName(RIR03_KeycardName_HopeTown)
    EndIf

    GuardActor.AddToFaction(GuardFaction)

EndEvent

