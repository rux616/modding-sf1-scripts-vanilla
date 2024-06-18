Scriptname CF04GalbankArchivesAmbushQuestScript extends Quest
{Quest to control Ecliptic ambush at the Galbnk archives, as part of CF04.}

group AutofillProperties
    ReferenceAlias Property Alias_GalbankArchivesDoor auto const mandatory
endGroup

group TimingProperties
    float property secondsUntilEclipticExitAmbushFurniture = 1.0 auto const mandatory
endGroup

function OnGalbankArchivesTriggerEntered()
    ; lock the door behind the player
    ObjectReference galbankArchivesDoor = Alias_GalbankArchivesDoor.GetRef()

    galbankArchivesDoor.SetOpen(false)
    galbankArchivesDoor.SetLockLevel(255)
endFunction