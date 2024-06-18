Scriptname DR009_SteamGenerationRotationScript extends ObjectReference Const

float property level0Speed auto Const
float property level1Speed auto Const

Event OnCellLoad()
    ObjectReference[] rotationHelpers = GetLinkedRefChain()

    PlayRotationAnimation(rotationHelpers[0], level0Speed)
    PlayRotationAnimation(rotationHelpers[1], level1Speed)
EndEvent

function PlayRotationAnimation(ObjectReference roationHelper, float speed)

    roationHelper.SetAnimationVariableFloat("Speed", speed)
    roationHelper.PlayAnimation("RotateCW_Loop")

endFunction