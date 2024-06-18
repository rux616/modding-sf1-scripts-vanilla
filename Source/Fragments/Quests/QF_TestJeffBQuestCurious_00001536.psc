;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestJeffBQuestCurious_00001536 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
ApproachScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_myActor.getActorRef().PlayIdleWithTarget(myPairedIdle, Game.GetPlayer())
Utility.wait(8.0)
Alias_myActor.getActorRef().PlayIdle(myIdle)
;AfterwardsScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_myDog1.getActorRef().stopCombat()
Alias_myDog2.getActorRef().stopCombat()
;ApproachToMournScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
Alias_myDog1.getActorRef().PlayIdle(myIdle2)
Alias_myDog2.getActorRef().PlayIdle(myIdle2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property ApproachScene Auto Const

ReferenceAlias Property Alias_myActor Auto Const Mandatory

Idle Property myPairedIdle Auto Const

Idle Property myIdle Auto Const

Scene Property AfterwardsScene Auto Const

Idle Property myIdle2 Auto Const

ReferenceAlias Property Alias_myDog1 Auto Const Mandatory

ReferenceAlias Property Alias_myDog2 Auto Const Mandatory

Scene Property ApproachToMournScene Auto Const
