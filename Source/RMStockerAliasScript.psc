Scriptname RMStockerAliasScript extends ReferenceAlias

ActorValue Property ActorShouldHideSpacesuitHelmetCosmeticBreathable_AV Mandatory Const Auto

Event OnLoad()
    GetActorRef().SetValue(ActorShouldHideSpacesuitHelmetCosmeticBreathable_AV, 1)
EndEvent