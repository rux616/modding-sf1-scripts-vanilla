;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_LC102Combat_0009CBC7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE LC102CombatQuestScript
Quest __temp = self as Quest
LC102CombatQuestScript kmyQuest = __temp as LC102CombatQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetTargetQuestStage()

Alias_LC102Passengers.SetValue(pSpeedMult, 100)

Alias_LifeSupportMachine01Activator.GetRef().BlockActivation(true, true)
Alias_LifeSupportMachine02Activator.GetRef().BlockActivation(true, true)
Alias_LifeSupportMachine03Activator.GetRef().BlockActivation(true, true)

ObjectReference[] doorRefs = Alias_LC102DoorsToLock.GetArray()

int i = 0
while(i < doorRefs.Length)
    doorRefs[i].SetLockLevel(254)
    i += 1
endWhile

if(!Alias_EngineeringDeckTrigger.GetRef().IsInTrigger(Game.GetPlayer()))

	ObjectReference[] engineeringDoorRefs = Alias_LC102DoorsToLockEngineeringDeck.GetArray()

	i = 0
	while(i < engineeringDoorRefs .Length)
    		engineeringDoorRefs [i].SetLockLevel(254)
		i += 1
	endWhile
endIf

EvaluateDoorForCloseAndLock(Alias_LC102DoorToBallroomKitchen.GetRef(), Alias_LC102DoorToBallroomKitchenTrigger.GetRef())

EvaluateDoorForCloseAndLock(Alias_LC102DoorToEngineeringLevel.GetRef(), Alias_LC102DoorToEngineeringLevelTrigger.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_LC102DoorsToLock Auto Const Mandatory

ReferenceAlias Property Alias_LC102DoorToBallroomKitchen Auto Const Mandatory

ReferenceAlias Property Alias_LC102DoorToBallroomKitchenTrigger Auto Const Mandatory

ReferenceAlias Property Alias_LC102DoorToEngineeringLevel Auto Const Mandatory

ReferenceAlias Property Alias_LC102DoorToEngineeringLevelTrigger Auto Const Mandatory

function EvaluateDoorForCloseAndLock(ObjectReference doorRef, ObjectReference triggerRef)
    if(triggerRef != None)
        if(triggerRef.IsInTrigger(Game.GetPlayer()) == true)
            return
        endIf
    endIf

    doorRef.SetOpen(false)
    doorRef.SetLockLevel(254)
    doorRef.Lock()
endFunction



ReferenceAlias Property Alias_LifeSupportMachine01Activator Auto Const Mandatory

ReferenceAlias Property Alias_LifeSupportMachine02Activator Auto Const Mandatory

ReferenceAlias Property Alias_LifeSupportMachine03Activator Auto Const Mandatory

ReferenceAlias Property Alias_EngineeringDeckTrigger Auto Const Mandatory

RefCollectionAlias Property Alias_LC102DoorsToLockEngineeringDeck Auto Const Mandatory

RefCollectionAlias Property Alias_LC102Passengers Auto Const Mandatory

ActorValue Property pSpeedMult Auto Const Mandatory
