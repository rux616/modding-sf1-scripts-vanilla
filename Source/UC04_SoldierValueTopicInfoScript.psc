Scriptname UC04_SoldierValueTopicInfoScript extends TopicInfo

ReferenceAlias Property FireTeamMarine Mandatory Const Auto
{Ref alias for the standard Fire Team Marine}

ReferenceAlias Property FireTeamMarineCaptain Mandatory Const Auto
{Ref alias for the Fire Team Marine Captain}

ActorValue Property UC04_SoldierPackageValue Mandatory Const Auto
{Actor value used to manage the team's behavior}

int Property ActivityValue Mandatory Const Auto
{What value this topic should set on the marines}

Weapon Property WeaponToEquip Const Auto
{If the soldier needs to equip a different weapon, have them do so here}

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
    Actor MarineCaptain = FireTeamMarineCaptain.GetActorRef()
    Actor Marine = FireTeamMarine.GetActorRef()

    Marine.SetValue(UC04_SoldierPackageValue, ActivityValue)
    MarineCaptain.SetValue(UC04_SoldierPackageValue, ActivityValue)

    if WeaponToEquip != none && !MarineCaptain.IsEquipped(WeaponToEquip)
        MarineCaptain.EquipItem(WeaponToEquip)
    endif

    if WeaponToEquip != none && !Marine.IsEquipped(WeaponToEquip)
        Marine.EquipItem(WeaponToEquip)
    endif

    Marine.EvaluatePackage()
    MarineCaptain.EvaluatePackage()
EndEvent