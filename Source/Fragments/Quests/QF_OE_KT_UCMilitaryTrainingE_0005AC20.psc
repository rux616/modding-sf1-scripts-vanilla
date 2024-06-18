;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_KT_UCMilitaryTrainingE_0005AC20 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
OE_KT_UCTrainingExercise_Scene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
OE_KT_UCTrainingExercise_MoveTo.Stop()
OE_KT_UCTrainingExercise_Scene01.Start()

Actor[] ModelA = Alias_ModelA_Group.GetActorArray()
Actor[] ModelS = Alias_ModelS_Grouip.GetActorArray()
ObjectReference[] NPCs = Alias_NPC_Group00.GetArray()

int i = 0

While i < ModelA.Length
    Alias_NPC_Group02.AddRef(ModelA[i])
    ModelA[i].AddPerk(OE_KT_ModDamageResistancePerk)
    i += 1
endWhile

int k = 0

While k < ModelS.Length
    Alias_NPC_Group02.AddRef(ModelS[k])
    ModelS[k].AddPerk(OE_KT_ModDamageResistancePerk)
    k += 1
endWhile

int j = 0

While j < NPCs.Length
    Alias_NPC_Group02.AddRef(NPCs[j])
    j += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_ModelA_Group.RemoveFromFaction(UnitedColoniesMarineFaction)
Alias_ModelA_Group.RemoveFromFaction(REPlayerFriend)

Alias_ModelS_Grouip.RemoveFromFaction(UnitedColoniesMarineFaction)
Alias_ModelS_Grouip.RemoveFromFaction(REPlayerFriend)

Alias_ModelA_Group.AddtoFaction(OE_GroupEnemyFaction)
Alias_ModelS_Grouip.AddtoFaction(OE_GroupEnemyFaction)

Alias_ModelA_Group.SetValue(Aggression, 1)
Alias_ModelS_Grouip.SetValue(Aggression, 1)
Alias_ModelA_Group.StartCombatAll(Alias_NPC02.GetActorRef())
Alias_ModelS_Grouip.StartCombatAll(Alias_NPC01.GetActorRef())

Alias_NPC_Group00.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0064_Item_00
Function Fragment_Stage_0064_Item_00()
;BEGIN CODE
SetStage(66)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
SetStage(50)

Alias_ModelA_Group.AddtoFaction(PlayerEnemyFaction)
Alias_ModelS_Grouip.AddtoFaction(PlayerEnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
ObjectReference PlayerRef = Game.GetPlayer()

if !GetStageDone(80)
    Alias_NPC_Group02.AddtoFaction(PlayerEnemyFaction)
    Alias_NPC_Group02.RemoveFromFaction(REPlayerFriend)
    Alias_NPC_Group02.SetValue(Aggression, 1)
    Alias_NPC_Group02.StartCombatAll(Game.GetPlayer())
else
    Alias_NPC_Group00.AddtoFaction(PlayerEnemyFaction)
    Alias_NPC_Group00.SetValue(Aggression, 1)
    Alias_NPC_Group00.RemoveFromFaction(REPlayerFriend)
    Alias_NPC_Group00.StartCombatAll(Game.GetPlayer())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
OE_KT_UCTrainingExercise_Scene02.Start()

ObjectReference[] Marines = Alias_NPC_Group00.GetArray()

int i = 0

While i < Marines.Length
    (Marines[i] as Actor).RemoveFromFaction(REPlayerFriend)
    (Marines[i] as Actor).EvaluatePackage()
    Alias_NPC_Group02.AddRef(Marines[i])
    i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
OE_KT_UCTrainingExercise_Scene02.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
OE_KT_UCTrainingExercise_MoveTo.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property OE_KT_UCTrainingExercise_MoveTo Auto Const Mandatory

Scene Property OE_KT_UCTrainingExercise_Scene01 Auto Const Mandatory

RefCollectionAlias Property Alias_ModelA_Group Auto Const Mandatory

RefCollectionAlias Property Alias_ModelS_Grouip Auto Const Mandatory

Faction Property UnitedColoniesMarineFaction Auto Const Mandatory

Scene Property OE_KT_UCTrainingExercise_Scene02 Auto Const Mandatory

ReferenceAlias Property Alias_NPC00 Auto Const Mandatory

ReferenceAlias Property Alias_NPC01 Auto Const Mandatory

ReferenceAlias Property Alias_NPC02 Auto Const Mandatory

Faction Property OE_GroupEnemyFaction Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ReferenceAlias Property Alias_NPC04 Auto Const Mandatory

ReferenceAlias Property Alias_NPC03 Auto Const Mandatory

RefCollectionAlias Property Alias_NPC_Group00 Auto Const Mandatory

Faction Property REPlayerFriend Auto Const Mandatory

RefCollectionAlias Property Alias_NPC_Group01 Auto Const Mandatory

RefCollectionAlias Property Alias_NPC_Group02 Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Perk Property OE_KT_ModDamageResistancePerk Auto Const Mandatory
