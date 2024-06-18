;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFConstantZ06_002117CA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
ObjectReference myJanet = Alias_Janet.GetRef()
myJanet.MoveTo(Alias_JanetMarker.GetRef())
myJanet.Enable()
Alias_Janet.GetActorRef().SetOutfit(Outfit_Clothes_NewAtlantis_BusinessSuit_Female)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Alias_Janet.GetActorRef().SetOutfit(Outfit_Clothes_NewAtlantis_BusinessSuit_Female)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_Janet.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Alias_Janet.GetRef().Say(FFConstantZ06_Janet_CallToPlayer)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
SetActive()

Alias_Janet.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()

If FFConstantZ04.IsCompleted()
	myPlayer.AddItem(Alias_LetterParadiso.GetRef())
EndIf
If FFConstantZ05.IsCompleted()
	myPlayer.AddItem(Alias_LetterConstant.GetRef())
EndIf

myPlayer.SetValue(FFConstantZ06_ForeknowledgeAV, 1)

SetObjectivecompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
Alias_Janet.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()
ObjectReference myLetterParadiso = Alias_LetterParadiso.GetRef()
ObjectReference myLetterConstant = Alias_LetterConstant.GetRef()

If myPlayer.GetItemCount(myLetterParadiso)
	myPlayer.RemoveItem(myLetterParadiso)
EndIf
If myPlayer.GetItemCount(myLetterConstant)
	myPlayer.RemoveItem(myLetterConstant)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_LetterParadiso Auto Const Mandatory

ReferenceAlias Property Alias_LetterConstant Auto Const Mandatory

Quest Property FFConstantZ04 Auto Const Mandatory

Quest Property FFConstantZ05 Auto Const Mandatory

ReferenceAlias Property Alias_Janet Auto Const Mandatory

ReferenceAlias Property Alias_JanetMarker Auto Const Mandatory

Topic Property FFConstantZ06_Janet_CallToPlayer Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property FFConstantZ06_Credits Auto Const Mandatory

Scene Property FFConstantZ06_0050_Janet_Approach Auto Const Mandatory

Outfit Property Outfit_Clothes_NewAtlantis_BusinessSuit_Female Auto Const Mandatory

ActorValue Property FFConstantZ06_ForeknowledgeAV Auto Const Mandatory
