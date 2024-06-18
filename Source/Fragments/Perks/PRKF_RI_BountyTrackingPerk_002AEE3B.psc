;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Perks:PRKF_RI_BountyTrackingPerk_002AEE3B Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Debug.Trace(Self + "RIR01: Perk Entry Point fired") 
(RI_Support as RI_RadiantSupportQuestScript).BountyReceived(RIR01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Entry_01
Function Fragment_Entry_01(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Debug.Trace(Self + "RIR02: Perk Entry Point fired") 
(RI_Support as RI_RadiantSupportQuestScript).BountyReceived(RIR02)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Entry_02
Function Fragment_Entry_02(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Debug.Trace(Self + "RIR03: Perk Entry Point fired") 
(RI_Support as RI_RadiantSupportQuestScript).BountyReceived(RIR03)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Entry_03
Function Fragment_Entry_03(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Debug.Trace(Self + "RIR04: Perk Entry Point fired") 
(RI_Support as RI_RadiantSupportQuestScript).BountyReceived(RIR04)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Entry_04
Function Fragment_Entry_04(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Debug.Trace(Self + "RIR05: Perk Entry Point fired") 
(RI_Support as RI_RadiantSupportQuestScript).BountyReceived(RIR05)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Entry_05
Function Fragment_Entry_05(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Debug.Trace(Self + "RIR07: Perk Entry Point fired") 
(RI_Support as RI_RadiantSupportQuestScript).BountyReceived(RIR07)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Entry_06
Function Fragment_Entry_06(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Debug.Trace(Self + "RI02: Perk Entry Point fired") 
(RI_Support as RI_RadiantSupportQuestScript).BountyReceived(RI02)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Entry_07
Function Fragment_Entry_07(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Debug.Trace(Self + "RI03: Perk Entry Point fired") 
(RI_Support as RI_RadiantSupportQuestScript).BountyReceived(RI03)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Entry_08
Function Fragment_Entry_08(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Debug.Trace(Self + "RI04: Perk Entry Point fired") 
(RI_Support as RI_RadiantSupportQuestScript).BountyReceived(RI04)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Entry_09
Function Fragment_Entry_09(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Debug.Trace(Self + "RI06: Perk Entry Point fired") 
(RI_Support as RI_RadiantSupportQuestScript).BountyReceived(RI06)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Entry_10
Function Fragment_Entry_10(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Debug.Trace(Self + "RI07: Perk Entry Point fired") 
(RI_Support as RI_RadiantSupportQuestScript).BountyReceived(RI07)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Entry_11
Function Fragment_Entry_11(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Debug.Trace(Self + "MB_Hack01_RIR01: Perk Entry Point fired") 
(RI_Support as RI_RadiantSupportQuestScript).BountyReceived(MB_Hack01_RIR01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Entry_12
Function Fragment_Entry_12(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Debug.Trace(Self + "MB_PlantEvidence01_RIR02: Perk Entry Point fired") 
(RI_Support as RI_RadiantSupportQuestScript).BountyReceived(MB_PlantEvidence01_RIR02)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Entry_13
Function Fragment_Entry_13(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Debug.Trace(Self + "MB_Sabotage01_RIR04: Perk Entry Point fired") 
(RI_Support as RI_RadiantSupportQuestScript).BountyReceived(MB_Sabotage01_RIR04)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property RI_Support Auto Const Mandatory

Quest Property RIR01 Auto Const Mandatory

Quest Property RIR02 Auto Const Mandatory

Quest Property RIR03 Auto Const Mandatory

Quest Property RIR04 Auto Const Mandatory

Quest Property RIR05 Auto Const Mandatory

Quest Property RIR07 Auto Const Mandatory

Quest Property RI02 Auto Const Mandatory

Quest Property RI03 Auto Const Mandatory

Quest Property RI04 Auto Const Mandatory

Quest Property RI06 Auto Const Mandatory

Quest Property RI07 Auto Const Mandatory

Quest Property MB_Hack01_RIR01 Auto Const Mandatory

Quest Property MB_PlantEvidence01_RIR02 Auto Const Mandatory

Quest Property MB_Sabotage01_RIR04 Auto Const Mandatory
