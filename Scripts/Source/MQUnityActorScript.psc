Scriptname MQUnityActorScript extends Actor

VoiceType Property UnityVoiceMale Mandatory Const Auto
VoiceType Property UnityVoiceFemale Mandatory Const Auto
VoiceType Property UnityVoiceNonBinary Mandatory Const Auto
VoiceType Property UnityVoiceNonBinary_2 Mandatory Const Auto
VisualEffect Property UnityActorEffect Mandatory Const Auto

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
        ;have this actor match the player
        Self.WaitFor3dLoad() ;wait for 3d to fully load
        CopyAppearance(PlayerREF)
        ;swap to correct voicetype based on player body type vs pronoun selection
        If PlayerBase.GetPronoun() == Pronoun_TheyThem
            If PlayerBase.GetSex() == BodyType_Feminine
                SetOverrideVoiceType(UnityVoiceNonBinary_2) ; non-binary, bodytype 2
            Else
                SetOverrideVoiceType(UnityVoiceNonBinary) ; non-binary, bodytype 1
            EndIf
        Else
            If PlayerBase.GetSex() == BodyType_Feminine
                If (PlayerBase.GetPronoun() == Pronoun_SheHer) || (PlayerBase.GetPronoun() == Pronoun_Unselected)
                    SetOverrideVoiceType(UnityVoiceFemale) 
                Else
                    SetOverrideVoiceType(UnityVoiceNonBinary_2)
                EndIf
            Else
                If (PlayerBase.GetPronoun() == Pronoun_HeHim) || (PlayerBase.GetPronoun() == Pronoun_Unselected)
                    SetOverrideVoiceType(UnityVoiceMale)
                Else
                    SetOverrideVoiceType(UnityVoiceNonBinary)
                EndIf
            EndIf
        EndIf
        UnityActorEffect.Play(Self)
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
        ;Copy Appearrance needs to be called once per Load since it can reset
        gotostate("WaitingForPlayer")
    EndEvent
EndState