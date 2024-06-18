Scriptname FFClinicR02_PlayerScript extends ReferenceAlias Conditional


Group StagesAndIndices
    int Property ResourceSearchStage = 10 Const Auto
    {Once this stage is set, start tracking the player's collection of the Resource}

    int Property ResourceObjIndex =  10 Const Auto
    {Objective index we need to update each time the player collects the Resource}

;    int Property CompletionStage = 170 Const Auto
 ;   {Stage to set once the player's got enough of the Resource}
EndGroup


Group Globals
    GlobalVariable Property FFClinicR02ItemCount Mandatory Const Auto
    {Global var used to track how many Resources the player has collected}

    GlobalVariable Property FFClinicR02ItemTotal Mandatory Const Auto
    {Global var used to know how many of the Resource we want the player to collect}

    GlobalVariable Property FFClinicR02ResourceNumber Mandatory Const Auto
    {Global var used to know how which Resource we want the player to collect}

EndGroup

Group Objects
    Resource Property ResOrgCommonToxin Mandatory Const Auto
    {Toxin Resource object}

    Resource Property ResOrgCommonSealant Mandatory Const Auto
    {Sealant Resource object}

    Resource Property ResOrgUncommonMembrane Mandatory Const Auto
    {Membrane Resource object}

    Resource Property ResOrgUncommonAntibiotic Mandatory Const Auto
    {Antibiotic Resource object}

    Resource Property ResOrgRareAnalgesic Mandatory Const Auto
    {Analgesic Resource object}

    Resource Property ResOrgRareSedative Mandatory Const Auto
    {Sedative Resource object}

    Resource Property ResOrgExoticNarcotic Mandatory Const Auto
    {Narcotic Resource object}

    Resource Property ResOrgExoticBiosuppressant Mandatory Const Auto
    {Biosuppressant Resource object}

Form Property ResourceItemFilter Auto
EndGroup

Event OnAliasInit()
    debug.trace("Player alias init'ed.")
    RegisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
   if auiStageID == ResourceSearchStage
       debug.trace("Proper stage set. Register player for inventory events.")
       UnregisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
       RegisterPlayerForResourcePickup()
   endif
EndEvent

Function RegisterPlayerForResourcePickup()
    ;Do a check for pre-existing resources here in the future
if FFClinicR02ResourceNumber.GetValueInt()==1
   ResourceItemFilter = ResOrgCommonToxin 	
elseif FFClinicR02ResourceNumber.GetValueInt()==2
   ResourceItemFilter = ResOrgCommonSealant
elseif FFClinicR02ResourceNumber.GetValueInt()==3
   ResourceItemFilter = ResOrgUncommonMembrane
elseif FFClinicR02ResourceNumber.GetValueInt()==4
   ResourceItemFilter = ResOrgUncommonAntibiotic 
elseif FFClinicR02ResourceNumber.GetValueInt()==5
   ResourceItemFilter = ResOrgRareAnalgesic 
elseif FFClinicR02ResourceNumber.GetValueInt()==6
   ResourceItemFilter = ResOrgRareSedative 
elseif FFClinicR02ResourceNumber.GetValueInt()==7
   ResourceItemFilter = ResOrgExoticNarcotic 
elseif FFClinicR02ResourceNumber.GetValueInt()==8
   ResourceItemFilter = ResOrgExoticBiosuppressant 
endif
	AddInventoryEventFilter(ResourceItemFilter)
    debug.trace("Player registered for inventory events.")
;check for existing inventory items
Utility.wait(3) 
Quest myQuest = GetOwningQuest()
	 myQuest.ModObjectiveGlobal(Game.GetPlayer().GetItemCount(ResourceItemFilter), FFClinicR02ItemCount, ResourceObjIndex)
 
EndFunction

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
    Quest myQuest = GetOwningQuest()
	 myQuest.ModObjectiveGlobal(aiItemCount, FFClinicR02ItemCount, ResourceObjIndex)
;        RemoveInventoryEventFilter(ResourceItemFilter)
;        myQuest.SetStage(CompletionStage)
;    endif
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, int aiTransferReason)
 FFClinicR02ItemCount.SetValueInt(Game.GetPlayer().GetItemCount(ResourceItemFilter))
 Quest myQuest = GetOwningQuest()
	myQuest.ModObjectiveGlobal(0, FFClinicR02ItemCount, ResourceObjIndex)
;        RemoveInventoryEventFilter(ResourceItemFilter)
;        myQuest.SetStage(CompletionStage)
;    endif
EndEvent
