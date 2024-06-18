;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_City_AkilaLife03_200_TL_S_0011234B Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
; If all the books have been found, close down the quest
float fCount = AkilaLife03_BookReturnCount.GetValue()
if ( fCount == 8.0 )
  GetOwningQuest().SetStage(9000)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property AkilaLife03_BookReturnCount Auto Const Mandatory
