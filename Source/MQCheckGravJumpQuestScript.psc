Scriptname MQCheckGravJumpQuestScript extends Quest

ReferenceAlias Property PlayerShip Mandatory Const Auto
Int Property PreReqStageGravJumpRange=12 Const Auto
Int Property StageToSetGravJumpRange=13 Const Auto
Int Property GravJumpRangeToCheck=28 Const Auto

Function CheckSkillsMenu()
    RegisterForMenuOpenCloseEvent("SkillsMenu")
EndFunction

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
    if (asMenuName== "SkillsMenu")
        if !(abOpening)
	        ;whenever we close the skills menu, check if the player's ship has a better range (because the player might have ranked up Astrodynamics)
            SpaceshipReference MyShip = PlayerShip.GetShipRef()
            Float myJumpRange = MyShip.GetGravJumpRange()
            If myJumpRange >= GravJumpRangeToCheck
                If Self.GetStageDone(PreReqStageGravJumpRange)
                    Self.SetStage(StageToSetGravJumpRange)
                EndIf
            EndIf
        endif
    endif
endEvent