;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFParadisoZ04_001C38EA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
FFParadisoZ04Misc.SetStage(1000)

Game.GetPlayer().AddItem(Alias_RoomKey.GetRef())

SetObjectiveDisplayed(100)
ObjectReference myGuest = Alias_Guest.GetRef()
myGuest.MoveTo(Alias_GuestMarker.GetRef())
myGuest.Enable()
(myGuest as Actor).RemoveFromFaction(ParadisoFaction)
(myGuest as Actor).RemoveFromFaction(CrimeFactionParadiso)
(myGuest as Actor).SetNoBleedoutRecovery(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Alias_Guest.GetActorRef().EvaluatePackage()
FFParadisoZ04_0100_Guest_Greeting_Confront.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Actor myGuest = Alias_Guest.GetActorRef()
myGuest.StartCombat(Game.GetPlayer(), True)
myGuest.EvaluatePackage()

SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
Actor myGuest = Alias_Guest.GetActorRef()
myGuest.Say(FFParadisoZ04_0250_Guest_Say_Surrender)
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Actor mySecurity = Alias_Security.GetActorRef()
mySecurity.Enable()
mySecurity.EvaluatePackage()
Alias_Guest.GetActorRef().EvaluatePackage()
SetObjectiveCompleted(100)
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
Alias_Guest.GetRef().Disable()
Alias_Security.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(FFParadisoZ04_Foreknowledge_AV, 1)
FFParadisoZ04_Foreknowledge_AV
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Guest Auto Const Mandatory

Topic Property FFParadisoZ04_0250_Guest_Say_Surrender Auto Const Mandatory

Scene Property FFParadisoZ04_0100_Guest_Greeting_Confront Auto Const Mandatory

ReferenceAlias Property Alias_RoomKey Auto Const Mandatory

Quest Property FFParadisoZ04Misc Auto Const Mandatory

ReferenceAlias Property Alias_GuestMarker Auto Const Mandatory

Faction Property ParadisoFaction Auto Const Mandatory

Faction Property CrimeFactionParadiso Auto Const Mandatory

ReferenceAlias Property Alias_Security Auto Const Mandatory

ActorValue Property FFParadisoZ04_Foreknowledge_AV Auto Const Mandatory
