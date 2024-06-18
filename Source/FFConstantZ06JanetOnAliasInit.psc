Scriptname FFConstantZ06JanetOnAliasInit extends ReferenceAlias

Int Property InitStage = 1 Const Auto

Event OnAliasInit()
    GetOwningQuest().SetStage(InitStage)
EndEvent