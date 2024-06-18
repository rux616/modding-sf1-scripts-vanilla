Scriptname TestDialogueSystem4PlayerScript extends ReferenceAlias

Int Property IntTestVar=1 Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    If IntTestVar==1
        ;test scripting
    EndIf
    (GetOwningQuest() as TestDialogueSystem4Script).TestMyFunction()
EndEvent