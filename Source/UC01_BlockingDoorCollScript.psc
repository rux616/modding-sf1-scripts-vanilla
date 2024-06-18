Scriptname UC01_BlockingDoorCollScript extends RefCollectionAlias

bool Property OpenOrClose Const Auto
{If "TRUE", this is an Opening trigger, and walking into it will tell the Blocking Door to open when any trigger in this collection is entered.
Otherwise, it's a Blocking trigger and will close the blocking door when any trigger is entered}

ReferenceAlias Property BlockingDoor Mandatory Const Auto
{Ref Alias to the door blocking the button}

int Property ShutdownStage Mandatory Const Auto
{Once this stage is set, we don't care anymore}

Scene Property UC01_320a_ContactDetected Mandatory Const Auto
{Scene to play if the player has contacted the wires in Sector A}

Scene Property UC01_320b_SectorAReset Mandatory Const Auto
{Scene to play once the player has reset Sector A}

int Property FirstTimeStage Const Auto
{Stage to set the first time the player enters one of these triggers}

LocationRefType Property UC01_SectorAResetTrigger_RefType Mandatory Const Auto
{Loc type to check for to throw the "First Time" stage}

Event OnTriggerEnter(ObjectReference akSenderRef, ObjectReference akActionRef)
    Quest OQ = GetOwningQuest()
    if !OQ.GetStageDone(FirstTimeStage) && akSenderRef.HasRefType(UC01_SectorAResetTrigger_RefType)
        OQ.SetStage(FirstTimeStage)
    EndIf

    if !OQ.GetStageDone(ShutdownStage) && akActionRef == Game.GetPlayer()
        ObjectReference myDoor = BlockingDoor.GetRef()
        if OpenOrClose
            if myDoor.GetOpenState() > 2
                if UC01_320a_ContactDetected.IsPlaying()
                    UC01_320a_ContactDetected.Stop()
                EndIf
                UC01_320b_SectorAReset.Start()
                myDoor.SetOpen()
            endif
        else
            if myDoor.GetOpenState() <= 2
                UC01_320a_ContactDetected.Start()
                myDoor.SetOpen(false)
            endif
        EndIf
    endif
EndEvent
