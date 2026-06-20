;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_Patch_Update10_SFFL_010953A6 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;SFFL_SE_EC02 - Dax Burroughs can become an unwanted follower if for
;some reason stage 300 doesn't get set. This will solve this issue for
;players who already started the quest

Actor Dax = Alias_DaxBurroughs.GetActorRef()
Location playerShipInterior = Alias_PlayerShipInterior.GetLocation()

if (!Dax.IsDead() && SFFL_SE_EC02.GetStageDone(150))
    Debug.Trace("Player has accepted to take Dax to Neon")
    if (!Dax.IsInLocation(Alias_DerelictShipInterior.GetLocation()) || SFFL_SE_EC02.GetStageDone(500))
        if (!Dax.IsInLocation(playerShipInterior) && !Dax.IsInLocation(Alias_SFFL_SE_EC02_Destination.GetLocation()))
            Dax.MoveTo(Alias_PlayerShipCockpit.GetRef())
        endif
        SFFL_SE_EC02.SetStage(300)
        Debug.Trace("Set stage 300 on SFFL_SE_EC02")
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_01
Function Fragment_Stage_0000_Item_01()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property SFFL_SE_EC02 Auto Const Mandatory

ReferenceAlias Property Alias_DaxBurroughs Auto Const Mandatory

LocationAlias Property Alias_DerelictShipInterior Auto Const Mandatory

LocationAlias Property Alias_PlayerShipInterior Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShipCockpit Auto Const Mandatory

LocationAlias Property Alias_SFFL_SE_EC02_Destination Auto Const Mandatory
