;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BE_SC03_002FBB35 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
;Startup

;When the player docks with the Galway, stop further fighting.
kMyQuest.SetCrewPlayerFriend(True, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set by: Change Location script on the player alias.

;Start the welcome scene when the player enters the ship.
BE_SC03_WelcomeScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
;Set by: Speaking to Jarod.

;Stop Jarod's Welcome Scene if the player enters dialogue with him.
BE_SC03_WelcomeScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0027_Item_00
Function Fragment_Stage_0027_Item_00()
;BEGIN CODE
;Set by: Speech Challenge Win

;Give the player some credtis for extorting Jarod.
Game.GetPlayer().AddItem(BE_SC03_ExtortionReward)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Set by: Player Undocks from The Galway

;The ship Grav Jumps away.
SpaceshipReference enemyShipRef = Alias_EnemyShip.GetShipRef()
if (enemyShipRef.GetValue(SpaceshipCrew) > 0)
     enemyShipRef.DisableWithGravJump()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
;Set by: OnHit on any NPC.

;Turn the entire family hostile.
kMyQuest.SetCrewPlayerFriend(False)

;If the player attacked anyone, this encounter will never trigger again.
BE_SC03_McGrathEncounterStateGlobal.SetValue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Set by: Stop stage.

;If this encounter is ending, and the player spoke to any NPC, set
;the encounter global for next time, so they remember the player.
if ((GetStageDone(30)) && (BE_SC03_McGrathEncounterStateGlobal.GetValue() == 0))
     BE_SC03_McGrathEncounterStateGlobal.SetValue(1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BE_SC03_McGrathEncounterStateGlobal Auto Const Mandatory

Scene Property BE_SC03_WelcomeScene Auto Const Mandatory

LeveledItem Property BE_SC03_ExtortionReward Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory

ReferenceAlias Property Alias_EnemyShip Auto Const Mandatory
