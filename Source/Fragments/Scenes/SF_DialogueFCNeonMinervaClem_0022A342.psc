;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DialogueFCNeonMinervaClem_0022A342 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN CODE
;Take money
Game.GetPlayer().RemoveItem(Credits,Neon_VoliiHotel_Rentcost.GetValueInt())

;Increment the Neon_VoliiHotel_RentCount for "secret"
If Neon_VoliiHotel_RentCount.GetValue() < 4
  Neon_VoliiHotel_RentCount.SetValue(Neon_VoliiHotel_RentCount.GetValue() + 1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property Neon_VoliiHotel_RentCount Auto Const

GlobalVariable Property Neon_VoliiHotel_RentCost Auto Const

MiscObject Property Credits Auto Const
