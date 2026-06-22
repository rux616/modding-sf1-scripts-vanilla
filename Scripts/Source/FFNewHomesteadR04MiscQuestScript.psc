Scriptname FFNewHomesteadR04MiscQuestScript extends Quest

ActorValue Property ProduceUses Mandatory Const Auto
Keyword Property LinkCustom01 Mandatory Const Auto
ReferenceAlias[] Property AllIceRefs Mandatory Const Auto
RefCollectionAlias Property LightEnableMarkers Mandatory Const Auto
RefCollectionAlias Property AllTurbines Mandatory Const Auto

Bool bQuestactive = False

struct IceSetupDatum
	ReferenceAlias IceMarkerAlias
	{The Ice Marker Alias}

    ReferenceAlias IceAlias
	{The Ice Alias}

	ReferenceAlias TurbineAlias
	{The Turbine Alias}
endStruct

IceSetupDatum[] property IceSetupData auto Const
{ array of data for ice/Markers/turbines }



;Register all the active ice refs so that we can tell if the player clears them. Also, check to see if the player has already cleared any ice already.
Function RegisterIce()
    ;Reset the turbines to their default working state
    ResetTurbines()
    ;Setup the broken turbines
    SetupBrokenTurbines()

    Int i
    Int iCount = AllIceRefs.Length

    While i < iCount
        ObjectReference myIce = AllIceRefs[i].GetRef()
        ;If there are any issues with the ProduceUses value, see GEN-331086
        RegisterForActorValueLessThanEvent(myIce, ProduceUses, 1)
        If myIce.GetValue(ProduceUses) < 1
            IceIsCleared(myIce, ProduceUses)
        EndIf
        i+=1
    EndWhile
EndFunction

;Reset the turbines to their default working state
Function ResetTurbines()
    Int i
    Int iCount = AllTurbines.GetCount()
    While i < iCount
	    ObjectReference myTurbine = AllTurbines.GetAt(i)
	    myTurbine.PlayAnimation("StateB_Idle")
	    i += 1
    EndWhile
EndFunction

;The turbines which are linked to ice on them will be put in their "broken" state.
Function SetupBrokenTurbines()
    Int i
    Int iLength = IceSetupData.Length
    While i < iLength
        ObjectReference myMarker = IceSetupData[i].IceMarkerAlias.GetRef()
       
        ObjectReference myLinkedTurbine = myMarker.GetLinkedRef()
        If myLinkedTurbine != None
            IceSetupData[i].TurbineAlias.ForceRefTo(myLinkedTurbine)
            myLinkedTurbine.PlayAnimation("StateC_Play")
        EndIf

        i += 1
    EndWhile
EndFunction



Function ChangeMiscBool()
    bQuestActive = True
EndFunction


;When the player clears the ice, put the turbine into its normal spinning animation.
Function IceIsCleared(ObjectReference akObjRef, ActorValue akActorValue)
    If bQuestActive == False
        Debug.Trace("The actor value" + akActorValue + " on " + akObjRef + " has changed to " + akObjRef.GetValue(akActorValue))
        ObjectReference myLinkedTurbine = akObjRef.GetLinkedRef(LinkCustom01)
        If myLinkedTurbine != None
            myLinkedTurbine.PlayAnimation("Play01")
        EndIf
        akObjRef.Disable()
    EndIf
EndFunction


;When the quest starts, Register all the active Ice refs. Also, Enable the Flickering Light EnableMarkers so that the lights start to flicker.
Event OnQuestInit()
    LightEnableMarkers.EnableAll()
EndEvent


Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
    IceIsCleared(akObjRef, akActorValue)
EndEvent