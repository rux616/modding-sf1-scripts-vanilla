Scriptname UC08_TTMorphAliasScript extends ReferenceAlias

int Property PrereqStage = 450 Const Auto
{Only start the teleportin' once this stage is set on UC08}

ObjectReference Property TeleportMarker Mandatory Const Auto
{Marker to teleport this critter to}

ReferenceAlias Property NonHostileTT Mandatory Const Auto
{Alias used to keep the Transformed Morph friendly to the player}

Event OnLoad()
    if GetOwningQuest().GetStageDone(PrereqStage)
       ProcessTTMorph()
    endif
EndEvent

Event OnUnload()
    if GetOwningQuest().GetStageDone(PrereqStage)
        ProcessTTMorph()
    endif
EndEvent

Function ProcessTTMorph()
    Actor currACT = GetActorRef()
    NonHostileTT.Clear()
    
    if currACT.IsGhost()
        currACT.SetGhost(false)
    endif

    if !currACT.IsDead()
        currACT.MoveTo(TeleportMarker)
    endif
EndFunction