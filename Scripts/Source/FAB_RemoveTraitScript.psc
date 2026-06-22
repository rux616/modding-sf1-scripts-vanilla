Scriptname FAB_RemoveTraitScript extends TopicInfo

Perk Property PerkToRemove Auto Const

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
    Game.GetPlayer().RemovePerk(PerkToRemove)
endEvent