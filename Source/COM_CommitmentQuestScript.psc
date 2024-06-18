Scriptname COM_CommitmentQuestScript extends Quest

ReferenceAlias Property CompanionAlias Mandatory Const Auto
ReferenceAlias Property CommitmentGiftAlias Mandatory Const Auto
MiscObject Property CommitmentGift Mandatory Const Auto
Quest Property SQ_Companions Mandatory Const Auto

Function GiveCommitmentGift()
    Game.GetPlayer().AddAliasedItem(CommitmentGift, CommitmentGiftAlias, abSilent = False)
    (SQ_Companions as SQ_CompanionsScript).CommitmentGifts.AddRef(CommitmentGiftAlias.GetRef())
EndFunction

Function MakeCommitted()
    (CompanionAlias.GetActorReference() as CompanionActorScript).COM_CompanionQuest.MakeCommitted()
EndFunction

