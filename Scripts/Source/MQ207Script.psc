Scriptname MQ207Script extends Quest

InputEnableLayer Property MQ207EnableLayer Auto Hidden

ReferenceAlias Property Hunter Mandatory Const Auto
VoiceType Property NPCMKeeperAquilus Mandatory Const Auto
VoiceType Property StarbornNPCMHunter Mandatory Const Auto
Idle Property Stage1 Mandatory Const Auto
Idle Property Stage2 Mandatory Const Auto
Idle Property Stage3 Mandatory Const Auto
Idle Property Stage4 Mandatory Const Auto
WWiseEvent Property WwiseEvent_QST_MQ207_StarbornHelmetTransition Mandatory Const Auto

Actor[] Property FollowersToldtoWait Auto

Function SwitchToAquilus()
    ;change voicetype and player visor anims
    Actor HunterREF = Hunter.GetActorRef()
    HunterRef.SetOverrideVoiceType(NPCMKeeperAquilus)
    HunterRef.PlayIdle(Stage3)
    WwiseEvent_QST_MQ207_StarbornHelmetTransition.Play(HunterREF)
EndFunction

Function SwitchToHunter()
    ;change voicetype and player visor anims
    Actor HunterREF = Hunter.GetActorRef()
    HunterRef.SetOverrideVoiceType(StarbornNPCMHunter)
    HunterRef.PlayIdle(Stage4)
    WwiseEvent_QST_MQ207_StarbornHelmetTransition.Play(HunterREF)
EndFunction