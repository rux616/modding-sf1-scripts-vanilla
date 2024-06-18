;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BE_SC04_002B5691 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
;Set by: Captain enters Bleedout.

;Start the bargaining scene.
BE_SC04_BargainingSceneIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
;Set by: Bargaining Intro scene.

;The Captain, Crew, and Ship stop fighting the player.
kMyQuest.SetCrewPlayerFriend(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
;Set by:
;- Player rejects the Captain's offer.
;- Hit event on Captain, Crew, or Ship after barganing starts.

;Stop the bargaining scene, if it was running.
BE_SC04_BargainingSceneIntro.Stop()
BE_SC04_BargainingScene.Stop()

;Make sure the Captain has at least 1 Health, then remove them from the
;alias that made them Essential, so they can be killed normally.
Actor captainRef = Alias_Captain.GetActorRef()
if (captainRef.GetValue(Health) <= 0)
     captainRef.RestoreValue(Health, Math.Abs(captainRef.GetValue(Health))+1)
EndIf
Alias_CaptainEssentialAlias.Clear()

;Turn the Captain, Crew, and Ship hostile again.
kMyQuest.SetCrewPlayerFriend(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE BE_SC04QuestScript
Quest __temp = self as Quest
BE_SC04QuestScript kmyQuest = __temp as BE_SC04QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: DefaultAliasOnShipUndock.

;Spawn a travel marker for the ship to move to.
kMyQuest.SpawnJumpTravelMarker()

;Did the player accept the bargain? And not attack the pirates?
if (GetStageDone(30) && !GetStageDone(50))
     ;Does the pirate keep the deal?
     if (Utility.RandomInt(0, 100) < BE_SC04_PirateKeepsBargainChanceGlobal.GetValueInt())
          BE_SC04_BargainSucceeds.Start()
     Else
          BE_SC04_BargainFails.Start()
     EndIf
Else
     SetStage(70)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0061_Item_00
Function Fragment_Stage_0061_Item_00()
;BEGIN CODE
;Set by: Bargain Speech Challenge Win, or Bargain Succeeds scene.

;Give the player a misc objective to a pirate stash container.
;TODO - Temporarily just setting a stage directly instead of sending
;a story manager event, for ease of testing.
BE_SC04_Misc.SetStage(10)
;BE_SC04_Misc_Keyword.SendStoryEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN AUTOCAST TYPE BE_SC04QuestScript
Quest __temp = self as Quest
BE_SC04QuestScript kmyQuest = __temp as BE_SC04QuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: BargainSucceeds or BargainFail scenes, if they finish
;without the player having attacked the target ship.

;The ship Grav Jumps away.
SpaceshipReference enemyShipRef = Alias_EnemyShip.GetShipRef()
if (enemyShipRef.GetValue(SpaceshipCrew) > 0)
     enemyShipRef.DisableWithGravJump()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property BE_SC04_BargainingScene Auto Const Mandatory

ReferenceAlias Property Alias_Captain Auto Const Mandatory

ActorValue Property Health Auto Const Mandatory

Scene Property BE_SC04_BargainingSceneIntro Auto Const Mandatory

ReferenceAlias Property Alias_CaptainEssentialAlias Auto Const Mandatory

Scene Property BE_SC04_BargainSucceeds Auto Const Mandatory

Scene Property BE_SC04_BargainFails Auto Const Mandatory

GlobalVariable Property BE_SC04_PirateKeepsBargainChanceGlobal Auto Const Mandatory

ReferenceAlias Property Alias_EnemyShip Auto Const Mandatory

Keyword Property BE_SC04_Misc_Keyword Auto Const Mandatory

Quest Property BE_SC04_Misc Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory
