Scriptname MQTutorialPlayerCraftScript extends ReferenceAlias

Int Property StageToSet=100 Const Auto

;we only care if the player crafts or mods anything
Event OnPlayerModArmorWeapon(Form akBaseObject, ObjectMod akModBaseObject)
    GetOwningQuest().SetStage(StageToSet)
endEvent

Event OnPlayerCraftItem(ObjectReference akBench, Location akLocation, Form akCreatedItem)
    GetOwningQuest().SetStage(StageToSet)
endEvent