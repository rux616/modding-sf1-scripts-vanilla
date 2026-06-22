;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_TestJeffBPackageMourn_000015FF Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
bool doOnce = false
int rand = utility.RandomInt(0,2)
if(doOnce == false)
    doOnce = TRUE
    if(rand==0)
        akActor.placeAtMe(myIdleMarker, 1)
    elseif(rand==1)
        akActor.placeAtMe(myfurniture1,1)
    else
        akActor.placeAtMe(myFurniture2, 1)
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

IdleMarker Property myIdleMarker Auto Const

Furniture Property myfurniture1 Auto Const

Furniture Property myFurniture2 Auto Const
