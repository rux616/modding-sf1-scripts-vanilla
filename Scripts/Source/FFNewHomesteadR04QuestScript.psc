Scriptname FFNewHomesteadR04QuestScript extends Quest

Keyword Property LinkCustom01 Mandatory Const Auto
LocationAlias Property NewHomestead Mandatory Const Auto
ReferenceAlias[] Property AllIceRefs Mandatory Const Auto
ActorValue Property ProduceUses Mandatory Const Auto
Int Property ReturnStage = 300 Const Auto
Int Property CooldownTimerFinishedStage = 9999 Const Auto
Int Property ShutdownQuestStage = 10000 Const Auto
Int Property ObjectiveToUpdate = 200 Const Auto
Int Property IceCleared = 0 Auto
Int Property IceTotal Auto
Float Property CooldownTimerDays = 3.0 Const Auto
GlobalVariable Property FFNewHomesteadR04_CooldownTime Mandatory Const Auto
GlobalVariable Property FFNewHomesteadR04_IceCleared Mandatory Const Auto
Quest Property FFNewHomesteadR04Misc Mandatory Const Auto

struct IceSetupDatum
	ReferenceAlias IceAlias
	{The Ice Alias}

	ReferenceAlias TurbineAlias
	{The Turbine Alias}
endStruct

IceSetupDatum[] property IceSetupData auto Const
{ array of data for ice/turbines }



;We need to register the ice refs so that we know when the player has harvested them.
;Ice01-05 are flora objects that are created at randomized markers, and only exist while this quest is active.
Function RegisterIce()
    FFNewHomesteadR04_IceCleared.SetValue(0)
    ModObjectiveGlobal(0, FFNewHomesteadR04_IceCleared, ObjectiveToUpdate)

    Int i
    Int iCount = IceSetupData.Length
    IceTotal = iCount

    While i < iCount
        ObjectReference myIce = IceSetupData[i].IceAlias.GetRef()
        ObjectReference myTurbine = IceSetupData[i].TurbineAlias.GetRef()
        If myTurbine != None
            myIce.SetLinkedRef(myTurbine, LinkCustom01)
        EndIf

        ;If there are any issues with the ProduceUses value, see GEN-331086
        RegisterForActorValueLessThanEvent(myIce, ProduceUses, 1)
        If myIce.GetValue(ProduceUses) < 1
            IceIsCleared(myIce, ProduceUses)
        EndIf


        i+=1
    EndWhile

EndFunction


;Sets the cooldown time for this quest. The quest will continue to run until the timer expires. Then, it will restart FFNewHomeSteadR04Misc so the quest can be repeated.
Function SetCooldown()
    Float CooldownTimerLengthHours = 24 * CooldownTimerDays   
    StartTimerGameTime(CooldownTimerLengthHours)
EndFunction


;When the player clears the ice, put the turbine into its normal spinning animation. If all ice is cleared, set the Return to Joyce stage 
; which will disable the light enablemarker so the lights stop flickering.
Function IceIsCleared(ObjectReference akObjRef, ActorValue akActorValue)
    Debug.Trace("The actor value" + akActorValue + " on " + akObjRef + " has changed to " + akObjRef.GetValue(akActorValue))
    ObjectReference myLinkedTurbine = akObjRef.GetLinkedRef(LinkCustom01)
    If myLinkedTurbine != None
        myLinkedTurbine.PlayAnimation("Play01")
    EndIf
    akObjRef.Disable()
    IceCleared += 1
    ModObjectiveGlobal(1, FFNewHomesteadR04_IceCleared, ObjectiveToUpdate)
    If IceCleared >= IceTotal
        SetStage(ReturnStage)
    EndIf
EndFunction



Event OnQuestInit()
    (FFNewHomesteadR04Misc as FFNewHomesteadR04MiscQuestScript).ChangeMiscBool()
    RegisterIce()
EndEvent

;Add to the total IceCleared count when the player harvests the Ice, unregister it, then go to the next quest stage when all ice has been harvested.
Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
    IceIsCleared(akObjRef, akActorValue)
EndEvent


Event OnTimerGameTime(int aiTimerID)
    SetStage(CooldownTimerFinishedStage)
    ;This stops the quest if the player is already in New Homestead so that FFNewHomesteadR04Misc can start again. Otherwise, the ShutdownQuestStage 
    ;will get set via DefaultQuestChangeLocationScript when the player changes their location back to New Homestead.
    If Game.GetPlayer().IsInLocation(NewHomestead.GetLocation())
        SetStage(ShutdownQuestStage)
    EndIf
EndEvent
