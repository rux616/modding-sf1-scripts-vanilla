Scriptname OutpostCargoLinkMarkerScript extends ObjectReference conditional
{holds data about the specifics of this cargo link}

SQ_OutpostCargoLinkScript property SQ_OutpostCargoLink auto const mandatory

ActorValue Property CarryWeight auto const mandatory
{ actor value to set on myself for code to use as default ship carry weight }

ActorValue Property OutpostCargoLinkAnimState auto const mandatory
{ actor value to set on myself for code to use as default ship carry weight }

float property SpaceshipDefaultCarryWeight = 300.0 auto Const
{ value to set }

SpaceshipBase property OutpostCargoLinkShip auto const mandatory
{ spaceship base for my cargo ship }

bool property RequiresFuel = false auto Const

bool property CreateShipAtCargoLink01 = true auto const
{ if true, create ship at cargo link 01 - the one the player is at
  if false, create ship at cargo link 02 - the "other" cargo link }

Keyword property CargoLinkMenuKeyword auto Const
{ OPTIONAL - if included, pass this in to ShowWorkshopTargetMenu }

Keyword property OutpostCargoLinkLightsKeyword auto Const Mandatory
{ used to get linked lights on cargo link }

Form property SpecificCargo auto hidden
{ used only for Supply missions - if set, only move this type of cargo between cargo links - updated by supply mission  }

int property SpecificCargoMax auto hidden
{ used only for supply missions - max amount of cargo to take - updated by supply mission }

bool property isLinked = false auto hidden conditional ; set to true when linked to something

CustomEvent SetAnimationStateEvent

Event OnInit()
    SetValue(CarryWeight, SpaceshipDefaultCarryWeight)
    if RequiresFuel
        AddKeyword(SQ_OutpostCargoLink.OutpostProductionHalted) ; so it doesn't consume fuel until linked
    endif
EndEvent

Event OnLoad()
    ; restore current animation state
    int animStateID = GetValueInt(OutpostCargoLinkAnimState)
    SQ_OutpostCargoLinkScript:animData theData = SQ_OutpostCargoLink.GetAnimationData(animStateID)
    SetAnimationState(animStateID, theData)
EndEvent

Event OnWorkshopCargoLinkChanged(ObjectReference akOldTarget, ObjectReference akNewTarget)
    debug.trace(self + " OnWorkshopCargoLinkChanged akOldTarget=" + akOldTarget + " akNewTarget=" + akNewTarget)
    if akNewTarget != akOldTarget
        ; something has changed

        ; clear old cargo link if there is one
        if akOldTarget
            SQ_OutpostCargoLink.ClearCargoLink(self, akOldTarget)
        endif

        if akNewTarget
            ; update cargo link to new target
            if SQ_OutpostCargoLink.CreateCargoLink(self, akNewTarget) == false
                ; error of some kind - couldn't create ship, most likely because marker was in use
                ; undo whatever got linked
                SQ_OutpostCargoLink.ClearCargoLink(self, akNewTarget)
            endif
        endif

        SQ_OutpostCargoLink.SendOutpostCargoLinkChangedEvent(GetWorkshop(), self, akOldTarget, akNewTarget)
    endif
endEvent

Event OnWorkshopObjectRemoved(ObjectReference akActionRef)
    debug.trace(self + " OnWorkshopObjectRemoved akActionRef=" + akActionRef)
    ; clear cargo link
    SQ_OutpostCargoLink.ClearCargoLink(self, NONE)
endEvent

Guard animationStateGuard ProtectsFunctionLogic
function SetAnimationState(int stateID, SQ_OutpostCargoLinkScript:animData theData)
    debug.trace(self + " SetAnimationState " + theData + " is3dloaded=" + Is3DLoaded())
    LockGuard animationStateGuard
        ; record state (for initializing when loaded)
        SetValue(OutpostCargoLinkAnimState, stateID)
        ; send custom event that lights have registered for
        Var[] kargs = new Var[1]
        kargs[0] = theData
        SendCustomEvent("SetAnimationStateEvent", kargs)
    EndLockGuard
endFunction
