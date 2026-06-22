;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_MS01_CrimeDialogue_02034E5D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
ObjectReference BallotBox = Alias_BallotBox.GetRef()
ObjectReference StoredVotes = Alias_VoteStorageContainer.GetRef()
BallotBox.BlockActivation(true, true)
BallotBox.RemoveAllItems()
SFFL_MS01_CrimeDialogue_Vote.Start()

int NoteCount1 = StoredVotes.GetItemCount(SFFL_MS01_Note_ExecutionVote)
int NoteCount2 = StoredVotes.GetItemCount(SFFL_MS01_Note_ExileVote)
int NoteCount3 = StoredVotes.GetItemCount(SFFL_MS01_Note_ExonerateVote)

BallotBox.AddItem(SFFL_MS01_Note_ExecutionVote, NoteCount1)
BallotBox.AddItem(SFFL_MS01_Note_ExileVote, NoteCount2)
BallotBox.AddItem(SFFL_MS01_Note_ExonerateVote, NoteCount3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
Utility.Wait(0.5)
int crimeGold = SFFL_MS01_NewBabylonFaction.GetCrimeGold()
if crimeGold > SFFL_MS01_CrimeGoldGlobal.GetValue()
    SFFL_MS01_CrimeDialogue_Vote.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
int Bounty = SFFL_MS01_CrimeGold_Amount.GetValueInt()
ObjectReference PlayerRef = Game.GetPlayer()

PlayerRef.RemoveItem(Credits, Bounty)

SFFL_MS01_NewBabylonFaction.SetCrimeGold(0)
SFFL_MS01_NewBabylonFaction.SetCrimeGoldViolent(0)
SQ_Parent.SendContrabandConfiscatedEvent(SFFL_MS01_NewBabylonFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()
PlayerRef.AddToFaction(SFFL_MS01_NewBabylonFaction)

Actor GuardRef = Alias_Guard.GetActorRef()
GuardRef.SetValue(Aggression, 1)
GuardRef.StartCombat(PlayerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
ObjectReference StolenItems = Alias_StolenItemsContainer.GetRef()
int NoteCount1 = StolenItems.GetItemCount(SFFL_MS01_Note_ExecutionVote)
int NoteCount2 = StolenItems.GetItemCount(SFFL_MS01_Note_ExileVote)
int NoteCount3 = StolenItems.GetItemCount(SFFL_MS01_Note_ExonerateVote)

StolenItems.RemoveItem(SFFL_MS01_Note_ExecutionVote, NoteCount1, akOtherContainer = Alias_BallotBox.GetRef())
StolenItems.RemoveItem(SFFL_MS01_Note_ExileVote, NoteCount2, akOtherContainer = Alias_BallotBox.GetRef())
StolenItems.RemoveItem(SFFL_MS01_Note_ExonerateVote, NoteCount3, akOtherContainer = Alias_BallotBox.GetRef())

SFFL_MS01_CrimeDialogue_Vote.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
ObjectReference BallotBox = Alias_BallotBox.GetRef()
ObjectReference StoredVotes = Alias_VoteStorageContainer.GetRef()
BallotBox.BlockActivation(true, true)
BallotBox.RemoveAllItems()

int NoteCount1 = StoredVotes.GetItemCount(SFFL_MS01_Note_ExecutionVote)
int NoteCount2 = StoredVotes.GetItemCount(SFFL_MS01_Note_ExileVote)
int NoteCount3 = StoredVotes.GetItemCount(SFFL_MS01_Note_ExonerateVote)

BallotBox.AddItem(SFFL_MS01_Note_ExecutionVote, NoteCount1)
BallotBox.AddItem(SFFL_MS01_Note_ExileVote, NoteCount2)
BallotBox.AddItem(SFFL_MS01_Note_ExonerateVote, NoteCount3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SFFL_MS01_NewBabylonFaction.SetCrimeGold(0)
Alias_NewBabylonResidents.StopCombatAlarm()
Alias_NewBabylonResidents.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property SFFL_MS01_CrimeGold_Amount Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Faction Property SFFL_MS01_NewBabylonFaction Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Faction Property SFFL_MS01_NewBabylonEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_Guard Auto Const Mandatory

Book Property SFFL_MS01_Note_ExecutionVote Auto Const Mandatory

Book Property SFFL_MS01_Note_ExileVote Auto Const Mandatory

Book Property SFFL_MS01_Note_ExonerateVote Auto Const Mandatory

ReferenceAlias Property Alias_BallotBox Auto Const Mandatory

Scene Property SFFL_MS01_CrimeDialogue_Vote Auto Const Mandatory

ReferenceAlias Property Alias_StolenItemsContainer Auto Const Mandatory

sq_parentscript Property SQ_Parent Auto Const Mandatory

ReferenceAlias Property Alias_VoteStorageContainer Auto Const Mandatory

RefCollectionAlias Property Alias_NewBabylonResidents Auto Const Mandatory

Quest Property SFFL_MS01_Quest Auto Const Mandatory

GlobalVariable Property SFFL_MS01_CrimeGoldGlobal Auto Const Mandatory
