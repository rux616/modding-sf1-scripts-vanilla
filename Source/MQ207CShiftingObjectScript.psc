Scriptname MQ207CShiftingObjectScript extends ObjectReference
{Script for shifting triggers and distortions in MQ207C.}
;
;MQ207CShiftingQuestScript handles the actual shifting. This script just stores ref-specific data.

int property PrereqStage = -1 Auto Const
{Default: -1. For triggers, if this stage has not been set, don't shift the player when they enter this trigger.}

int property TurnOffStage = -1 Auto Const
{Default: -1. For triggers, if this or any higher stage has been set, don't shift the player when they enter this trigger.}

int property StageToSetOnShift = -1 Auto Const
{Default: -1. Stage to set on MQ207C when the player shifts using this object.}

bool property ShouldForceFallback = False Auto Const
{Default = False. When the player shifts using this object, should we force the fallback behavior instead of shifting them in place?}