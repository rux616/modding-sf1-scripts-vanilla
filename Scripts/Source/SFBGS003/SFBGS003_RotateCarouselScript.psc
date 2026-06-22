Scriptname SFBGS003:SFBGS003_RotateCarouselScript extends ObjectReference Const

Group Required_Properties
    ObjectReference Property DisplayCase Mandatory Const Auto
    {Carousel display case that will rotate}
EndGroup

Group RotateSettings
    bool Property CycleRight = false Const Auto
    {False: Cycles display case items to the left.
    True: Cycles display case items to the right.}
EndGroup

Event OnActivate(ObjectReference akActionRef)
    if CycleRight == false
        DisplayCase.RotateCarouselDisplayCase(-1)
    else
        DisplayCase.RotateCarouselDisplayCase(1)
    endif
EndEvent
