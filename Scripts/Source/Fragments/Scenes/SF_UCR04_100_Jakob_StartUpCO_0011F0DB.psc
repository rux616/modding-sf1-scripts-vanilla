;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_UCR04_100_Jakob_StartUpCO_0011F0DB Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
int iRemainder 
int iTimesCompleted = UCR04_TimesCompleted.GetValueInt() 
int iFrequency = UCR04_ReminderFrequency.GetValueInt()
iRemainder = iTimesCompleted % iFrequency
debug.trace("UCR04: iRemainder: " + iRemainder + ". iTimesCompleted: "+ iTimesCompleted + ". iFrequency: " + iFrequency)
UCR04_ReminderCount.SetValue(iRemainder)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property UCR04_ReminderCount Auto Const Mandatory

GlobalVariable Property UCR04_TimesCompleted Auto Const Mandatory

GlobalVariable Property UCR04_ReminderFrequency Auto Const Mandatory
