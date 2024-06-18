Scriptname setOutfitForRefAlias extends ReferenceAlias

Outfit Property OutfitToEquip Auto Const

Event OnLoad()
    self.getActorReference().setOutfit(OutfitToEquip)
EndEvent