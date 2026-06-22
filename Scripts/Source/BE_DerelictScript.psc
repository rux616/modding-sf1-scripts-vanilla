Scriptname BE_DerelictScript extends Quest

{Script to handle additional derelict functions}

ReferenceAlias Property ModuleCockpit Auto Const Mandatory
{The module cockpit.}

Group MusicProperties CollapsedOnBase
    MusicType[] Property MusicTrack Auto Const
    {The array of music tracks.}

    int Property TrackNumber Auto
    {The music track number in the array we will play.}

    bool property RandomTrack = false Auto
    {Default=false. Do we want to play a random track each time the player enters the cell?}
endGroup

Event OnQuestStarted()
    ObjectReference enemyShipCockpit = ModuleCockpit.GetRef()

    ;Unregistered when quest is stopped
    RegisterForRemoteEvent(enemyShipCockpit, "OnCellAttach")
    RegisterForRemoteEvent(enemyShipCockpit, "OnCellDetach")
endEvent

Event ObjectReference.OnCellAttach(ObjectReference akSource)
    if RandomTrack == true
        TrackNumber = Utility.RandomInt(0, MusicTrack.Length)
    endif
    PlayMusic(MusicTrack[TrackNumber], true)
endEvent 

Event ObjectReference.OnCellDetach(ObjectReference akSource)
    PlayMusic(MusicTrack[TrackNumber], false)
endEvent 

Function PlayMusic(MusicType MusicTrack, bool abPlay)
	if abPlay == true
		MusicTrack[TrackNumber].Add()
	else
		MusicTrack[TrackNumber].Remove()
	endif
endFunction