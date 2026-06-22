Scriptname RL082GravAirlock extends TerminalMenu
{Script to handle interaction with Zero G airlock in level RL083}

Cell Property RL082TAWarehouse01 Auto Const
Keyword property LinkCustom01 auto const mandatory
Keyword property LinkCustom02 auto const mandatory

ObjectReference[] LinkedRefs
;Objects to aplly impulse havok
ObjectReference  AirlockDoor01
;Door to Zero G cell
ObjectReference  AirlockDoor02
;Door in current normal G cell;

;enums
int property menuItemID_01 = 1 auto const
int property menuItemID_02 = 2 auto const

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    ;Player must use terminal to turn on or off gravity to proceed through the doors
    HandleMenuItem(auiMenuItemID)
    LinkedRefs = akterminalref.GetLinkedRefChain()
    AirlockDoor01 = akterminalref.GetLinkedRef(LinkCustom01)
    AirlockDoor02 = akterminalref.GetLinkedRef(LinkCustom02)
EndEvent


function HandleMenuItem(int auiMenuItemID)
    if auiMenuItemID == menuItemID_01
        StartTimer(0.1, 10)
    elseif auiMenuItemID == menuItemID_02
        StartTimer(0.1, 20)
    endif
EndFunction

Event OnTimer(int aiTimerID)
    If aiTimerID == 10
        AirlockDoor01.lock()
        AirlockDoor01.SetLockLevel(253)
        AirlockDoor02.unlock()
        RL082TAWarehouse01.setGravityScale(0)

        int i = 0
        while (i < LinkedRefs.length)
            ;Apply an impulse to refs linked ref to computer to show the effect of flaoting objects when turning gravity to 0
            LinkedRefs[i].ApplyHavokImpulse(Utility.RandomFloat(-1.0, 1.0), Utility.RandomFloat(-1.0, 1.0), Utility.RandomFloat(-1.0, 1.0), LinkedRefs[i].GetMass()*Utility.RandomInt(1, 2)*0.25)
            i += 1
        endwhile
    elseif aiTimerID == 20
        AirlockDoor01.unlock()
        AirlockDoor01.setopen()
        AirlockDoor02.lock()
        AirlockDoor02.SetLockLevel(253)
        RL082TAWarehouse01.setGravityScale(1.0)
    endif
EndEvent



