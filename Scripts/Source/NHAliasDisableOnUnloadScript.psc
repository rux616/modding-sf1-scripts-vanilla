Scriptname NHAliasDisableOnUnloadScript extends ReferenceAlias
{Used when the NPCs leave the interior during the Establishing scene}

Int Property StagePrereq Mandatory Const Auto

Event OnUnload()
    If GetOwningQuest().GetStageDone(StagePrereq)
        GetRef().Disable()
    EndIf
EndEvent