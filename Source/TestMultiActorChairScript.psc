Scriptname TestMultiActorChairScript extends ObjectReference Const

Message Property TestMultiActorMSG Auto Const
ObjectReference Property FirstPerson Auto Const
ObjectReference Property SecondPerson Auto Const
ObjectReference Property SidebySide Auto Const
ObjectReference Property Width Auto Const
ObjectReference Property Depth Auto Const
ObjectReference Property Combo Auto Const
ObjectReference Property FirstMarker Auto Const
Scene Property TestTwoPersonSceneNonPlayerScene Mandatory Const Auto

Event OnActivate(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
        Int ButtonValue = TestMultiActorMSG.Show()
        If ButtonValue == 0
            SecondPerson.Disable()
            SecondPerson.SetLinkedRef(SidebySide)
            SecondPerson.Moveto(SidebySide)
            SecondPerson.Enable()
        ElseIf ButtonValue == 1
            SecondPerson.Disable()
            SecondPerson.SetLinkedRef(Width)
            SecondPerson.Moveto(Width)
            SecondPerson.Enable()
        ElseIf ButtonValue == 2
            SecondPerson.Moveto(Depth)
            SecondPerson.Disable()
            SecondPerson.SetLinkedRef(Depth)
            SecondPerson.Moveto(Depth)
            SecondPerson.Enable()
        ElseIf ButtonValue == 3
            SecondPerson.Disable()
            SecondPerson.SetLinkedRef(Combo)
            SecondPerson.Moveto(Combo)
            SecondPerson.Enable()
        EndIf
    EndIf
EndEvent