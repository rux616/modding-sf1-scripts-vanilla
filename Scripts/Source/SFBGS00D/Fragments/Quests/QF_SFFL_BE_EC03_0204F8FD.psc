;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_BE_EC03_0204F8FD Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Open the main door
Alias_MainShopDoor.GetRef().SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Make sure Bobby and Fanisha's package is updated
Alias_Bobby.GetActorRef().EvaluatePackage()
Alias_Fanisha.GetActorRef().EvaluatePackage()

;Check to see if main door is open, if not open it
ObjectReference mainDoor = Alias_MainShopDoor.GetRef()
int openState = mainDoor.GetOpenState()
if (openState != 1 && openState != 2)
    mainDoor.SetOpen()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
SpaceEncounter.SetStage(350)
Actor Bobby = Alias_Bobby.GetActorRef() as Actor
int BobbyTrust = Bobby.GetValue(VendorTrust) as int

if (BobbyTrust > 0)
    SFFL_BE_EC03_55_Bobby_Greeting_Short.Start()
else
    Scene_55_Bobby_Greeting.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SpaceEncounter.SetStage(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Alias_SelfDestructAlarm.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Reset()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Bobby Auto Const Mandatory

ActorValue Property VendorTrust Auto Const Mandatory

ReferenceAlias Property Alias_MainShopDoor Auto Const Mandatory

ReferenceAlias Property Alias_Fanisha Auto Const Mandatory

Scene Property Scene_55_Bobby_Greeting Auto Const Mandatory

Quest Property SpaceEncounter Auto Const Mandatory

Scene Property SFFL_BE_EC03_55_Bobby_Greeting_Short Auto Const Mandatory

Scene Property SelfDestructAlarmScene Auto Const Mandatory

ReferenceAlias Property Alias_SelfDestructAlarm Auto Const Mandatory
