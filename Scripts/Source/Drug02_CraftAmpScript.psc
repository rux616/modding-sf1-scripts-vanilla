Scriptname Drug02_CraftAmpScript extends ReferenceAlias Const

Event OnAliasInit()
    RegisterForRemoteEvent(SELF, "OnPlayerCraftItem")
    RegisterForRemoteEvent(SELF, "OnPlayerCompleteResearch")
EndEvent

Event OnPlayerCraftItem(ObjectReference akBench, Location akLocation, Form akCreatedItem)
    Debug.Trace(akCreatedItem + " was made at " + akBench + " in location " + akLocation)

    ; Once the proper item is crafted - set the indicated stage
    if ( akCreatedItem == FormToCheck )
        GetOwningQuest().SetStage(StageToSet)
    endif
endEvent

Event OnPlayerCompleteResearch(ObjectReference akBench, Location akLocation, ResearchProject akCompletedProject)
    Debug.Trace("Research on " + akCompletedProject + " was completed at " + akBench + " in location " + akLocation)

    ; If the player researched Amp, progress the quest
    if ( akCompletedProject == Drug_Research_T1_Amp )
        GetOwningQuest().SetStage(StageToSet)
    EndIf
endEvent

Form Property FormToCheck Auto Const
Int Property StageToSet Auto Const
ResearchProject Property Drug_Research_T1_Amp Auto Const Mandatory
