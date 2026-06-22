;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFBGS00DDR010_TrainingCou_01016C80 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Location CurrentLocation = Game.GetPlayer().GetCurrentLocation()
Alias_Location.ForceLocationTo(CurrentLocation)
Alias_Location.RefillDependentAliases()

Alias_Trainee.GetRef().SetLinkedRef(Alias_MovePoint01.GetRef(), TravelKeyword)
Alias_Trainee.GetRef().SetLinkedRef(Alias_TargetPoint01_01.GetRef(), TargetKeyword01)
Alias_Trainee.GetRef().SetLinkedRef(Alias_TargetPoint01_02.GetRef(), TargetKeyword02)

Scene01.Start()

Alias_Trainee.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_Trainee.GetRef().SetLinkedRef(Alias_MovePoint02.GetRef(), TravelKeyword)
Alias_Trainee.GetRef().SetLinkedRef(Alias_TargetPoint02_01.GetRef(), TargetKeyword01)
Alias_Trainee.GetRef().SetLinkedRef(Alias_TargetPoint02_02.GetRef(), TargetKeyword02)

Scene01.Stop()
Scene02.Start()

Alias_Trainee.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Alias_Trainee.GetRef().SetLinkedRef(Alias_MovePoint03.GetRef(), TravelKeyword)
Alias_Trainee.GetRef().SetLinkedRef(Alias_TargetPoint03_01.GetRef(), TargetKeyword01)
Alias_Trainee.GetRef().SetLinkedRef(none, TargetKeyword02)
Alias_Trainee.GetRef().SetLinkedRef(none, TargetKeyword03)

Scene02.Stop()
Scene03.Start()

Alias_Trainee.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Alias_Trainee.GetRef().SetLinkedRef(Alias_MovePoint04.GetRef(), TravelKeyword)
Alias_Trainee.GetRef().SetLinkedRef(Alias_TargetPoint04_01.GetRef(), TargetKeyword01)
Alias_Trainee.GetRef().SetLinkedRef(none, TargetKeyword02)
Alias_Trainee.GetRef().SetLinkedRef(none, TargetKeyword03)

Scene03.Stop()
Scene04.Start()

Alias_Trainee.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_Trainee.GetRef().SetLinkedRef(Alias_MovePoint05.GetRef(), TravelKeyword)
Alias_Trainee.GetRef().SetLinkedRef(Alias_TargetPoint05_01.GetRef(), TargetKeyword01)
Alias_Trainee.GetRef().SetLinkedRef(none, TargetKeyword02)
Alias_Trainee.GetRef().SetLinkedRef(none, TargetKeyword03)

Scene04.Stop()
Scene05.Start()

Alias_Trainee.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Alias_Trainee.GetRef().SetLinkedRef(Alias_MovePoint06.GetRef(), TravelKeyword)
Alias_Trainee.GetRef().SetLinkedRef(Alias_TargetPoint06_01.GetRef(), TargetKeyword01)
Alias_Trainee.GetRef().SetLinkedRef(none, TargetKeyword02)
Alias_Trainee.GetRef().SetLinkedRef(none, TargetKeyword03)

Scene05.Stop()
Scene06.Start()

Alias_Trainee.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
Alias_Trainee.GetRef().SetLinkedRef(Alias_MovePoint07.GetRef(), TravelKeyword)
Alias_Trainee.GetRef().SetLinkedRef(Alias_TargetPoint07_01.GetRef(), TargetKeyword01)
Alias_Trainee.GetRef().SetLinkedRef(none, TargetKeyword02)
Alias_Trainee.GetRef().SetLinkedRef(none, TargetKeyword03)

Scene06.Stop()
Scene07.Start()

Alias_Trainee.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
Alias_Trainee.GetRef().SetLinkedRef(Alias_MovePoint08.GetRef(), TravelKeyword)
Alias_Trainee.GetRef().SetLinkedRef(Alias_TargetPoint08_01.GetRef(), TargetKeyword01)
Alias_Trainee.GetRef().SetLinkedRef(none, TargetKeyword02)
Alias_Trainee.GetRef().SetLinkedRef(none, TargetKeyword03)

Scene07.Stop()
Scene08.Start()

Alias_Trainee.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
Alias_Trainee.GetRef().SetLinkedRef(Alias_MovePoint09.GetRef(), TravelKeyword)
Alias_Trainee.GetRef().SetLinkedRef(Alias_TargetPoint09_01.GetRef(), TargetKeyword01)
Alias_Trainee.GetRef().SetLinkedRef(Alias_TargetPoint09_02.GetRef(), TargetKeyword02)
Alias_Trainee.GetRef().SetLinkedRef(none, TargetKeyword03)

Scene08.Stop()
Scene09.Start()

