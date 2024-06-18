Scriptname RI02_ReplacementTriggerAliasScript extends ReferenceAlias

ReferenceAlias Property NinaPresentation Auto Const Mandatory
ReferenceAlias Property NinaPresentationReplacement Auto Const Mandatory
ReferenceAlias Property NinaPresentationMarker Auto Const Mandatory
MiscObject Property RI02_NinaPresentationReplacement Auto Const Mandatory
Int Property iStageSwapPresentation = 500 Auto Const
Int Property iStageSwapCompleted = 575 Auto Const
Int Property iStageReturnToImogene = 600 Auto Const

Event OnActivate(ObjectReference akActionRef)

    ObjectReference MyPlayer = Game.GetPlayer()
    Quest MyQuest = GetOwningQuest()

    If akActionRef == MyPlayer && MyPlayer.GetItemCount(RI02_NinaPresentationReplacement) >= 1
        Self.GetRef().BlockActivation(True, True)
        MyPlayer.AddItem(NinaPresentation.GetRef())
        Utility.Wait(1)
        Debug.Trace(Self + "Utility.Wait is over so place the replacement item")
        MyPlayer.RemoveItem(NinaPresentationReplacement.GetRef())
        NinaPresentationMarker.GetRef().PlaceAtMe(RI02_NinaPresentationReplacement, 1)
        Debug.Trace(Self + "Items hould be replaced: Marker: " + NinaPresentationMarker.GetRef() + " Item placed: " + NinaPresentationReplacement.GetRef())
        MyQuest.SetStage(iStageSwapCompleted)

        If MyQuest.IsObjectiveDisplayed(iStageSwapPresentation)
            MyQuest.SetStage(iStageReturntoImogene)
        EndIf
    EndIf

EndEvent