Scriptname MQ201BScript extends Quest

ObjectReference AndrejaHomeMarker
ObjectReference BarrettHomeMarker
ObjectReference SamHomeMarker
ObjectReference CoraHomeMarker
ObjectReference SarahHomeMarker

Faction Property AvailableCompanionFaction Mandatory Const Auto
Keyword Property LinkHome Mandatory Const Auto
ObjectReference Property EyeHomeMarker Mandatory Const Auto

ReferenceAlias Property Andreja Mandatory Const Auto
ReferenceAlias Property Barrett Mandatory Const Auto
ReferenceAlias Property SamCoe Mandatory Const Auto
ReferenceAlias Property CoraCoe Mandatory Const Auto
ReferenceAlias Property SarahMorgan Mandatory Const Auto

GlobalVariable Property COM_CompanionID_Andreja Mandatory Const Auto
GlobalVariable Property COM_CompanionID_Barrett Mandatory Const Auto
GlobalVariable Property COM_CompanionID_SamCoe Mandatory Const Auto
GlobalVariable Property COM_CompanionID_SarahMorgan Mandatory Const Auto

GlobalVariable Property MQ_CompanionAtEye Mandatory Const Auto
GlobalVariable Property MQ_CompanionAtLodge Mandatory Const Auto

ReferenceAlias Property MQ00_CompanionAtEye Mandatory Const Auto
ReferenceAlias Property MQ00_CompanionAtLodge Mandatory Const Auto

Quest Property SQ_Companions Mandatory Const Auto

ActorValue Property COM_AffinityLevel Mandatory Const Auto
ActorValue Property COM_Affinity Mandatory Const Auto

Function SetCompanionsAtRisk()

    CompanionActorScript[] CompanionActorArray = new CompanionActorScript[4]
    ;the initial sort of the array should be in the relative order you get the companions, mainly for testing when they're all at 0 affinity
    CompanionActorArray[0] = SarahMorgan.GetActorRef() as CompanionActorScript
    CompanionActorArray[1] = SamCoe.GetActorRef() as CompanionActorScript
    CompanionActorArray[2] = Barrett.GetActorRef() as CompanionActorScript
    CompanionActorArray[3] = Andreja.GetActorRef() as CompanionActorScript

    ;use the companion function to return an array sorted by highest affinity levels
    (SQ_Companions as SQ_CompanionsScript).SortCompanionArrayByAffinity(CompanionActorArray, ExcludeLockedInCompanion = true)

    ;highest affinity goes to the Eye, second highest goes to the Lodge
    SetCompanionAtEye(CompanionActorArray[0])
    SetCompanionAtLodge(CompanionActorArray[1])
EndFunction

Function SetCompanionAtEye(CompanionActorScript Companion)
    MQ00_CompanionAtEye.ForceRefTo(Companion)
    Companion.SetGlobalToCompanionID(MQ_CompanionAtEye)
EndFunction

Function SetCompanionAtLodge(CompanionActorScript Companion)
    MQ00_CompanionAtLodge.ForceRefTo(Companion)
    Companion.SetGlobalToCompanionID(MQ_CompanionAtLodge)
EndFunction

Function SetCompanionsHomeLink()
    ;set the Companion's new Home to be the Eye. Store original home locations for resetting later
    Actor AndrejaREF = Andreja.GetActorRef()
    Actor BarrettREF = Barrett.GetActorRef()
    Actor SamCoeREF = SamCoe.GetActorRef()
    Actor SarahMorganREF = SarahMorgan.GetActorRef()
    Actor CoraCoeREF = CoraCoe.GetActorRef()

    AndrejaHomeMarker = AndrejaREF.GetLinkedRef(LinkHome)
    BarrettHomeMarker = BarrettREF.GetLinkedRef(LinkHome)
    SamHomeMarker = SamCoeREF.GetLinkedRef(LinkHome)
    CoraHomeMarker = CoraCoeREF.GetLinkedRef(LinkHome)
    SarahHomeMarker = SarahMorganREF.GetLinkedRef(LinkHome)

    AndrejaREF.SetLinkedRef(EyeHomeMarker, LinkHome)
    BarrettREF.SetLinkedRef(EyeHomeMarker, LinkHome)
    SamCoeREF.SetLinkedRef(EyeHomeMarker, LinkHome)
    SarahMorganREF.SetLinkedRef(EyeHomeMarker, LinkHome)
    CoraCoeREF.SetLinkedRef(EyeHomeMarker, LinkHome)
EndFunction

Function ResetCompanionsHomeLink()
    Actor AndrejaREF = Andreja.GetActorRef()
    Actor BarrettREF = Barrett.GetActorRef()
    Actor SamCoeREF = SamCoe.GetActorRef()
    Actor SarahMorganREF = SarahMorgan.GetActorRef()
    Actor CoraCoeREF = CoraCoe.GetActorRef()

    AndrejaREF.SetLinkedRef(AndrejaHomeMarker, LinkHome)
    BarrettREF.SetLinkedRef(BarrettHomeMarker, LinkHome)
    SamCoeREF.SetLinkedRef(SamHomeMarker, LinkHome)
    SarahMorganREF.SetLinkedRef(SarahHomeMarker, LinkHome)
    CoraCoeREF.SetLinkedRef(CoraHomeMarker, LinkHome)
EndFunction