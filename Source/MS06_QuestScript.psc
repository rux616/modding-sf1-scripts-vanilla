Scriptname MS06_QuestScript extends Quest

ActorValue Property DockingPermission Mandatory Const Auto
ConditionForm Property MS06_ResourceConditionForm Mandatory Const Auto
GlobalVariable Property MS06ChoiceValue Mandatory Const Auto
GlobalVariable Property MS06_GravDriveCreditsAmount Mandatory Const Auto
GlobalVariable Property MS06_GravDriveCreditsAmountLess Mandatory Const Auto
GlobalVariable Property MS06Resource01Count Mandatory Const Auto
GlobalVariable Property MS06Resource01Total Mandatory Const Auto
GlobalVariable Property MS06Resource01ConstantAmount Mandatory Const Auto
GlobalVariable Property MS06Resource02Count Mandatory Const Auto
GlobalVariable Property MS06Resource02Total Mandatory Const Auto
GlobalVariable Property MS06Resource02ConstantAmount Mandatory Const Auto
GlobalVariable Property MS06Resource03Count Mandatory Const Auto
GlobalVariable Property MS06Resource03Total Mandatory Const Auto
GlobalVariable Property MS06Resource03ConstantAmount Mandatory Const Auto
GlobalVariable Property MS06Resource04Count Mandatory Const Auto
GlobalVariable Property MS06Resource04Total Mandatory Const Auto
GlobalVariable Property MS06Resource04ConstantAmount Mandatory Const Auto
GlobalVariable Property MS06Retrofit01Status Mandatory Const Auto
GlobalVariable Property MS06Retrofit02Status Mandatory Const Auto
GlobalVariable Property MS06Retrofit03Status Mandatory Const Auto
Int Property GatherResourcesStage = 1000 Const Auto
Int Property ResourcesCompletedStage = 1500 Const Auto
Int Property CompletedRetrofitStage = 2400 Const Auto
Int Property EscapeStage = 3200 Const Auto
MiscObject Property Credits Mandatory Const Auto
MiscObject Property OrgCommonFiber Mandatory Const Auto
MiscObject Property OrgUncommonSealant Mandatory Const Auto
MiscObject Property InorgCommonIron Mandatory Const Auto
MiscObject Property InorgRareLithium Mandatory Const Auto
ReferenceAlias Property KlaxonSoundMarker Mandatory Const Auto
ReferenceAlias Property Player Mandatory Const Auto
ReferenceAlias Property PlayerShip Auto Const Mandatory
ReferenceAlias Property ECSConstantShip Mandatory Const Auto
RefCollectionAlias Property Klaxons Mandatory Const Auto
RefCollectionAlias Property LightsOff Mandatory Const Auto
Resource Property ResOrgCommonFiber Mandatory Const Auto
Resource Property ResOrgCommonSealant Mandatory Const Auto
Resource Property ResInorgCommonIron Mandatory Const Auto
Resource Property ResInorgRareLithium Mandatory Const Auto
LeveledItem Property MS06_LL_ConstantGoods Mandatory Const Auto

Float Property ExplodeTimerLength = 10.0 Auto Const
Int ExplodeTimerID = 1



