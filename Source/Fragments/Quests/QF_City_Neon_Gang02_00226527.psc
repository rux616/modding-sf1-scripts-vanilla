;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_Neon_Gang02_00226527 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; The helper quest for this needs to be fired up
City_Neon_Gang_Tagging.Start()

; The enemies at 3 are hostile on start
Alias_DisciplesAt01.EnableAll()
Alias_DisciplesAt01.StartCombatAll(Game.GetPlayer())
Alias_DisciplesAt03.EnableAll()
Alias_DisciplesAt03.StartCombatAll(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(400)
SetObjectiveDisplayed(300)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)

; Make the sign play the Striker logo now
Alias_GangSign01.GetRef().GetLinkedRef().PlayAnimation("Play01")

; All signs flipped?
if ( GetStageDone(400) && GetStageDone(500) )
  SetStage(600)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)

; Make the sign play the Striker logo now
Alias_GangSign02.GetRef().GetLinkedRef().PlayAnimation("Play01")

; All signs flipped?
if ( GetStageDone(300) && GetStageDone(500) )
  SetStage(600)
endif

; Now make the Security Guard come out at you
Alias_GuardAt02.GetRef().Enable()
Gang02_400a_GuardStart.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
; The guard attacks
(Alias_GuardAt02.GetRef() as Actor).StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
;Move Guard
Alias_GuardAt02.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)

; Make the sign play the Striker logo now
Alias_GangSign03.GetRef().GetLinkedRef().PlayAnimation("Play01")

; All signs flipped?
if ( GetStageDone(300) && GetStageDone(400) )
  SetStage(600)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; Start up the next quest in the line
City_Neon_Gang03.SetStage(100)
City_Neon_Gang03.SetActive()

; Now end the quest
SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
; End the helper quest
City_Neon_Gang_Tagging.Stop()

; Make the quest guard go away
Alias_GuardAt02.GetRef().Disable()

; Make the signs go back to normal
Alias_GangSign01.GetRef().GetLinkedRef().PlayAnimation("Play02")
Alias_GangSign02.GetRef().GetLinkedRef().PlayAnimation("Play02")
Alias_GangSign03.GetRef().GetLinkedRef().PlayAnimation("Play02")

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property City_Neon_Gang_Tagging Auto Const Mandatory

Quest Property City_Neon_Gang03 Auto Const Mandatory

ReferenceAlias Property Alias_GuardAt02 Auto Const Mandatory

RefCollectionAlias Property Alias_DisciplesAt03 Auto Const Mandatory

Scene Property Gang02_400_GuardAccost Auto Const Mandatory

Scene Property Gang02_400a_GuardStart Auto Const Mandatory

RefCollectionAlias Property Alias_DisciplesAt01 Auto Const Mandatory

ReferenceAlias Property Alias_GangSign01 Auto Const Mandatory

ReferenceAlias Property Alias_GangSign02 Auto Const Mandatory

ReferenceAlias Property Alias_GangSign03 Auto Const Mandatory
