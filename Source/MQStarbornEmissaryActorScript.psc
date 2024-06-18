Scriptname MQStarbornEmissaryActorScript extends Actor

ReferenceAlias Property MQ00_CompanionWhoDies Mandatory Const Auto
GlobalVariable Property MQ_EmissaryRevealed Mandatory Const Auto
GlobalVariable Property MQ_EmissaryRandom Mandatory Const Auto
Idle Property Stage2NoTransition Mandatory Const Auto
Actor[] Property CompanionArray Const Auto
Int iRandomCompanion = -1
Outfit Property Outfit_Spacesuit_Starborn_Companion_NPC_VoiceFilter Mandatory Const Auto
Armor Property SpaceSuit_Starborn_Companion_PlayerOrFollower Mandatory Const Auto
Armor Property SpaceSuit_Starborn_CompanionNPC_NOTPLAYABLE Mandatory Const Auto

Auto State WaitingForPlayer
    Event OnLoad()
        gotostate("hasbeentriggered") ;we only need to do this once
        Self.WaitFor3dLoad() ;wait for 3d to fully load
        If iRandomCompanion != -1
            ;we picked a random companion before, so pick them again
            Actor SetCompanionPicked = CompanionArray[iRandomCompanion]
            CopyAppearance(SetCompanionPicked)
            SetOverrideVoiceType(SetCompanionPicked.GetVoiceType())
        ElseIf MQ_EmissaryRandom.GetValueInt() == 1
            ;If the Emissary is randomized, pick a random companion
            iRandomCompanion = Utility.RandomInt(0, 3)
            Actor CompanionPicked = CompanionArray[iRandomCompanion]
            CopyAppearance(CompanionPicked)
            SetOverrideVoiceType(CompanionPicked.GetVoiceType())
        ElseIf MQ00_CompanionWhoDies != None
            ;if there's a specific companion who died, set to them
            Actor DeadCompanionREF = MQ00_CompanionWhoDies.GetActorRef()
            CopyAppearance(DeadCompanionREF)
        EndIf

        ;if emissary is revealed, make sure they're in an outfit with a helmet that modulates the voice
        If MQ_EmissaryRevealed.GetValueInt() >= 1
            RemoveItem(SpaceSuit_Starborn_CompanionNPC_NOTPLAYABLE)
            EquipItem(SpaceSuit_Starborn_Companion_PlayerOrFollower)
            SetOutfit(Outfit_Spacesuit_Starborn_Companion_NPC_VoiceFilter, abSleepOutfit=true)
        EndIf
    EndEvent

    Event OnUnload()
        ;do nothing
    EndEvent
EndState

State hasbeentriggered
    Event OnLoad()
        ;do nothing
    EndEvent

    Event OnUnload()
        GotoState("WaitingForPlayer") ;Copy Appearrance needs to be called once per Load since it can reset
    EndEvent
EndState