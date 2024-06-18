Scriptname VascoShutDownZeroGScript extends Actor Const

Group Autofill
    ActorValue Property VascoShutDownZeroG Mandatory Const Auto

    Perk Property VascoShutDownZeroGPlayerPerk Mandatory Const Auto

    Message Property VascoShutDownZeroGActivateMessage Mandatory Const Auto

    Scene Property CREW_EliteCrew_Vasco_ShutdownZeroG Mandatory Const Auto
EndGroup


Function ShutDown()
    SetUnconscious()
    CREW_EliteCrew_Vasco_ShutdownZeroG.Start()
    setvalue(VascoShutDownZeroG, 1)
    Game.GetPlayer().AddPerk(VascoShutDownZeroGPlayerPerk)
EndFunction

Function StartUp()
    SetUnconscious(false)
    setvalue(VascoShutDownZeroG, 0)
    Game.GetPlayer().RemovePerk(VascoShutDownZeroGPlayerPerk)
EndFunction

Function ActivatedDuringShutDown()
    VascoShutDownZeroGActivateMessage.Show()
EndFunction

Event OnActivate(ObjectReference akActionRef)
    if GetValue(VascoShutDownZeroG) == 1
        ActivatedDuringShutDown()
    endif
EndEvent