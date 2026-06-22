;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_CREW_EliteCrew_CoraCoe_Gi_010019EB Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN CODE
ObjectReference CoraRef = Cora.GetRef()

int BookCount = CoraRef.GetItemCount(BookKeyword)

CoraBookGlobal.SetValue(BookCount)
Cora.GetRef().OpenOneWayTransferMenu(true, BookFormList)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN CODE
ObjectReference CoraRef = Cora.GetRef()

int BookCount = CoraRef.GetItemCount(BookKeyword)

if BookCount <= CoraBookGlobal.GetValueInt()
;Cora was not given books, kill scene, otherwise say thank you
    CREW_EliteCrew_CoraCoe_GiveBooks.Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Cora Auto Const Mandatory

FormList Property BookFormList Auto Const Mandatory

Keyword Property BookKeyword Auto Const Mandatory

GlobalVariable Property CoraBookGlobal Auto Const Mandatory

Scene Property CREW_EliteCrew_CoraCoe_GiveBooks Auto Const Mandatory
