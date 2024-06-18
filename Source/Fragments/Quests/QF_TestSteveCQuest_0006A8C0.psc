;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestSteveCQuest_0006A8C0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
Utility.Wait(1)
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0101_Item_00
Function Fragment_Stage_0101_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
TestIntercomDialogueNoName.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0291_Item_00
Function Fragment_Stage_0291_Item_00()
;BEGIN CODE
Utility.Wait(10)
Debug.Trace("Stage done.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
TestSteveCDoor06.SetOpen(True)
TestHostileActorRef.StartCombat(Game.GetPlayer())
TestHostileActorRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
Alias_TestSteveCLocation02.ForceLocationTo(Alias_TestSteveCLocation.GetLocation())
;Alias_TestSteveCLocation02.RefillDependentAliases()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Cell Property TestSteveCSpaceCell Auto Const Mandatory

RefCollectionAlias Property Alias_TestSpaceCellRefs Auto Const Mandatory

RefCollectionAlias Property Alias_TestSpaceCellRefs_Ship01 Auto Const Mandatory

ReferenceAlias Property Alias_TestSpaceCellRefs_Ship02 Auto Const Mandatory

Scene Property TestIntercomDialogueNoName Auto Const Mandatory

ReferenceAlias Property Alias_Blah Auto Const Mandatory

ObjectReference Property TestSteveCDoor06 Auto Const Mandatory

Actor Property TestHostileActorRef Auto Const Mandatory

LocationAlias Property Alias_TestSteveCLocation Auto Const Mandatory

LocationAlias Property Alias_TestSteveCLocation02 Auto Const Mandatory
