Scriptname OtherPlayerAliasScript extends ReferenceAlias

VoiceType Property NPCFOtherPlayer Mandatory Const Auto
VoiceType Property NPCMOtherPlayer Mandatory Const Auto
VoiceType Property NPCXOtherPlayer Mandatory Const Auto
VoiceType Property NPCXOtherPlayer_2 Mandatory Const Auto
Idle Property Stage2 Mandatory Const Auto
Idle Property Stage3 Mandatory Const Auto

Int Pronoun_Unselected = 0 Const
Int Pronoun_HeHim = 1 Const
Int Pronoun_SheHer = 2 Const
Int Pronoun_TheyThem = 3 Const

Int BodyType_Masculine = 0 Const
Int BodyType_Feminine = 1 Const

Auto State WaitingForPlayer
    Event OnLoad()
        gotostate("hasbeentriggered") ;we only need to do this once
        Actor PlayerREF = Game.GetPlayer()
        ActorBase PlayerBase = PlayerREF.GetBaseObject() as ActorBase
        Actor SelfREF = Self.GetActorRef()
        ;have this actor match the player
        SelfREF.WaitFor3dLoad() ;wait for 3d to fully load
        SelfREF.CopyAppearance(PlayerREF)
        ;swap to correct voicetype based on player body type vs pronoun selection
        If PlayerBase.GetPronoun() == Pronoun_TheyThem
            If PlayerBase.GetSex() == BodyType_Feminine
                SelfREF.SetOverrideVoiceType(NPCXOtherPlayer_2) ; non-binary, bodytype 2
            Else
                SelfREF.SetOverrideVoiceType(NPCXOtherPlayer) ; non-binary, bodytype 1
            EndIf
        Else
            If PlayerBase.GetSex() == BodyType_Feminine
                If (PlayerBase.GetPronoun() == Pronoun_SheHer) || (PlayerBase.GetPronoun() == Pronoun_Unselected)
                    SelfREF.SetOverrideVoiceType(NPCFOtherPlayer) 
                Else
                    SelfREF.SetOverrideVoiceType(NPCXOtherPlayer_2)
                EndIf
            Else
                If (PlayerBase.GetPronoun() == Pronoun_HeHim) || (PlayerBase.GetPronoun() == Pronoun_Unselected)
                    SelfREF.SetOverrideVoiceType(NPCMOtherPlayer)
                Else
                    SelfREF.SetOverrideVoiceType(NPCXOtherPlayer)
                EndIf
            EndIf
        EndIf

        Self.GetActorRef().PlayIdle(Stage2)
        Utility.Wait(2.0)
        Self.GetActorRef().PlayIdle(Stage3)
    EndEvent

    Event OnUnload()
        ;do nothing
    EndEvent
EndState

State hasbeentriggered
    Event OnLoad()
        Self.GetActorRef().PlayIdle(Stage2)
        Utility.Wait(2.0)
        Self.GetActorRef().PlayIdle(Stage3)
    EndEvent

    Event OnUnload()
        GotoState("WaitingForPlayer") ;Copy Appearrance needs to be called once per Load since it can reset
    EndEvent
EndState