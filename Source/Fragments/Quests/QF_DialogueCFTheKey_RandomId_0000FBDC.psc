;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueCFTheKey_RandomId_0000FBDC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
DialogueCFTheKey_RandomIdles_LastNovaScene03.Stop()
Alias_PushUpFurniture01.GetRef().DisableNoWait()
Alias_PushUpFurniture02.GetRef().DisableNoWait()
Alias_PushUpFurniture03.GetRef().DisableNoWait()
Alias_PushUpFurniture04.GetRef().DisableNoWait()

Actor Pirate03 = Alias_Pirate03.GetActorRef()
Actor Pirate04 = Alias_Pirate04.GetActorRef()
Actor Pirate05 = Alias_Pirate05.GetActorRef()

Pirate03.EvaluatePackage()
Pirate04.EvaluatePackage()
Pirate05.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
DialogueCFTheKey_RandomIdles_LastNova01.Start()
DialogueCFTheKey_RandomIdles_LastNova02.Start()
int i = Utility.RandomInt(0,4)
CF_LastNovaPatronGlobal.SetValue(i)

;if i > 1
;    DialogueCFTheKey_RandomIdles_LastNova04.Start()
;endif

DialogueCFTheKey_RandomIdles_LastNovaScene03.Start()

Alias_PushUpFurniture01.GetRef().EnableNoWait()
Alias_PushUpFurniture02.GetRef().EnableNoWait()
Alias_PushUpFurniture03.GetRef().EnableNoWait()
Alias_PushUpFurniture04.GetRef().EnableNoWait()

Actor Pirate03 = Alias_Pirate03.GetActorRef()
Actor Pirate04 = Alias_Pirate04.GetActorRef()
ObjectReference Pirate05 = Alias_Pirate05.GetRef()

Pirate03.RemoveKeyword(AnimArchetypePirate)
Pirate03.AddKeyword(AnimArchetypeConfident)
Pirate04.RemoveKeyword(AnimArchetypePirate)
Pirate04.AddKeyword(AnimArchetypeConfident)

Pirate03.SnapIntoInteraction(Pirate03.GetLinkedRef())
Pirate04.SnapIntoInteraction(Pirate04.GetLinkedRef())
Pirate05.MoveTo(Pirate05.GetLinkedRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
DialogueCFTheKey_RandomIdles_LastNovaScene01.Stop()
DialogueCFTheKey_RandomIdles_LastNovaScene02.Stop()
DialogueCFTheKey_RandomIdles_LastNovaScene03.Stop()


DialogueCFTheKey_RandomIdles_LastNova01.Stop()
DialogueCFTheKey_RandomIdles_LastNova02.Stop()
DialogueCFTheKey_RandomIdles_LastNova04.Stop()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DialogueCFTheKey_RandomIdles_LastNova02 Auto Const Mandatory

GlobalVariable Property CF_LastNovaPatronGlobal Auto Const Mandatory

Quest Property DialogueCFTheKey_RandomIdles_LastNova01 Auto Const Mandatory

Quest Property DialogueCFTheKey_RandomIdles_LastNova04 Auto Const Mandatory

ReferenceAlias Property Alias_PushUpFurniture01 Auto Const Mandatory

ReferenceAlias Property Alias_PushUpFurniture02 Auto Const Mandatory

ReferenceAlias Property Alias_PushUpFurniture03 Auto Const Mandatory

Scene Property DialogueCFTheKey_RandomIdles_LastNovaScene03 Auto Const Mandatory

Scene Property DialogueCFTheKey_RandomIdles_LastNovaScene01 Auto Const Mandatory

Scene Property DialogueCFTheKey_RandomIdles_LastNovaScene02 Auto Const Mandatory

ReferenceAlias Property Alias_Pirate03 Auto Const Mandatory

ReferenceAlias Property Alias_Pirate04 Auto Const Mandatory

ReferenceAlias Property Alias_Pirate05 Auto Const Mandatory

ReferenceAlias Property Alias_PushUpFurniture04 Auto Const Mandatory

Keyword Property AnimArchetypeConfident Auto Const Mandatory

Keyword Property AnimArchetypePirate Auto Const Mandatory
