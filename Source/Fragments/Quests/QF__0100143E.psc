;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__0100143E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
PSE_Raid01a_HailingScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_Attackers.RemoveFromFaction(PlayerFriendFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
int i = 0

Alias_Attackers.EvaluateAll()
utility.wait(14)

while (i < Alias_Attackers.GetCount())
    (Alias_Attackers.GetAt(i) as SpaceshipReference).DisableWithGravJumpNoWait()
    utility.wait(utility.randomfloat(0.2,3.9))
    i = i+1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Ship01 Auto Const Mandatory

ReferenceAlias Property Alias_Ship02 Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Faction Property PlayerFriendFaction Auto Const Mandatory

RefCollectionAlias Property Alias_Attackers Auto Const Mandatory

Scene Property PSE_Raid01a_HailingScene Auto Const Mandatory
