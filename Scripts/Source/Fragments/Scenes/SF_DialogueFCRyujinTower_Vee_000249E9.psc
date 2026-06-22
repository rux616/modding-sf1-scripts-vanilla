;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DialogueFCRyujinTower_Vee_000249E9 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
Int DataCount = PlayerRef.GetItemCount(DR017_ValuableData01)
Float fDemandedHighPrice = DR017_DemandedHighPrice.GetValue()

If fDemandedHighPrice == 1
     PlayerREF.AddItem(Credits, (DataCount * DR017_DataCreditsHigh.GetValueInt()))
Else
     PlayerREF.AddItem(Credits, (DataCount * DR017_DataCredits.GetValueInt()))
EndIf

PlayerREF.RemoveItem(DR017_ValuableData01, DataCount)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DR017_DataCredits Auto Const Mandatory

GlobalVariable Property DR017_DataCreditsHigh Auto Const Mandatory

GlobalVariable Property DR017_DemandedHighPrice Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Book Property DR017_ValuableData01 Auto Const Mandatory
