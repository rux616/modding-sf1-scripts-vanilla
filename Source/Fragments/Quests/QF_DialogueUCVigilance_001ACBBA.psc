;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueUCVigilance_001ACBBA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Alias_CF07_StagingMarker01.Clear()
Alias_CF07_StagingMarker02.Clear()
Alias_CF07_StagingMarker03.Clear()
Alias_CF07_StagingMarker04.Clear()
Alias_CF07_StagingMarker05.Clear()

int i = 0

Actor[] SysDefCrew = Alias_OperationsActorsAll.GetActorArray()
while i < SysDefCrew.Length
    SysDefCrew[i].SetCrimeFaction(CrimeFactionUCSysDef)
    i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
Alias_CF07_StagingMarker01.GetRef().DisableNoWait()
Alias_CF07_StagingMarker02.GetRef().DisableNoWait()
Alias_CF07_StagingMarker03.GetRef().DisableNoWait()
Alias_CF07_StagingMarker04.GetRef().DisableNoWait()

ObjectReference[] CF07Actors = Alias_CF07_StageActors.GetArray()
int q = 0
while q < CF07Actors.Length
    VigilanceMainActors.RemoveRef(CF07Actors[q])
    q += 1
endWhile

Alias_CF07_StageActors.DisableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Alias_CF07_StagingMarker01.RefillAlias()
Alias_CF07_StagingMarker02.RefillAlias()
Alias_CF07_StagingMarker03.RefillAlias()
Alias_CF07_StagingMarker04.RefillAlias()
Alias_CF07_StagingMarker05.RefillAlias()

ObjectReference Chair01Ref = Alias_CF07_StagingMarker01.GetRef()
Chair01Ref.EnableNoWait()

ObjectReference Marine01Ref = Chair01Ref.PlaceAtMe(LvlMarine_SysDef_Officer_Male)
Marine01Ref.SetLinkedRef(Chair01Ref, LinkCustom06)
Alias_CF07_StageActors.AddRef(Marine01Ref)

ObjectReference Chair02Ref = Alias_CF07_StagingMarker02.GetRef()
Chair02Ref.EnableNoWait()

ObjectReference Marine02Ref = Chair02Ref.PlaceAtMe(LvlMarine_SysDef_Officer_Male)
Marine02Ref.SetLinkedRef(Chair02Ref, LinkCustom06)
Alias_CF07_StageActors.AddRef(Marine01Ref)

ObjectReference Chair03Ref = Alias_CF07_StagingMarker03.GetRef()
Chair03Ref.EnableNoWait()

ObjectReference Marine03Ref = Chair03Ref.PlaceAtMe(LvlMarine_SysDef)
Marine03Ref.SetLinkedRef(Chair03Ref, LinkCustom06)
Alias_CF07_StageActors.AddRef(Marine03Ref)

ObjectReference Chair04Ref = Alias_CF07_StagingMarker04.GetRef()
Chair04Ref.EnableNoWait()

ObjectReference Marine04Ref = Chair04Ref.PlaceAtMe(LvlMarine_SysDef_Support)
Marine04Ref.SetLinkedRef(Chair04Ref, LinkCustom06)
Alias_CF07_StageActors.AddRef(Marine04Ref)

ObjectReference Chair05Ref = Alias_CF07_StagingMarker05.GetRef()

ObjectReference Marine05Ref = Chair05Ref.PlaceAtMe(LvlMarine_SysDef_Officer_Male)
Marine05Ref.SetLinkedRef(Chair05Ref, LinkCustom06)
Alias_CF07_StageActors.AddRef(Marine05Ref)

ObjectReference Chair06Ref = Alias_CF07_StagingMarker06.GetRef()

ObjectReference Marine06Ref = Chair06Ref.PlaceAtMe(LvlMarine_SysDef_Assault)
Marine06Ref.SetLinkedRef(Chair06Ref, LinkCustom07)
Alias_CF07_StageActors.AddRef(Marine06Ref)

ObjectReference Chair07Ref = Alias_CF07_StagingMarker07.GetRef()

ObjectReference Marine07Ref = Chair07Ref.PlaceAtMe(LvlMarine_SysDef_Assault)
Marine07Ref.SetLinkedRef(Chair07Ref, LinkCustom07)
Alias_CF07_StageActors.AddRef(Marine07Ref)


Actor[] CF07Actors = Alias_CF07_StageActors.GetActorArray()
int q = 0
while q < CF07Actors.Length
    VigilanceMainActors.AddRef(CF07Actors[q])
    CF07Actors[q].SetCrimeFaction(CrimeFactionUCSysDef)
    q += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
SetObjectiveCompleted(85)

;if misc quest received, display objective to return, otherwise clear alias
if GetStageDone(85)
    SetObjectiveDisplayed(25)
else
    Alias_AudioLogKryx.Clear()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0029_Item_00
Function Fragment_Stage_0029_Item_00()
;BEGIN CODE
SetObjectiveCompleted(25)
Alias_AudioLogKryx.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(85)
SetStage(23)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
DialogueUCVigilance_BrigGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
DialogueUCVigilance_IntroBrigScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Alias_BrigGuard.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
Alias_Jivanta.GetRef().Moveto(Alias_JivantaInspecting.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
DialogueUCVigilance_Jivanta_SceneTurret.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
DialogueUCVigilance_Jivanta_SceneTurret.Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Archangel Auto Const Mandatory

ReferenceAlias Property Alias_Jailor Auto Const Mandatory

Scene Property DialogueUCVigilance_IntroBrigScene Auto Const Mandatory

ReferenceAlias Property Alias_BrigGuard Auto Const Mandatory

GlobalVariable Property DialogueUCVigilance_BrigGlobal Auto Const Mandatory

Scene Property DialogueUCVigilance_Jivanta_SceneTurret Auto Const Mandatory

ReferenceAlias Property Alias_Jivanta Auto Const Mandatory

ReferenceAlias Property Alias_JivantaInspecting Auto Const Mandatory

ReferenceAlias Property Alias_AudioLogKryx Auto Const Mandatory

ReferenceAlias Property Alias_CF07_StagingMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_CF07_StagingMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_CF07_StagingMarker03 Auto Const Mandatory

ReferenceAlias Property Alias_CF07_StagingMarker04 Auto Const Mandatory

ReferenceAlias Property Alias_CF07_StagingMarker05 Auto Const Mandatory

RefCollectionAlias Property Alias_CF07_StageActors Auto Const Mandatory

ActorBase Property LvlMarine_SysDef_Officer_Male Auto Const Mandatory

ActorBase Property LvlMarine_SysDef_Recruit_Male Auto Const Mandatory

ActorBase Property LvlMarine_SysDef Auto Const Mandatory

Keyword Property LinkCustom06 Auto Const Mandatory

ActorBase Property LvlMarine_SysDef_Support Auto Const Mandatory

ActorBase Property LvlMarine_SysDef_Assault Auto Const Mandatory

Keyword Property LinkCustom07 Auto Const Mandatory

ReferenceAlias Property Alias_CF07_StagingMarker06 Auto Const Mandatory

ReferenceAlias Property Alias_CF07_StagingMarker07 Auto Const Mandatory

RefCollectionAlias Property VigilanceMainActors Auto Const Mandatory

RefCollectionAlias Property Alias_OperationsActorsAll Auto Const Mandatory

Faction Property CrimeFactionUCSysDef Auto Const Mandatory
