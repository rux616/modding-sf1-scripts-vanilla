;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_Staryard_Trident_Z_Fueli_002E7CA5 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;only remove 1 velocity of any color from inventory

;remove Velocity Blue
if VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemCount(VelocityBlue) >= 1 
  VelocityRemoved.Mod(1)
  Game.GetPlayer().RemoveItem(VelocityBlue, 1)
endif

;remove Velocity Green
if VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemCount(VelocityGreen) >= 1 
  VelocityRemoved.Mod(1)
  Game.GetPlayer().RemoveItem(VelocityGreen, 1)
endif

;remove velocity oragne
if VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemCount(VelocityOrange) >= 1 
  VelocityRemoved.Mod(1)
  Game.GetPlayer().RemoveItem(VelocityOrange, 1)
endif

;remove velocity red
if VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemCount(VelocityRed) >= 1 
  VelocityRemoved.Mod(1)
  Game.GetPlayer().RemoveItem(VelocityRed, 1)
endif

;remove velocity teal
if VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemCount(VelocityTeal) >= 1 
  VelocityRemoved.Mod(1)
  Game.GetPlayer().RemoveItem(VelocityTeal, 1)
endif

;remove velocity violet
if VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemcount(VelocityViolet) >= 1
  VelocityRemoved.Mod(1)
  Game.GetPlayer().RemoveItem(VelocityViolet, 1)
endif

;remove velocity yellow
if VelocityRemoved.GetValueInt() < 1 && Game.GetPlayer().GetItemCount(VelocityYellow) >= 1 
  VelocityRemoved.Mod(1)
  Game.GetPlayer().RemoveItem(VelocityYellow, 1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property VelocityRemoved Auto Const

Potion Property VelocityBlue Auto Const

Potion Property VelocityGreen Auto Const

Potion Property VelocityOrange Auto Const

Potion Property VelocityRed Auto Const

Potion Property VelocityTeal Auto Const

Potion Property VelocityViolet Auto Const

Potion Property VelocityYellow Auto Const


