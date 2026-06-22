Scriptname OutpostHarvesterFloraScript extends OutpostEventHandlerParent
{ manages creating the appropriate flora for a flora harvester }

struct ResourceGlobalData
    ; used for matching a global variable with a resource AV
    ActorValue resourceAV
    GlobalVariable resourceGlobal
endStruct

group Required_Properties
    ActorValue property OrganicResourceAV auto hidden
    { set by menu from build menu event }

    Keyword property OutpostLinkFloraPlanter auto mandatory
    { used to get planters to spawn flora }
endGroup

group Optional_Properties
    ResourceGlobalData[] property ResourceGlobals auto const
    { OPTIONAL - array of global variables to update when the builder is set to build the matching resource AV}

    float property ResourceGlobalValueToSet = 25.0 auto const
    { value to set resourceGlobal to }
endGroup

OutpostHarvesterFloraPlanterScript[] property myPlanters auto hidden ; objects to place flora in

CustomEvent CreateFloraEvent

Event OnInit()
    debug.trace(self + " OnInit")
    ; how many nodes available?
    myPlanters = GetRefsLinkedToMe(OutpostLinkFloraPlanter) as OutpostHarvesterFloraPlanterScript[]
    debug.trace(self + " myPlanters=" + myPlanters)
    ; register planters for create flora event
    int i = 0
    while i < myPlanters.Length
        myPlanters[i].RegisterForCreateFloraEvent(self)
        i += 1
    EndWhile

    UpdateResource()
EndEvent

; player has selected a new resource to build
Event OnBuilderMenuSelect(ActorValue akActorValue)
    debug.trace(self + " OnBuilderMenuSelect " + akActorValue)
    OrganicResourceAV = akActorValue
    UpdateResource()

    ; increment global if in the resource globals list
    if ResourceGlobals.Length > 0
        int resourceGlobalIndex = ResourceGlobals.FindStruct("resourceAV", OrganicResourceAV)
        if resourceGlobalIndex > -1
            ; found - update global
            GlobalVariable globalToSet = ResourceGlobals[resourceGlobalIndex].resourceGlobal
            if globalToSet &&  globalToSet.GetValue() != ResourceGlobalValueToSet
                globalToSet.SetValue(ResourceGlobalValueToSet)
            endif
        endif
    endif
endEvent

; override parent function
Function HandleOnWorkshopObjectPlaced(ObjectReference akReference)
    debug.trace(self + " OnWorkshopObjectPlaced")
EndFunction

; override parent function
Function HandleOnWorkshopObjectRemoved(ObjectReference akReference)
    debug.trace(self + " OnWorkshopObjectRemoved")
    ClearCreatedFlora()
EndFunction


function UpdateResource()
    debug.trace(self + "UpdateResource")
    CreateFlora()
endFunction

function CreateFlora()
    debug.trace(self + " CreateFlora")
    if OrganicResourceAV
        ObjectReference workshopRef = GetWorkshop()
        Flora floraToCreate = GetFloraForResource(OrganicResourceAV)
        debug.trace(self + " creating new flora refs from " + floraToCreate)
        if floraToCreate
            Var[] kargs = new Var[1]
            kargs[0] = floraToCreate
            SendCustomEvent("CreateFloraEvent", kargs)
        Else
            debug.trace(self + " WARNING: unable to create flora from resourceAV " + OrganicResourceAV)
        endif
    Else
        debug.trace(self + " not creating flora - resourceAV not set")
    endif
endFunction

function ClearCreatedFlora()
    ; send CreateFloraEvent with no flora to clear flora from planters
    Var[] kargs = new Var[1]
    kargs[0] = NONE
    SendCustomEvent("CreateFloraEvent", kargs)
endFunction
