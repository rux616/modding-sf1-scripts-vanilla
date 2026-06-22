Scriptname CF05_TransportDoorAliasScript extends ReferenceAlias
{Script to display objectives to find keys for locked doors leading to the different sections of SY-920.}

Key Property KeyToCheck Auto Const Mandatory
{The key required to unlock the door.}

Int Property iHasKeyStage Auto Const Mandatory
{The stage to set when elevator is activated.}

Int Property iNoKeyStage Auto Const Mandatory
{The stage to set to display the objective to find the key.}

Event OnActivate(ObjectReference akActionRef)

    ObjectReference PlayerRef = Game.GetPlayer()

    If akActionRef == PlayerRef && PlayerRef.GetItemCount(KeyToCheck) <= 0
        GetOwningQuest().SetStage(iNoKeyStage)
    ElseIf akActionRef == PlayerRef
        GetOwningQuest().SetStage(iHasKeyStage)
    EndIf

EndEvent