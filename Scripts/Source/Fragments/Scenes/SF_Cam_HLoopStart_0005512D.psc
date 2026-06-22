;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_Cam_HLoopStart_0005512D Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE CityNewAtlantisTransitControlScript
CityNewAtlantisTransitControlScript kmyQuest = GetOwningQuest() as CityNewAtlantisTransitControlScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Travel(UC04_Player_NATTeleportMarker_Stage610)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN AUTOCAST TYPE CityNewAtlantisTransitControlScript
CityNewAtlantisTransitControlScript kmyQuest = GetOwningQuest() as CityNewAtlantisTransitControlScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Travel(NA_NAT_MASTMarkerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN CODE
NA_TransitTrack.getref().PlayAnimation("Depart")
Debug.Trace("NAT Spaceport - Depart Anim called")
NA_TransitTrack.getref().PlayAnimation("Stage2")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN CODE
NA_TransitMASTHelper.getref().PlayAnimation("Depart")
Debug.Trace("NAT MAST - Depart Anim called")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_05_Begin
Function Fragment_Phase_05_Begin()
;BEGIN CODE
NA_TransitResidentialHelper.getref().PlayAnimation("Depart")
Debug.Trace("NAT Residential - Depart Anim called")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_06_Begin
Function Fragment_Phase_06_Begin()
;BEGIN CODE
NA_TransitCommercialHelper.getref().PlayAnimation("Depart")
Debug.Trace("NAT Commercial - Depart Anim called")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_Begin
Function Fragment_Phase_07_Begin()
;BEGIN CODE
NA_TransitTrack.getref().PlayAnimation("Arrive")
Debug.Trace("NAT Spaceport - Arrival Anim called")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_End
Function Fragment_Phase_07_End()
;BEGIN AUTOCAST TYPE CityNewAtlantisTransitControlScript
CityNewAtlantisTransitControlScript kmyQuest = GetOwningQuest() as CityNewAtlantisTransitControlScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Travel(NA_NAT_SpaceportMarkerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_08_Begin
Function Fragment_Phase_08_Begin()
;BEGIN CODE
NA_TransitMASTHelper.getref().PlayAnimation("Arrive")
Debug.Trace("NAT MAST - Arrive Anim called")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_08_End
Function Fragment_Phase_08_End()
;BEGIN AUTOCAST TYPE CityNewAtlantisTransitControlScript
CityNewAtlantisTransitControlScript kmyQuest = GetOwningQuest() as CityNewAtlantisTransitControlScript
;END AUTOCAST
;BEGIN CODE
;if MQ101.IsRunning() && MQ101.GetStage() < 1500
;Vasco.GetRef().Moveto(UC_NAT_EmbassyFollowerMarker)
;endif
kmyquest.Travel(NA_NAT_MASTMarkerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_09_Begin
Function Fragment_Phase_09_Begin()
;BEGIN CODE
NA_TransitResidentialHelper.getref().PlayAnimation("Arrive")
Debug.Trace("NAT Residential - Arrive Anim called")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_09_End
Function Fragment_Phase_09_End()
;BEGIN AUTOCAST TYPE CityNewAtlantisTransitControlScript
CityNewAtlantisTransitControlScript kmyQuest = GetOwningQuest() as CityNewAtlantisTransitControlScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Travel(NA_NAT_ResidentialMarkerREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_10_Begin
Function Fragment_Phase_10_Begin()
;BEGIN CODE
NA_TransitCommercialHelper.getref().PlayAnimation("Arrive")
Debug.Trace("NAT Commercial - Arrive Anim called")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_10_End
Function Fragment_Phase_10_End()
;BEGIN AUTOCAST TYPE CityNewAtlantisTransitControlScript
CityNewAtlantisTransitControlScript kmyQuest = GetOwningQuest() as CityNewAtlantisTransitControlScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Travel(NA_NAT_CommercialMarkerREF)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property NA_TransitTrack Auto Const

ReferenceAlias Property NA_TransitTrack02 Auto Const

WwiseEvent Property SoundTramDepartEvent Auto Const

WwiseEvent Property SoundTramArriveEvent Auto Const

MusicType Property MUSGenesisStingerCutsceneTransitionTEST Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory

ReferenceAlias Property Vasco Auto Const

ObjectReference Property UC_NAT_EmbassyFollowerMarker Auto Const Mandatory

ObjectReference Property NA_NAT_SpaceportMarkerRef Auto Const Mandatory

ObjectReference Property NA_NAT_MASTMarkerRef Auto Const Mandatory

ObjectReference Property NA_NAT_ResidentialMarkerREF Auto Const Mandatory

ObjectReference Property NA_NAT_CommercialMarkerREF Auto Const Mandatory

ObjectReference Property UC04_Player_NATTeleportMarker_Stage610 Auto Const Mandatory

ReferenceAlias Property NA_TransitMASTHelper Auto Const

ReferenceAlias Property NA_TransitCommercialHelper Auto Const

ReferenceAlias Property NA_TransitResidentialHelper Auto Const
