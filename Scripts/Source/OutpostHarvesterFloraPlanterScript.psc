Scriptname OutpostHarvesterFloraPlanterScript extends ObjectReference
{script for placing flora at nodes}

String property FloraNodeName = "FloraNode" auto const
{ base node name for flora in "planters" }

int property FloraNodeMax = 8 auto Const
{ max number of nodes in any planter (used to create node name string) }

ActorValue property HandScannerTarget auto mandatory
{ used to tag created flora }

float property FloraScaleMin = 0.15 auto Const
{ possibly temp - we may get this from an actor value on the Flora object that we are spawning }

float property FloraScaleMax = 0.25 auto Const
{ possibly temp - we may get this from an actor value on the Flora object that we are spawning }

ObjectReference[] property createdFlora auto hidden ; my flora

Event OnInit()
    createdFlora = new ObjectReference[0]
EndEvent

; called from OutpostHarvesterFloraScript on init
Function RegisterForCreateFloraEvent(OutpostHarvesterFloraScript myHarvester)
    RegisterForCustomEvent(myHarvester, "CreateFloraEvent")
EndFunction

Event OutpostHarvesterFloraScript.CreateFloraEvent(OutpostHarvesterFloraScript akSender, Var[] akArgs)
	Flora floraToCreate = akArgs[0] as Flora
	debug.trace(self + " CreateFloraEvent event received: floraToCreate=" + floraToCreate)
    CreateFlora(floraToCreate)
EndEvent

Guard CreateFloraGuard ProtectsFunctionLogic

; create flora for the specified planter
function CreateFlora(Flora floraToCreate)
    debug.trace(self + " CreateFlora " + floraToCreate)
    LockGuard CreateFloraGuard
        
        ClearCreatedFlora()
        if floraToCreate
            int i = 1
            while i <= FloraNodeMax
                string nodeName = FloraNodeName
                if i < 10
                    nodeName = nodeName + "0"
                endif
                nodeName = nodeName + i
                debug.trace(self + " checking for node " + nodeName)
                if HasNode(nodeName)
                    ObjectReference createdFloraRef = PlaceAtNode(nodeName, floraToCreate, 1, abInitiallyDisabled = true, abAttach=true)
                    ; add to our array
                    createdFlora.Add(createdFloraRef)
                    createdFloraRef.SetHarvested(true)
                    createdFloraRef.SetValue(HandScannerTarget, 1)
                    float scale = Utility.RandomFloat(FloraScaleMin, FloraScaleMax)
                    createdFloraRef.SetScale(scale)
                    createdFloraRef.Enable()
                    ; don't let player scan these
                    createdFloraRef.SetScanned(true)

                    debug.trace(self + " created flora " + createdFloraRef + " at node " + nodeName)
                EndIf
                i += 1
            EndWhile
        endif
    EndLockGuard
endFunction

function ClearCreatedFlora() RequiresGuard(CreateFloraGuard) 
    debug.trace(self + " ClearCreatedFlora")
    int i = 0
    while createdFlora.Length > 0
        ClearCreatedFloraSingle(createdFlora[0])
        createdFlora.Remove(0)
    EndWhile
endFunction

function ClearCreatedFloraSingle(ObjectReference createdFloraRef) RequiresGuard(CreateFloraGuard) 
    debug.trace(self + " ClearCreatedFloraSingle " + createdFloraRef)
    if (createdFloraRef != None)
        createdFloraRef.Delete()
        createdFloraRef = NONE
    endif
endFunction
