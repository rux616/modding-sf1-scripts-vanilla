Scriptname City_NA_JunctionBox04Script extends ReferenceAlias

ReferenceAlias Property Light_Indicator Auto Const

Quest Property City_NA_Well01 Auto Const Mandatory


Event OnActivate(ObjectReference AkActionRef)

if City_NA_Well01.GetStageDone(185) 
	

		City_NA_Well01.SetStage(190)


endif

EndEvent