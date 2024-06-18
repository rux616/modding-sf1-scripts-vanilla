Scriptname FFCydoniaZ01CargoScript extends RefCollectionAlias

RefCollectionAlias Property Cargo Mandatory Const Auto
ReferenceAlias Property Cargo01 Mandatory Const Auto
Int Property StageToSet Mandatory Const Auto
Message Property FFCydoniaZ01_Cargo_Leech01_MSG Mandatory Const Auto
Message Property FFCydoniaZ01_Cargo_Leech02_MSG Mandatory Const Auto
Message Property FFCydoniaZ01_Cargo_NoLeech01_MSG Mandatory Const Auto
Message Property FFCydoniaZ01_Cargo_NoLeech02_MSG Mandatory Const Auto
Keyword Property LinkCustom01 Mandatory Const Auto
Keyword Property LinkCustom02 Mandatory Const Auto

;When the count in this ref collection = 0, set the next stage
Function CheckCount()
    If Cargo.GetCount() <= 0
        GetOwningQuest().SetStage(StageToSet)
    EndIf
EndFunction


;Show a message box, Spawn a heat leech (if linked), Remove the Cargo activator from the ref collection, update the count, and block activation so that it can't be used again.
Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
    Int iRandom = Utility.RandomInt(1, 2)
    ObjectReference myLinkedRef = akSenderRef.GetLinkedRef(LinkCustom01)
    If myLinkedRef
        If iRandom == 1
            FFCydoniaZ01_Cargo_Leech01_MSG.Show()
        Else
            FFCydoniaZ01_Cargo_Leech02_MSG.Show()
        EndIf
        myLinkedRef.Enable(true)
        (myLinkedRef as Actor).StartCombat(Game.GetPlayer())
    Else
        If iRandom == 1
            FFCydoniaZ01_Cargo_NoLeech01_MSG.Show()
        Else
            FFCydoniaZ01_Cargo_NoLeech02_MSG.Show()
        EndIf
    EndIf
    ;Clear the alias to clear the quest target
    If akSenderRef == Cargo01.GetRef()
        Cargo01.Clear()
    EndIf
    Cargo.RemoveRef(akSenderRef)
    akSenderRef.BlockActivation(True, True)
    CheckCount()
EndEvent