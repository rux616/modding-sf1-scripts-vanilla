Scriptname TestMultiActorSceneNonPlayerScript extends ObjectReference Const

Message Property TestMultiActorMSG Auto Const
ObjectReference Property FirstPerson Auto Const
ObjectReference Property SecondPerson Auto Const
ObjectReference Property SidebySide Auto Const
ObjectReference Property Width Auto Const
ObjectReference Property Depth Auto Const
ObjectReference Property Combo Auto Const
ObjectReference Property FirstMarker Auto Const
ObjectReference Property Chair Auto Const
Scene Property TestTwoPersonSceneNonPlayerScene Mandatory Const Auto

Event OnActivate(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
        TestTwoPersonSceneNonPlayerScene.Stop()
        Int ButtonValue = TestMultiActorMSG.Show()
        If ButtonValue == 0
            SecondPerson.Moveto(SidebySide)
        ElseIf ButtonValue == 1
            SecondPerson.Moveto(Width)
        ElseIf ButtonValue == 2
            SecondPerson.Moveto(Depth)
        ElseIf ButtonValue == 3
            SecondPerson.Moveto(Combo)
        ElseIf ButtonValue == 4
            SecondPerson.Moveto(Chair)
        EndIf
	FirstPerson.moveto(FirstMarker)
    TestTwoPersonSceneNonPlayerScene.Start()
    EndIf
EndEvent