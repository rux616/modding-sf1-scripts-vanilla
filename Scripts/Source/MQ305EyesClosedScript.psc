Scriptname MQ305EyesClosedScript extends Actor

Keyword Property AnimFaceArchetypeEyesClosed Mandatory Const Auto

Auto State WaitingForLoad
    Event OnLoad()
        GotoState("HasLoaded")
        Self.ChangeAnimFaceArchetype(AnimFaceArchetypeEyesClosed)
    EndEvent
EndState

State HasLoaded
    Event OnLoad()
        ;do nothing
    EndEvent
EndState

Event OnLoad()
    ;do nothing
EndEvent