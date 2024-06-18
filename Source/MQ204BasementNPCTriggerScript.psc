Scriptname MQ204BasementNPCTriggerScript extends ReferenceAlias

Int Property PreReqStage=110 Const Auto
Int Property PostStage=127 Const Auto
ReferenceAlias Property Noel Mandatory Const Auto
ReferenceAlias Property CompanionAtLodge Mandatory Const Auto
ReferenceAlias Property WalterStroud Mandatory Const Auto
ReferenceAlias Property Vasco Mandatory Const Auto
ReferenceAlias Property MatteoKhatri Mandatory Const Auto
ReferenceAlias Property CoraCoe Mandatory Const Auto
ObjectReference Property MQ204_NoelWellEscort_Marker Mandatory Const Auto
ObjectReference Property MQ204_RunMarker_Walter02 Mandatory Const Auto
ObjectReference Property MQ204_RunMarker_Companion02 Mandatory Const Auto
ObjectReference Property MQ204_RunMarker_Vasco02 Mandatory Const Auto
ObjectReference Property MQ204_RunMarker_Matteo02 Mandatory Const Auto
ObjectReference Property MQ204_RunMarker_Cora02 Mandatory Const Auto
Bool CompanionMoved
Bool WalterMoved
Bool VascoMoved
Bool MatteoMoved
Bool CoraMoved

Event OnTriggerEnter(ObjectReference akActionRef)
    Quest myQuest = GetOwningQuest()
    If myQuest.GetStageDone(PreReqStage)  && !myQuest.GetStageDone(PostStage)
        If akActionRef == Noel.GetActorRef()
            ;akActionRef.moveto(MQ204_NoelWellEscort_Marker)
        ElseIf akActionRef == CompanionAtLodge.GetActorRef() && !CompanionMoved
            CompanionMoved = True
            akActionRef.moveto(MQ204_RunMarker_Companion02)
        ElseIf akActionRef == WalterStroud.GetActorRef() && !WalterMoved
            WalterMoved = True
            akActionRef.Moveto(MQ204_RunMarker_Walter02)
        ElseIf akActionRef == Vasco.GetActorRef() && !VascoMoved
            VascoMoved = True
            akActionRef.MoveTo(MQ204_RunMarker_Vasco02)
        ElseIf akActionRef == MatteoKhatri.GetActorRef() && !MatteoMoved
            MatteoMoved = True
            akActionRef.moveto(MQ204_RunMarker_Matteo02)
        ElseIf akActionRef == CoraCoe.GetActorRef() && !CoraMoved
            CoraMoved = True
            akActionRef.moveto(MQ204_RunMarker_Cora02)
        EndIf
    EndIF
EndEvent