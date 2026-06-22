Scriptname SFBGS00D:SFFLMS03MilliwhaleColorScript extends Quest
{Handles swapping milliwhale color palette}

Armor Property SFFL_Skin_Critter_MilliwhaleDesert auto const mandatory
Armor Property SFFL_Skin_Critter_MilliwhaleForest auto const mandatory
Armor Property SFFL_Skin_Critter_MilliwhaleVolcano auto const mandatory
Armor Property SFFL_Skin_Critter_MilliwhaleAlbino auto const mandatory
ReferenceAlias Property Milliwhale auto const mandatory
WwiseEvent Property SFBGS00D_WwiseEvent_NPC_Milliwhale_Skin_Swap auto const mandatory
GlobalVariable Property SFFL_OutpostMilliwhaleSkin auto const mandatory

Function SwapCommon()
    SFBGS00D_WwiseEvent_NPC_Milliwhale_Skin_Swap.Play(Milliwhale.GetActorRef())
    Milliwhale.GetActorRef().UnequipItem(SFFL_Skin_Critter_MilliwhaleAlbino)
    Milliwhale.GetActorRef().UnequipItem(SFFL_Skin_Critter_MilliwhaleDesert)
    Milliwhale.GetActorRef().UnequipItem(SFFL_Skin_Critter_MilliwhaleForest)
    Milliwhale.GetActorRef().UnequipItem(SFFL_Skin_Critter_MilliwhaleVolcano)
    SFFL_OutpostMilliwhaleSkin.SetValue(0)
EndFunction



Function SwapAlbino()
    SFBGS00D_WwiseEvent_NPC_Milliwhale_Skin_Swap.Play(Milliwhale.GetActorRef())
    Milliwhale.GetActorRef().EquipItem(SFFL_Skin_Critter_MilliwhaleAlbino)
    SFFL_OutpostMilliwhaleSkin.SetValue(1)
EndFunction

Function SwapDesert()
    SFBGS00D_WwiseEvent_NPC_Milliwhale_Skin_Swap.Play(Milliwhale.GetActorRef())
    Milliwhale.GetActorRef().EquipItem(SFFL_Skin_Critter_MilliwhaleDesert)
    SFFL_OutpostMilliwhaleSkin.SetValue(2)
EndFunction

Function SwapVolcano()
    SFBGS00D_WwiseEvent_NPC_Milliwhale_Skin_Swap.Play(Milliwhale.GetActorRef())
    Milliwhale.GetActorRef().EquipItem(SFFL_Skin_Critter_MilliwhaleVolcano)
    SFFL_OutpostMilliwhaleSkin.SetValue(3)
EndFunction

Function SwapForest()
    SFBGS00D_WwiseEvent_NPC_Milliwhale_Skin_Swap.Play(Milliwhale.GetActorRef())
    Milliwhale.GetActorRef().EquipItem(SFFL_Skin_Critter_MilliwhaleForest)
    SFFL_OutpostMilliwhaleSkin.SetValue(4)
EndFunction