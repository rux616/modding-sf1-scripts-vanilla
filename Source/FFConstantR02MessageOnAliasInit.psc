Scriptname FFConstantR02MessageOnAliasInit extends ReferenceAlias

Int Property InitStage = 10 Const Auto

Event OnAliasInit()
    GetOwningQuest().SetStage(InitStage)
EndEvent