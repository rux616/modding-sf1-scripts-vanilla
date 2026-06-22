;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Terminals:TERM_SFFL_AnchorpointSH_Clue_0107DCA2 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_02
Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
;BEGIN CODE
If ClueGlobal1.GetValue() < 1
If Game.GetPlayer().GetItemCount(RiddleReminder) > 0
Game.GetPlayer().RemoveItem(RiddleReminder, 1, abSilent=true)
If Game.GetPlayer().GetItemCount(RiddleReminder1) < 1
Game.GetPlayer().AddAliasedItem(RiddleReminder1, ClueReminderAlias1, 1, abSilent=true)
RiddleReminderMSG.Show()
EndIf
EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_03
Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
;BEGIN CODE
Safe.Lock(false)
ClueReminderAlias5.Clear()
ClueReminderQuest.Stop()
Wwise_Safe_Unlock.Play(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_04
Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
;BEGIN CODE
If ClueGlobal2.GetValue() < 1
If Game.GetPlayer().GetItemCount(RiddleReminder) > 0 || Game.GetPlayer().GetItemCount(RiddleReminder1) > 0
Game.GetPlayer().RemoveItem(RiddleReminder, 1, abSilent=true)
Game.GetPlayer().RemoveItem(RiddleReminder1, 1, abSilent=true)
If Game.GetPlayer().GetItemCount(RiddleReminder2) < 1
Game.GetPlayer().AddAliasedItem(RiddleReminder2, ClueReminderAlias2, 1, abSilent=true)
RiddleReminderMSG.Show()
EndIf
EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_05
Function Fragment_TerminalMenu_05(ObjectReference akTerminalRef)
;BEGIN CODE
If ClueGlobal3.GetValue() < 1
If Game.GetPlayer().GetItemCount(RiddleReminder) > 0 || Game.GetPlayer().GetItemCount(RiddleReminder1) > 0 || Game.GetPlayer().GetItemCount(RiddleReminder2) > 0
Game.GetPlayer().RemoveItem(RiddleReminder, 1, abSilent=true)
Game.GetPlayer().RemoveItem(RiddleReminder1, 1, abSilent=true)
Game.GetPlayer().RemoveItem(RiddleReminder2, 1, abSilent=true)
If Game.GetPlayer().GetItemCount(RiddleReminder3) < 1
Game.GetPlayer().AddAliasedItem(RiddleReminder3, ClueReminderAlias3, 1, abSilent=true)
RiddleReminderMSG.Show()
EndIf
EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_06
Function Fragment_TerminalMenu_06(ObjectReference akTerminalRef)
;BEGIN CODE
If ClueGlobal4.GetValue() < 1
If Game.GetPlayer().GetItemCount(RiddleReminder) > 0 || Game.GetPlayer().GetItemCount(RiddleReminder1) > 0 || Game.GetPlayer().GetItemCount(RiddleReminder2) > 0 || Game.GetPlayer().GetItemCount(RiddleReminder3) > 0
Game.GetPlayer().RemoveItem(RiddleReminder, 1, abSilent=true)
Game.GetPlayer().RemoveItem(RiddleReminder1, 1, abSilent=true)
Game.GetPlayer().RemoveItem(RiddleReminder2, 1, abSilent=true)
Game.GetPlayer().RemoveItem(RiddleReminder3, 1, abSilent=true)
If Game.GetPlayer().GetItemCount(RiddleReminder4) < 1
Game.GetPlayer().AddAliasedItem(RiddleReminder4, ClueReminderAlias4, 1, abSilent=true)
RiddleReminderMSG.Show()
EndIf
EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_07
Function Fragment_TerminalMenu_07(ObjectReference akTerminalRef)
;BEGIN CODE
If ClueGlobal5.GetValue() < 1
If Game.GetPlayer().GetItemCount(RiddleReminder) > 0 || Game.GetPlayer().GetItemCount(RiddleReminder1) > 0 || Game.GetPlayer().GetItemCount(RiddleReminder2) > 0 || Game.GetPlayer().GetItemCount(RiddleReminder3) > 0 || Game.GetPlayer().GetItemCount(RiddleReminder4) > 0
Game.GetPlayer().RemoveItem(RiddleReminder, 1, abSilent=true)
Game.GetPlayer().RemoveItem(RiddleReminder1, 1, abSilent=true)
Game.GetPlayer().RemoveItem(RiddleReminder2, 1, abSilent=true)
Game.GetPlayer().RemoveItem(RiddleReminder3, 1, abSilent=true)
Game.GetPlayer().RemoveItem(RiddleReminder4, 1, abSilent=true)
If Game.GetPlayer().GetItemCount(RiddleReminder5) < 1
Game.GetPlayer().AddAliasedItem(RiddleReminder5, ClueReminderAlias5, 1, abSilent=true)
RiddleReminderMSG.Show()
EndIf
EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_08
Function Fragment_TerminalMenu_08(ObjectReference akTerminalRef)
;BEGIN CODE
If (Game.GetPlayer().GetItemCount(RiddleReminder) < 1)
ClueReminderQuest.Start()
Game.GetPlayer().AddAliasedItem(RiddleReminder, ClueReminderAlias, 1)
ClueReminderInitialMSG.Show()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property Safe Auto Const

Book Property RiddleReminder Auto Const

Book Property RiddleReminder1 Auto Const

Book Property RiddleReminder2 Auto Const

Book Property RiddleReminder3 Auto Const

Book Property RiddleReminder4 Auto Const

Book Property RiddleReminder5 Auto Const

Message Property RiddleReminderMSG Auto Const

Key Property ClueKey1 Auto Const

Key Property ClueKey2 Auto Const

Key Property ClueKey3 Auto Const

Key Property ClueKey4 Auto Const

Key Property ClueKey5 Auto Const

GlobalVariable Property ClueGlobal1 Auto Const

GlobalVariable Property ClueGlobal2 Auto Const

GlobalVariable Property ClueGlobal3 Auto Const

GlobalVariable Property ClueGlobal4 Auto Const

GlobalVariable Property ClueGlobal5 Auto Const

ReferenceAlias Property ClueReminderAlias Auto Const

ReferenceAlias Property ClueReminderAlias1 Auto Const

ReferenceAlias Property ClueReminderAlias2 Auto Const

ReferenceAlias Property ClueReminderAlias3 Auto Const

ReferenceAlias Property ClueReminderAlias4 Auto Const

ReferenceAlias Property ClueReminderAlias5 Auto Const

Quest Property ClueReminderQuest Auto Const

Message Property ClueReminderInitialMSG Auto Const

WwiseEvent Property Wwise_Safe_Unlock Auto Const
