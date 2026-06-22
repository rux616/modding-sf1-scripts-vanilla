Scriptname TestAddSkillOnActivateScript extends ObjectReference Const
{adds a skill on activate for testing}

Perk property PerkToAdd auto const mandatory
ConditionForm property AddPerkCondition auto Const

Event OnActivate(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
        if AddPerkCondition && AddPerkCondition.IsTrue(Game.GetPlayer())
            Game.GetPlayer().AddPerk(PerkToAdd)
        endif
    EndIf
EndEvent