Alias_Trainee.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_Trainee.GetRef().SetLinkedRef(Alias_MovePoint10.GetRef(), TravelKeyword)
Alias_Trainee.GetRef().SetLinkedRef(Alias_TargetPoint10_01.GetRef(), TargetKeyword01)
Alias_Trainee.GetRef().SetLinkedRef(Alias_TargetPoint10_02.GetRef(), TargetKeyword02)
Alias_Trainee.GetRef().SetLinkedRef(Alias_TargetPoint10_03.GetRef(), TargetKeyword03)

Scene09.Stop()
Scene10.Start()

Alias_Trainee.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Alias_Trainee.GetRef().SetLinkedRef(Alias_MovePoint11.GetRef(), TravelKeyword)
Alias_Trainee.GetRef().SetLinkedRef(Alias_TargetPoint11_01.GetRef(), TargetKeyword01)
Alias_Trainee.GetRef().SetLinkedRef(Alias_TargetPoint11_02.GetRef(), TargetKeyword02)
Alias_Trainee.GetRef().SetLinkedRef(Alias_TargetPoint11_03.GetRef(), TargetKeyword03)

Scene10.Stop()
Scene11.Start()

Alias_Trainee.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
Alias_Trainee.GetRef().SetLinkedRef(Alias_MovePoint12.GetRef(), TravelKeyword)
Alias_Trainee.GetRef().SetLinkedRef(none, TargetKeyword01)
Alias_Trainee.GetRef().SetLinkedRef(none, TargetKeyword02)
Alias_Trainee.GetRef().SetLinkedRef(none, TargetKeyword03)

Scene11.Stop()
Scene12.Start()

Alias_Trainee.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
Alias_Trainee.GetRef().SetLinkedRef(none, TravelKeyword)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Trainee Auto Const Mandatory

ReferenceAlias Property Alias_MovePoint01 Auto Const Mandatory

ReferenceAlias Property Alias_MovePoint02 Auto Const Mandatory

ReferenceAlias Property Alias_MovePoint03 Auto Const Mandatory

ReferenceAlias Property Alias_MovePoint04 Auto Const Mandatory

ReferenceAlias Property Alias_MovePoint05 Auto Const Mandatory

ReferenceAlias Property Alias_MovePoint06 Auto Const Mandatory

ReferenceAlias Property Alias_MovePoint07 Auto Const Mandatory

ReferenceAlias Property Alias_MovePoint08 Auto Const Mandatory

ReferenceAlias Property Alias_MovePoint09 Auto Const Mandatory

ReferenceAlias Property Alias_MovePoint10 Auto Const Mandatory

ReferenceAlias Property Alias_MovePoint11 Auto Const Mandatory

ReferenceAlias Property Alias_MovePoint12 Auto Const Mandatory

ReferenceAlias Property Alias_TargetPoint01_01 Auto Const Mandatory

ReferenceAlias Property Alias_TargetPoint01_02 Auto Const Mandatory

ReferenceAlias Property Alias_TargetPoint02_01 Auto Const Mandatory

ReferenceAlias Property Alias_TargetPoint02_02 Auto Const Mandatory

ReferenceAlias Property Alias_TargetPoint03_01 Auto Const Mandatory

ReferenceAlias Property Alias_TargetPoint04_01 Auto Const Mandatory

ReferenceAlias Property Alias_TargetPoint05_01 Auto Const Mandatory

ReferenceAlias Property Alias_TargetPoint06_01 Auto Const Mandatory

ReferenceAlias Property Alias_TargetPoint07_01 Auto Const Mandatory

ReferenceAlias Property Alias_TargetPoint08_01 Auto Const Mandatory

ReferenceAlias Property Alias_TargetPoint09_01 Auto Const Mandatory

ReferenceAlias Property Alias_TargetPoint09_02 Auto Const Mandatory

ReferenceAlias Property Alias_TargetPoint10_01 Auto Const Mandatory

ReferenceAlias Property Alias_TargetPoint10_02 Auto Const Mandatory

ReferenceAlias Property Alias_TargetPoint10_03 Auto Const Mandatory

ReferenceAlias Property Alias_TargetPoint11_01 Auto Const Mandatory

ReferenceAlias Property Alias_TargetPoint11_02 Auto Const Mandatory

Keyword Property TravelKeyword Auto Const

Keyword Property TargetKeyword01 Auto Const

Keyword Property TargetKeyword02 Auto Const

Keyword Property TargetKeyword03 Auto Const

ObjectReference Property actorRef Auto Const



LocationAlias Property Alias_Location Auto Const

Scene Property Scene01 Auto Const

Scene Property Scene02 Auto Const

Scene Property Scene03 Auto Const

Scene Property Scene05 Auto Const

Scene Property Scene04 Auto Const

Scene Property Scene06 Auto Const

Scene Property Scene07 Auto Const

Scene Property Scene08 Auto Const

Scene Property Scene09 Auto Const

Scene Property Scene10 Auto Const

Scene Property Scene11 Auto Const

Scene Property Scene12 Auto Const

ReferenceAlias Property Alias_TargetPoint11_03 Auto Const
