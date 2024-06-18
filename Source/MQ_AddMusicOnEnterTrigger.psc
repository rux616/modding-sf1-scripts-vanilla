Scriptname MQ_AddMusicOnEnterTrigger extends ObjectReference Const
{Script used for adding Music if the Player enters this trigger}

Group Required_Properties
    MusicType Property MusicToAdd Auto Const
    {The Music you are trying to play.}
EndGroup

Group Optional_Properties
    Bool Property DeleteWhenTriggered = TRUE Auto Const
    {Delete this ref when triggered - TRUE by default}
EndGroup


Event OnTriggerEnter(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer()
        MusictoAdd.Add()
    	if DeleteWhenTriggered
    		Delete()
    	endif
    EndIf
EndEvent