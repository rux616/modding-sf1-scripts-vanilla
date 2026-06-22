Scriptname UC_RHQ_TeleportRefOnLoadScript extends Actor Const

Keyword Property UC_RHQ_TeleportLinkedRef Mandatory Const Auto
{Keyword used to know which marker to teleport the NPC to}

Event OnCellLoad()
    if IsEnabled()
        MoveTo(GetLinkedRef(UC_RHQ_TeleportLinkedRef))
    endif
EndEvent