Scriptname SQ_CCT_Enviro_AmbusherScript extends Quest

Scene property SQ_CCT_Enviro_AmbusherScene auto const mandatory
{ scene to start once target is initialized }

struct AmbushData
    ReferenceAlias AmbushMarker
    ReferenceAlias Prey
endStruct

AmbushData[] property AmbushMarkers auto const mandatory
{ array of ambush markers and nearest prey }

ReferenceAlias property BehaviorActor auto const mandatory
{ ambusher }

ReferenceAlias property BehaviorTarget auto const mandatory
{ ambush marker to use - fill in with one that's farthest from prey }

RefCollectionAlias property BehaviorActorHerd auto const
{ OPTIONAL - used for herd actors }

Event OnQuestStarted()
    Objectreference actorRef = BehaviorActor.GetRef()
    Objectreference targetRef = BehaviorTarget.GetRef()
    debug.trace(self + " OnQuestStarted BehaviorActor="+ actorRef + ", BehaviorTarget=" + targetRef + " distance=" + targetRef.GetDistance(actorRef))
    ; temp
    debug.trace(self + "    BehaviorActorHerd:")
    int h = 0
    while h < BehaviorActorHerd.GetCount()
        debug.trace(self + "     " + BehaviorActorHerd.GetActorAt(h) + " distance from main actor=" + BehaviorActorHerd.GetActorAt(h).GetDistance(actorRef))
        h += 1
    endWhile
    ; find ambush marker with prey that's furthest from it, to give predator best chance of getting there first
    float minDistance = 0.0
    ObjectReference bestMarker = None

    int i = 0
    while i < AmbushMarkers.Length
        ObjectReference ambushMarker = AmbushMarkers[i].AmbushMarker.GetRef()
        ObjectReference preyRef = AmbushMarkers[i].Prey.GetRef()
        debug.trace(self + " ambushMarker=" + ambushMarker + " preyRef=" + preyRef)
        if ambushMarker && preyRef
            float preyDistance = ambushMarker.GetDistance(preyRef)
            debug.trace(self + "    distance=" + preyDistance)
            if preyDistance > minDistance
                minDistance = preyDistance
                bestMarker = ambushMarker
                debug.trace(self + "    This is current max, picking marker " + bestMarker)
            endif
        endif
        i += 1
    EndWhile

    if bestMarker
        debug.trace(self + " Updating target marker to " + bestMarker)
        BehaviorTarget.ForceRefTo(bestMarker)
    endif

    SQ_CCT_Enviro_AmbusherScene.Start()
EndEvent

