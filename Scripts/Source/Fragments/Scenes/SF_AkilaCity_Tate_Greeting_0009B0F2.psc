;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_AkilaCity_Tate_Greeting_0009B0F2 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
; Start "Blast Zone" after you've talked with him
if ( !City_AkilaLife05.IsCompleted() )
  City_AkilaLife05.SetStage(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
; Start "Blast Zone" after you've talked with him
if ( !City_AkilaLife05.IsCompleted() )
  City_AkilaLife05.SetStage(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property City_AkilaLife05 Auto Const Mandatory
