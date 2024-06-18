;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Staryard_StroudEklund_Dia_0027A4EF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Play a special message from Walter Stroud
SY_StroudEklund_100_Intro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
;stop intercom scene if player approaches the meeting room if it's playing

if SY_StroudEklund_100_Intro.IsPlaying()
 SY_StroudEklund_100_Intro.Stop()
 ;Debug.Notification("Hello")
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property SY_StroudEklund_100_Intro Auto Const Mandatory
