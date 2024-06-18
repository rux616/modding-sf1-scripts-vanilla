;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_ZW11_000518F0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
PSE_Global_Player_ZW12_RevengeEncounters.Mod(1)

utility.wait(7)

int i = 0

while (i < Alias_AttackersRC.GetCount())
    (Alias_AttackersRC.GetAt(i) as SpaceshipReference).EnableWithGravJumpNoWait()
    utility.wait(utility.randomfloat(0.2,3.9))
    i = i+1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property PSE_Global_Player_ZW12_RevengeEncounters Auto Const Mandatory

RefCollectionAlias Property Alias_AttackersRC Auto Const Mandatory