Struct ResourceData
    Resource ResourceType
    {The type of Reource we're looking for}
    GlobalVariable ResourceCount
    {The amount of the resource we have}
    GlobalVariable ResourceTotal
    {The amount of the resource we need}
    Int ResourceObjective
    {The objective associated with the Resource Type}
    Bool ResourceFulfilled
    {Does the player have the required amount?}
EndStruct

ResourceData[] Property ResourceDatum Auto ;Mandatory (Don't require until Resource type is chosen. TBD)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Function SetChoice(Int aiChoiceValue)
    MS06ChoiceValue.SetValue(aiChoiceValue)
EndFunction


;Starts the RegisterPlayerForResourceTracking() on the player script
Function RegisterPlayerforInventoryFilter()
   MS06_PlayerScript myPlayerScript = Player as MS06_PlayerScript
   myPlayerScript.RegisterPlayerForResourceTracking()
EndFunction


;Check to see if the player has the required amount of resources, and updates the objective count accordingly, hiding it if complete.
;This will be run when the we start tracking the resources on the player script to see if the player already has anything, and whenever 
;they add the conditioned resource type via MS06_PlayerScript.
Function ResourceCheck()
    Int i = 0
    Int iLength = ResourceDatum.Length
    While i < iLength
        GlobalVariable myResourceCount = (ResourceDatum[i].ResourceCount)
        Int MyPlayerComponentCount = Game.GetPlayer().GetComponentCount(ResourceDatum[i].ResourceType)
        If myResourceCount.GetValue() != MyPlayerComponentCount
            myResourceCount.SetValue(MyPlayerComponentCount)
            UpdateCurrentInstanceGlobal(ResourceDatum[i].ResourceCount)
            If  ResourceDatum[i].ResourceCount.GetValue() >= ResourceDatum[i].ResourceTotal.GetValue()
                ResourceDatum[i].ResourceFulfilled = True
                ;Hide the objective if the player has enough.
                SetObjectiveDisplayed(ResourceDatum[i].ResourceObjective, False)
            Else
                ResourceDatum[i].ResourceFulfilled = False
                ;Redisplay the objective if the player no longer has the required amount.
                SetObjectiveDisplayed(ResourceDatum[i].ResourceObjective, True, True)
            EndIf
        EndIf
        i += 1
    EndWhile

    AllResourcesCheck()
EndFunction


;Checks to see if all resources are fulfilled. If any come back false, stop and redisplay the turn-in Objective if the proper stage is active.
Function AllResourcesCheck()
    Int i = 0
    Int iLength = ResourceDatum.Length
    Bool ResourcesFulfilled = False
    While i < iLength
        Debug.Trace(self + "AllResourcesCheck: Resource=" + ResourceDatum[i].ResourceType + " Amount=" + ResourceDatum[i].ResourceCount.GetValue() + " Fufilled?=" + ResourceDatum[i].ResourceFulfilled)
        If ResourceDatum[i].ResourceFulfilled == True
            ResourcesFulfilled = True
        Else
            ResourcesFulfilled = False
            ;Stop the while loop
            i = iLength
        EndIf
    i += 1
    EndWhile

    Debug.Trace(self + "AllResourcesCheck: ResourcesFulfilled=" + ResourcesFulfilled)

    If ResourcesFulfilled == True
        If GetStageDone(ResourcesCompletedStage)
            SetObjectiveDisplayed(ResourcesCompletedStage)
        Else
            SetStage(ResourcesCompletedStage)
        EndIf
    Else
        If GetStageDone(ResourcesCompletedStage)
            SetObjectiveDisplayed(ResourcesCompletedStage, False)
        EndIf
    EndIf
EndFunction


;Removes the required amount of resources from the player.
Function RemoveResources()
    If MS06_ResourceConditionForm.IsTrue(Game.GetPlayer())
        Game.GetPlayer().RemoveItemByComponent(ResOrgCommonFiber, MS06Resource01Total.GetValue() as Int)
        Game.GetPlayer().RemoveItemByComponent(ResOrgCommonSealant, MS06Resource02Total.GetValue() as Int)
        Game.GetPlayer().RemoveItemByComponent(ResInorgCommonIron, MS06Resource03Total.GetValue() as Int)
        Game.GetPlayer().RemoveItemByComponent(ResInorgRareLithium, MS06Resource04Total.GetValue() as Int)
    EndIf
EndFunction


;Removes the specified amount of credits.
Function RemoveCredits(Bool abSpeechChallengeSuccess)
    ;Amount is verified by Topic Info Condition before this is run by the fragment.
    If abSpeechChallengeSuccess == False
        Game.GetPlayer().RemoveItem(Credits, MS06_GravDriveCreditsAmount.GetValue() as Int)
    Else
        Game.GetPlayer().RemoveItem(Credits, MS06_GravDriveCreditsAmountLess.GetValue() as Int)
    EndIf
EndFunction


;Checks to make sure the Engineering Terminals are all properly set, then sets the proper stage.
Function CheckEngineeringTerminalSettings()
    Debug.Trace(self + "CheckEngineeringTerminalSettings is being called")
    If !GetStageDone(CompletedRetrofitStage)
        Debug.Trace(self + "MS06Retrofit01Status=" + MS06Retrofit01Status.GetValue() + " MS06Retrofit02Status=" + MS06Retrofit02Status.GetValue() + "MS06Retrofit03Status=" + MS06Retrofit03Status.GetValue())
        If MS06Retrofit01Status.GetValue() == 1 && MS06Retrofit02Status.GetValue() == 1 && MS06Retrofit03Status.GetValue() == 1
            SetStage(CompletedRetrofitStage)
        EndIf
    EndIf
EndFunction

;Gives the player the some of the resources they need from the ECS Constant, if they succeed at a speech challenge.
Function ConstantGiveResources()
    Actor myPlayer = Game.GetPlayer()
    myPlayer.AddItem(OrgCommonFiber, MS06Resource01ConstantAmount.GetValue() as Int)
    myPlayer.AddItem(OrgUncommonSealant, MS06Resource02ConstantAmount.GetValue() as Int)
    myPlayer.AddItem(InorgCommonIron, MS06Resource03ConstantAmount.GetValue() as Int)
    myPlayer.AddItem(InorgRareLithium, MS06Resource04ConstantAmount.GetValue() as Int)
EndFunction


;Gives the player the some goods from the ECS Constant that they can sell, if they succeed at a speech challenge.
Function ConstantGiveGoods()
    Game.GetPlayer().AddItem(MS06_LL_ConstantGoods)
EndFunction


;Debug: Gives the player the required number of resources for this quest.
Function DebugGiveResources()
    Game.GetPlayer().AddItem(OrgCommonFiber, MS06Resource01Total.GetValue() as Int)
    Game.GetPlayer().AddItem(OrgUncommonSealant, MS06Resource02Total.GetValue() as Int)
    Game.GetPlayer().AddItem(InorgCommonIron, MS06Resource03Total.GetValue() as Int)
    Game.GetPlayer().AddItem(InorgRareLithium, MS06Resource04Total.GetValue() as Int)
EndFunction


;Start the klaxons
Function StartKlaxons()
    KlaxonSoundMarker.GetRef().Enable()
    Int i
    Int iCount = Klaxons.GetCount()
    While i < iCount
        ObjectReference myKlaxon = Klaxons.GetAt(i)
        myKlaxon.PlayAnimation("TurnOnPulse")
        i += 1
    EndWhile
EndFunction

;Sets the ECS Constant to Explode
Function SetECSConstantSelfDestruct()
    LightsOff.DisableAll()
    StartKlaxons()
EndFunction


Function ECSConstantExplode()
    ECSConstantShip.GetShipReference().SetValue(DockingPermission, 4)
    StartTimer(ExplodeTimerLength, ExplodeTimerID)
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnTimer(Int aiTimerId)
    If aiTimerId == ExplodeTimerID
        ;UnRegisterForRemoteEvent(PlayerShip, "OnShipUndock")
        KlaxonSoundMarker.GetRef().Disable()
        SpaceshipReference myShip = ECSConstantShip.GetRef() as SpaceshipReference 
        myShip.SetValue(Game.GetInvulnerableAV(), 0)
        myShip.IgnoreFriendlyHits(False)
        myShip.KillEssential()
    EndIf
EndEvent