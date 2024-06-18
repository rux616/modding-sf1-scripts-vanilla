Scriptname COM_SamCoe_Q01_JaylenAliasScript extends ReferenceAlias

Cell Property CityNeonFreestarRanger Mandatory Const Auto
{Cell where Jaylen should be during Sam's quest}

int Property DisallowTeleport = 215 Const Auto
{If this stage has been set, stop trying to teleport Price}

int Property AllowTeleport = 400 Const Auto
{If this stage has been set, resume teleporting of Price}

ObjectReference Property TeleportTarget Mandatory Const Auto
{Where to teleport Price if criteria is met}

Quest Property FC04 Mandatory Const Auto
{Used to turn off Jaylen's teleport if FC04 is running and still needs him}

int Property FC04BlockingCompletionStage = 900 Const Auto
{If this stage is done on FC04, the quest no longer needs him and it's fine to teleport him}

Event OnUnload()

    ObjectReference JaylenREF = GetRef()
    Quest OwningQuest = GetOwningQuest()

    if (!FC04.IsRunning() || FC04.GetStageDone(FC04BlockingCompletionStage)) && !OwningQuest.GetStageDone(DisallowTeleport) && OwningQuest.GetStageDone(AllowTeleport) && JaylenREF.GetParentCell() != CityNeonFreestarRanger
        JaylenREF.Moveto(TeleportTarget)
    endif   

EndEvent