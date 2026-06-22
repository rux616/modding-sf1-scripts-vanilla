;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CFKey_00297E3A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Close the CF02 Security Doors.
int i = 0
int count = Alias_CF02SecurityDoors.GetCount()
While (i < count)
     Alias_CF02SecurityDoors.GetAt(i).SetOpen(False)
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Set by: Startup
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Open the CF02 Security Doors.
int i = 0
int count = Alias_CF02SecurityDoors.GetCount()
While (i < count)
     Alias_CF02SecurityDoors.GetAt(i).SetOpen(True)
     i = i + 1
EndWhile

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_CF02SecurityDoors Auto Const Mandatory

ActorValue Property Health Auto Const Mandatory
