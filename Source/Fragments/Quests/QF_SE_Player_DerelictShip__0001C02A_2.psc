;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_DerelictShip__0001C02A_2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SQ_Parent.SetupDamagedShip(Alias_DerelictShip.GetShipRef(), false, true, true, true, true, true, AdditionalActorValuesToDamage)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_DerelictShip.GetShipRef().SetValue(DockingPermission, 0)
SE_GenericDerelict_MissionCrewTypeGlobal.SetValue(Utility.RandomInt(0,3))
SE_DerelictGeneric_MissionCompanyGlobal.SetValueInt(Utility.RandomInt(0,4))
SE_DerelictGeneric_MissionHazardGlobal.SetValueInt(Utility.RandomInt(0,11))
SE_DerelictGeneric_MissionHazardCauseGlobal.SetValueInt(Utility.RandomInt(0,2))
SE_DerelictGeneric_MissionTypeGlobal.SetValueInt(Utility.RandomInt(0,1))
SE_GenericDerelict_Repaired.SetValue(0)
SE_GenericDerelict_LogsDownloaded.SetValue(0)
SE_GenericDerelict_HazardFixed.SetValue(0)
SE_GenericDerelict_TerminalGlobal.SetValue(0)
SE_GenericDerelict_TerminalCrewGlobal.SetValue(0)
SE_GenericDerelict_TerminalDockingGlobal.SetValue(0)
SE_GenericDerelict_TerminalCrewEquipmentGlobal.SetValue(0)
SE_GenericDerelict_TerminalVoteTallyGlobal.SetValue(0)

ObjectReference[] FurnitureRef = Alias_CrewSpawnMarkers.GetArray()
int i = 0
while i < FurnitureRef.Length
    Alias_CrewWoundedMarkers.AddRef(FurnitureRef[i].PlaceAtMe(NPCWoundedLean))
    i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Keyword[] hazardKeywords = BEHazardKeywordList.GetArray() as Keyword[]
SpaceshipReference DerelictShip = Alias_DerelictShip.GetShipRef()

int biohazard = utility.randomint(0,2)
if biohazard == 0
    DerelictShip.AddKeyword(hazardKeywords[11])
elseif biohazard == 1
    DerelictShip.AddKeyword(hazardKeywords[8])
else
    DerelictShip.AddKeyword(hazardKeywords[10])
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_01
Function Fragment_Stage_0020_Item_01()
;BEGIN CODE
Keyword[] hazardKeywords = BEHazardKeywordList.GetArray() as Keyword[]
Alias_DerelictShip.GetShipRef().AddKeyword(hazardKeywords[8])
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_02
Function Fragment_Stage_0020_Item_02()
;BEGIN CODE
Keyword[] hazardKeywords = BEHazardKeywordList.GetArray() as Keyword[]
Alias_DerelictShip.GetShipRef().AddKeyword(hazardKeywords[6])
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_03
Function Fragment_Stage_0020_Item_03()
;BEGIN CODE
Keyword[] hazardKeywords = BEHazardKeywordList.GetArray() as Keyword[]
int biohazard = utility.randomint(0,1)
if biohazard == 1
    Alias_DerelictShip.GetShipRef().AddKeyword(hazardKeywords[4])
else
    Alias_DerelictShip.GetShipRef().AddKeyword(hazardKeywords[24])
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_04
Function Fragment_Stage_0020_Item_04()
;BEGIN CODE
Keyword[] hazardKeywords = BEHazardKeywordList.GetArray() as Keyword[]
Alias_DerelictShip.GetShipRef().AddKeyword(hazardKeywords[3])
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_05
Function Fragment_Stage_0020_Item_05()
;BEGIN CODE
Keyword[] hazardKeywords = BEHazardKeywordList.GetArray() as Keyword[]
int biohazard = utility.randomint(0,1)
if biohazard == 1
    Alias_DerelictShip.GetShipRef().AddKeyword(hazardKeywords[5])
else
    Alias_DerelictShip.GetShipRef().AddKeyword(hazardKeywords[0])
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_DerelictShip Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

GlobalVariable Property SE_DerelictGeneric_MissionCompanyGlobal Auto Const Mandatory

GlobalVariable Property SE_DerelictGeneric_MissionTypeGlobal Auto Const Mandatory

GlobalVariable Property SE_DerelictGeneric_MissionHazardGlobal Auto Const Mandatory

GlobalVariable Property SE_DerelictGeneric_MissionHazardCauseGlobal Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_Repaired Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_MissionCrewTypeGlobal Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_IDCardGlobal Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_BlackboxGlobal Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_LogsDownloaded Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_HazardFixed Auto Const Mandatory

GlobalVariable Property BE_GenericDerelicCrewGlobal Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_TerminalGlobal Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_TerminalCrewGlobal Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_TerminalDockingGlobal Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_TerminalCrewEquipmentGlobal Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_TerminalVoteTallyGlobal Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_UniqueEntry01Global Auto Const Mandatory

FormList Property BEHazardKeywordList Auto Const Mandatory

sq_parentscript Property SQ_Parent Auto Const Mandatory

SQ_ParentScript:ActorValueDatum[] property AdditionalActorValuesToDamage Auto Const

RefCollectionAlias Property Alias_CrewSpawnMarkers Auto Const Mandatory

RefCollectionAlias Property Alias_CrewWoundedMarkers Auto Const Mandatory

Furniture Property NPCWoundedLean Auto Const Mandatory
