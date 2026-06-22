;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS003:Fragments:Quests:QF_Patch_Update08_SFBGS003_FD00FA02 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_01
Function Fragment_Stage_0000_Item_01()
;BEGIN CODE
Actor BountyRef = Alias_WantedDead.GetActorRef()
if BountyRef.IsDead()
    SFBGS003_MB_EliteBounty01_WantedDead.SetStage(700)
else
    BountyRef.AddKeyword(SFBGS003_Keyword_WantedDead)
    BountyRef.RemoveKeyword(SFBGS003_Keyword_WantedAlive)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_02
Function Fragment_Stage_0000_Item_02()
;BEGIN CODE
Actor BountyRef = Alias_WantedAlive.GetActorRef()
if BountyRef.IsDead()
    SFBGS003_MB_EliteBounty02_WantedAlive.SetStage(600)
elseif BountyRef.IsUnconscious()
    SFBGS003_MB_EliteBounty02_WantedAlive.SetStage(750)
else
    BountyRef.AddKeyword(SFBGS003_Keyword_WantedAlive)
    BountyRef.RemoveKeyword(SFBGS003_Keyword_WantedDead)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_03
Function Fragment_Stage_0000_Item_03()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property SFBGS003_MB_EliteBounty02_WantedAlive Auto Const Mandatory

Quest Property SFBGS003_MB_EliteBounty01_WantedDead Auto Const

Keyword Property SFBGS003_Keyword_WantedAlive Auto Const Mandatory

Keyword Property SFBGS003_Keyword_WantedDead Auto Const Mandatory

ReferenceAlias Property Alias_WantedDead Auto Const Mandatory

ReferenceAlias Property Alias_WantedAlive Auto Const Mandatory
