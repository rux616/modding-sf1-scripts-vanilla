Scriptname LandmarkScript extends Quest

Message Property LandmarkCompleteMessage Auto Const Mandatory
GlobalVariable Property LandmarkTotal Auto Const Mandatory
GlobalVariable Property LandmarkTracker Auto Const Mandatory
LeveledItem Property Landmark_SpacesuitRewardArmor Auto Const Mandatory

Function LandmarkFound()
    ; Add one to the tracking global
    Float fLandmarksFound = LandmarkTracker.Mod(1.0)

    ; Have you found all the Landmarks?
    if ( fLandmarksFound == LandmarkTotal.GetValue() )
        ; If you've found them all - play a message and get the Spacesuit
        Game.GetPlayer().AddItem(Landmark_SpacesuitRewardArmor)
        LandmarkCompleteMessage.Show()
    EndIf
EndFunction