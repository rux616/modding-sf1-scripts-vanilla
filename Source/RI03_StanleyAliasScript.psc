Scriptname RI03_StanleyAliasScript extends ReferenceAlias

ReferenceAlias Property Stanley Auto Const Mandatory
ReferenceAlias Property StanleyTerminal Auto Const Mandatory
Int Property iStageStanleyLuredAway = 1070 Auto Const 
GlobalVariable Property RI03_StanleyInWorkFurniture Auto Const Mandatory

Event OnExitFurniture(ObjectReference akActionRef)

    If akActionRef == Stanley.GetRef()

        If GetOwningQuest().GetStageDone(iStageStanleyLuredAway)

            ObjectReference TerminalRef = StanleyTerminal.GetRef()
            TerminalRef.Lock(False)
            TerminalRef.SetActorRefOwner(Game.GetPlayer())
        EndIf        

        RI03_StanleyInWorkFurniture.SetValue(0)

    EndIf

EndEvent

Event OnEnterFurniture(Actor akActionRef)

    RI03_StanleyInWorkFurniture.SetValue(1)

EndEvent