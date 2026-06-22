Scriptname WalkInWaterFX extends ObjectReference 
{Add an fx when in the water}

Activator Property pLibertyPrimeWaterSplash Auto Const
race Property LibertyPrimeRace Auto Const

int Property WaterHeight = 450 Auto 

bool playFX = false

ObjectReference mySplash

actor primeIntrigger

Event OnTriggerEnter(ObjectReference akActionRef)


    if  (akActionRef as actor).GetRace() == LibertyPrimeRace && playFX == false
    	primeIntrigger = (akActionRef as actor)
		playFX = true
		mySplash = primeIntrigger.placeatme(pLibertyPrimeWaterSplash)
	endIf
    
    while playFX == true
    	mySplash.SetPosition(primeIntrigger.GetPositionX(), primeIntrigger.GetPositionY(), WaterHeight)
    	utility.wait(0.05)
	endWhile

EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
    if  (akActionRef as actor).GetRace() == LibertyPrimeRace && playFX == true
		playFX = false
		mySplash.playAnimation("StopEffect")
		utility.wait(0.3)
		mySplash = none
		mySplash.delete()
	endIf
EndEvent
