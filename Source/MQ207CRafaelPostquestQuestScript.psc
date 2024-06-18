Scriptname MQ207CRafaelPostquestQuestScript extends Quest
{Quest script for MQ207C_RafaelPostquest, the quest that manages Rafael's transition from Quest NPC to Elite Crew.}

Group AutofillProperties
    LocationAlias property PlayerShipInteriorLocation Auto Const Mandatory
    ReferenceAlias property PlayerShip Auto Const Mandatory
    ReferenceAlias property RafaelAguerro Auto Const Mandatory
    Location property SFreya_PFreyaIII Auto Const Mandatory
    Location property CityNewAtlantisLocation Auto Const Mandatory
    Keyword property LocTypeSettlement Auto Const Mandatory
EndGroup

;Local consts.
int CONST_II_FollowToShipStage = 20 Const
int CONST_II_PassengerOnShipStage = 30 Const
int CONST_II_DisableInSettledSystemStage = 40 Const
int CONST_III_ReadyToDisableInNishinaStage = 100 Const
int CONST_III_DisableInNishinaStage = 110 Const
int CONST_Post_WatchForArrivalInNewAtlantisStage = 200 Const
int CONST_Post_DisplaySpeakToRafaelStage = 210 Const

Event OnQuestInit()
    RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
    RegisterForRemoteEvent(PlayerShip, "OnLocationChange")
EndEvent

Event Actor.OnLocationChange(Actor akSource, Location akOldLoc, Location akNewLoc)
    UpdatePostquestState(akNewLoc)
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSource, Location akOldLoc, Location akNewLoc)
    UpdatePostquestState(akNewLoc)
EndEvent

Function UpdatePostquestState(Location akPlayerLoc)
    if ((GetStage() == CONST_II_FollowToShipStage) && ((akPlayerLoc == PlayerShipInteriorLocation.GetLocation()) || ((akPlayerLoc != SFreya_PFreyaIII) && !SFreya_PFreyaIII.IsChild(akPlayerLoc))))
        SetStage(CONST_II_PassengerOnShipStage)
    EndIf
    if ((GetStage() == CONST_II_PassengerOnShipStage) && ((akPlayerLoc.HasKeyword(LocTypeSettlement)) || (akPlayerLoc.GetParentLocations(LocTypeSettlement).Length > 0)) && (RafaelAguerro.GetRef().GetCurrentLocation() != akPlayerLoc))
        SetStage(CONST_II_DisableInSettledSystemStage)
    EndIf
    if ((GetStage() == CONST_III_ReadyToDisableInNishinaStage) && (!akPlayerLoc.IsChild(SFreya_PFreyaIII)))
        SetStage(CONST_III_DisableInNishinaStage)
    EndIf
    if ((GetStage() == CONST_Post_WatchForArrivalInNewAtlantisStage) && ((akPlayerLoc == CityNewAtlantisLocation) || (akPlayerLoc.IsChild(CityNewAtlantisLocation))))
        SetStage(CONST_Post_DisplaySpeakToRafaelStage)
    EndIf
EndFunction