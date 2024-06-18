;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_Neon_Drug03_00233C2F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Yannick.GetRef())

; Make it so Yannick's initial conversation has been read
DialogueFCNeon.SetStage(490)
LC168Xenofresh.SetPublic(TRUE)

; Close off Drug02
City_Neon_Drug02.SetStage(300)
City_Neon_Drug02.SetStage(600)
City_Neon_Drug02.SetStage(9000)

Drug02_FinaleInsideGuardREF001.Disable()
Drug02_FinaleInsideGuardREF.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Checking if this is the first time for the quest
if ( Neon_Drug03_Count.GetValue() == 0 )
  SetStage(50)
endif

; Now roll up the Complication for the Package
Int nPreviousComplication = Neon_Drug03_Complication.GetValue() as Int
Int nNewComplicationRoll = Utility.RandomInt(1, 7)

; 1-Hostile Scum, 2-Nothing, 3-Beggar, 4-Syndicate

; If you rolled the previous entry - then nothing happens
if ( nNewComplicationRoll == nPreviousComplication )
  nNewComplicationRoll = 2
endif

; 567 rolled means nothing happens, so there's a good chance nothing happens
if ( nNewComplicationRoll > 4 )
  nNewComplicationRoll = 2  
endif

Neon_Drug03_Complication.SetValue(nNewComplicationRoll as Float)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(100)
; set cooldown for doing another shift
City_Neon_Drug03Misc.Start()
City_Neon_Drug03Misc.ClearShiftTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(150)

; Start the minigame
City_Neon_Drug_Game.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(160)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
; She shows up in the Break Room
Alias_Robie.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

; Enable the Cache Container
Alias_CacheContainer.GetRef().Enable()

int nComplication = Neon_Drug03_Complication.GetValue() as Int

; Add the Stash to the chosen container
if nComplication != 3   ; In the 3 case, then the beggar grabbed it
  Alias_CacheContainer.GetRef().AddAliasedItem(Neon_Drug03_AuroraStash, Alias_YannickStash)
endif

; Now see what complication you rolled
if nComplication == 1
  Alias_Complication01Enemies.EnableAll()
elseif nComplication == 3
  ObjectReference oBeggar = Alias_Complication03Beggar.GetRef()
  oBeggar.AddAliasedItem(Neon_Drug03_AuroraStash, Alias_YannickStash)
  oBeggar.Enable()
elseif nComplication == 4
  Alias_Complication03Enemies.EnableAll()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
; The Beggar attacks
(Alias_Complication03Beggar.GetRef() as Actor).StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(360)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
Actor aPC = Game.GetPlayer() as Actor

; Take the $$$ and give the package to the player
aPC.RemoveItem(Credits, Neon_Drug03_BeggarBribe.GetValue() as Int)
aPC.AddItem(Alias_YannickStash.GetRef())

SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0385_Item_00
Function Fragment_Stage_0385_Item_00()
;BEGIN CODE
; Give the package to the player
Actor aPC = Game.GetPlayer() as Actor
aPC.AddItem(Alias_YannickStash.GetRef())

SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)

; Robie is now gone until she needs to show up again
Alias_Robie.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; Increment the counter (tracks how many times the quest was done)
Neon_Drug03_Count.Mod(1.0)

SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; Increment the counter (tracks how many times the quest was done)
Neon_Drug03_Count.Mod(1.0)

; Remove the stash item
Game.GetPlayer().RemoveItem(Neon_Drug03_AuroraStash)

SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8900_Item_00
Function Fragment_Stage_8900_Item_00()
;BEGIN CODE
; Failsafe to disable the Cache Container
Alias_CacheContainer.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
; start timer for next shift
City_Neon_Drug03Misc.StartShiftTimer()

If Drug03_RecipeDone.GetValue() == 0
	Drug03_AuroraFinalMessage.Show()
	Drug03_RecipeDone.SetValue(1)
Endif
Utility.Wait(1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Neon_Drug03_AuroraStash Auto Const Mandatory

ReferenceAlias Property Alias_CacheContainer Auto Const Mandatory

ReferenceAlias Property Alias_YannickStash Auto Const Mandatory

RefCollectionAlias Property Alias_Complication01Enemies Auto Const Mandatory

Book Property Drug03_RobieStashLocationNote Auto Const Mandatory

ReferenceAlias Property Alias_Yannick Auto Const Mandatory

ReferenceAlias Property Alias_Robie Auto Const Mandatory

ObjectReference Property Drug01_YannickStart_Marker Auto Const Mandatory

GlobalVariable Property Neon_Drug03_Count Auto Const Mandatory

Quest Property City_Neon_Drug_Game Auto Const Mandatory

GlobalVariable Property Neon_Drug03_Complication Auto Const Mandatory

ReferenceAlias Property Alias_Complication03Beggar Auto Const Mandatory

RefCollectionAlias Property Alias_Complication03Enemies Auto Const Mandatory

GlobalVariable Property Neon_Drug03_BeggarBribe Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Quest Property DialogueFCNeon Auto Const Mandatory

Quest Property City_Neon_Drug02 Auto Const Mandatory

Cell Property LC168Xenofresh Auto Const Mandatory

ObjectReference Property Drug02_FinaleInsideGuardREF Auto Const Mandatory

ObjectReference Property Drug02_FinaleInsideGuardREF001 Auto Const Mandatory

Message Property Drug03_AuroraFinalMessage Auto Const Mandatory

GlobalVariable Property Drug03_RecipeDone Auto Const Mandatory

GlobalVariable Property Neon_Drug03_CooldownTimestamp Auto Const Mandatory

City_Neon_Drug03MiscScript Property City_Neon_Drug03Misc Auto Const Mandatory
