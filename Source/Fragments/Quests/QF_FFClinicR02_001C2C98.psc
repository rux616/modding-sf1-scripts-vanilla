;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFClinicR02_001C2C98 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE FFClinicR02QuestScript
Quest __temp = self as Quest
FFClinicR02QuestScript kmyQuest = __temp as FFClinicR02QuestScript
;END AUTOCAST
;BEGIN CODE
FFClinicR02ResourceNumber.SetValueInt(Utility.RandomInt(1,8))

if FFClinicR02ResourceNumber.GetValue() == 1
	Game.GetPlayer().PlaceAtMe(OrgCommonToxin,  abForcePersist=false, abInitiallyDisabled=true, abDeleteWhenAble=true, akAliasToFill = Alias_ResourceAlias)
	FFClinicR02ItemTotal.SetValueInt(10)
elseif FFClinicR02ResourceNumber.GetValue() == 2
	Game.GetPlayer().PlaceAtMe(OrgCommonSealant,  abForcePersist=false, abInitiallyDisabled=true, abDeleteWhenAble=true, akAliasToFill = Alias_ResourceAlias)
	FFClinicR02ItemTotal.SetValueInt(10)
elseif FFClinicR02ResourceNumber.GetValue() == 3
	Game.GetPlayer().PlaceAtMe(OrgUncommonMembrane,  abForcePersist=false, abInitiallyDisabled=true, abDeleteWhenAble=true, akAliasToFill = Alias_ResourceAlias)
	FFClinicR02ItemTotal.SetValueInt(7)
elseif FFClinicR02ResourceNumber.GetValue() == 4
	Game.GetPlayer().PlaceAtMe(OrgUncommonAntibiotic,  abForcePersist=false, abInitiallyDisabled=true, abDeleteWhenAble=true, akAliasToFill = Alias_ResourceAlias)
	FFClinicR02ItemTotal.SetValueInt(7)
elseif FFClinicR02ResourceNumber.GetValue() == 5
	Game.GetPlayer().PlaceAtMe(OrgRareAnalgesic,  abForcePersist=false, abInitiallyDisabled=true, abDeleteWhenAble=true, akAliasToFill = Alias_ResourceAlias)
	FFClinicR02ItemTotal.SetValueInt(5)
elseif FFClinicR02ResourceNumber.GetValue() == 6
	Game.GetPlayer().PlaceAtMe(OrgRareSedative,  abForcePersist=false, abInitiallyDisabled=true, abDeleteWhenAble=true, akAliasToFill = Alias_ResourceAlias)
	FFClinicR02ItemTotal.SetValueInt(5)
elseif FFClinicR02ResourceNumber.GetValue() == 7
	Game.GetPlayer().PlaceAtMe(OrgExoticNarcotic,  abForcePersist=false, abInitiallyDisabled=true, abDeleteWhenAble=true, akAliasToFill = Alias_ResourceAlias)
	FFClinicR02ItemTotal.SetValueInt(3)
elseif FFClinicR02ResourceNumber.GetValue() == 8
	Game.GetPlayer().PlaceAtMe(OrgExoticBiosuppressant,  abForcePersist=false, abInitiallyDisabled=true, abDeleteWhenAble=true, akAliasToFill = Alias_ResourceAlias)
	FFClinicR02ItemTotal.SetValueInt(3)
endif

kmyquest.CalculateRewards()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE FFClinicR02QuestScript
Quest __temp = self as Quest
FFClinicR02QuestScript kmyQuest = __temp as FFClinicR02QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.RemoveResourceItems()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE FFClinicR02QuestScript
Quest __temp = self as Quest
FFClinicR02QuestScript kmyQuest = __temp as FFClinicR02QuestScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
;add 1 to completion amount
FFClinicR02CompletionNumber.Mod(1)

;reset global for item count
Utility.Wait(1)
FFClinicR02ItemCount.SetValueInt(0)

;set ffclinicr02dayspassed global
FFClinicR02DaysPassed.SetValue(GameDaysPassed.GetValue() + 1)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property OrgCommonToxin Auto Const Mandatory

MiscObject Property OrgUncommonAntibiotic Auto Const Mandatory

MiscObject Property OrgUncommonMembrane Auto Const Mandatory

MiscObject Property OrgCommonSealant Auto Const Mandatory

MiscObject Property OrgRareAnalgesic Auto Const Mandatory

MiscObject Property OrgRareSedative Auto Const Mandatory

MiscObject Property OrgExoticNarcotic Auto Const Mandatory

MiscObject Property OrgExoticBiosuppressant Auto Const Mandatory

ReferenceAlias Property Alias_ResourceAlias Auto Const Mandatory

GlobalVariable Property FFClinicR02ResourceNumber Auto Const Mandatory

GlobalVariable Property FFClinicR02ItemTotal Auto Const Mandatory

GlobalVariable Property FFClinicR02ItemCount Auto Const Mandatory

GlobalVariable Property FFClinicR02CompletionNumber Auto Const

GlobalVariable Property FFClinicR02DaysPassed Auto Const Mandatory

GlobalVariable Property GameDaysPassed Auto Const Mandatory
