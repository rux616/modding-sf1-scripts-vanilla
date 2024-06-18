Scriptname FFCydoniaZ04WallActivatorAliasScript extends RefCollectionAlias
{Modifies a global value for the Quest Objective, Enables a linked ref, and Removes the Activated Ref from the Collection}

GlobalVariable Property FFCydoniaZ04_DrawingsPosted Mandatory Const Auto
GlobalVariable Property FFCydoniaZ04_DrawingsTotal Mandatory Const Auto
Keyword Property LinkCustom01 Mandatory Const Auto
Int Property ObjectiveToUpdate Mandatory Const Auto
Int Property StageToSet Mandatory Const Auto

;Enable the linked ref, then increment the Global Value. If the Global Value count reaches the total, complete the objective.
Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer()
        If akSenderRef.GetLinkedRef(LinkCustom01)
            akSenderRef.GetLinkedRef(LinkCustom01).Enable()
            akSenderRef.BlockActivation(True, True)
            Float fTotalDrawings = FFCydoniaZ04_DrawingsTotal.GetValue()
            If FFCydoniaZ04_DrawingsPosted.GetValue() <= fTotalDrawings
                Quest myQuest = GetOwningQuest()
                If myQuest.ModObjectiveGlobal(1, FFCydoniaZ04_DrawingsPosted, ObjectiveToUpdate, fTotalDrawings) == True
                    myQuest.SetStage(StageToSet)           
                EndIf
                RemoveRef(akSenderRef)
            EndIf
        EndIf
    EndIf
EndEvent


Event OnAliasInit()
    BlockActivation(False, False)
EndEvent