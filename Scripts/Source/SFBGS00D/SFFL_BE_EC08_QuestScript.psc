Scriptname SFBGS00D:SFFL_BE_EC08_QuestScript extends Quest
{Utility script to use in EC08 BEs}

LocationAlias Property EnemyShipInteriorLocation Auto Const Mandatory

Keyword Property LocTypeShowSpacesuit Auto Const Mandatory

GlobalVariable Property BE_EC08_NoConnection Auto Const Mandatory

RefCollectionAlias Property LockableDoors Auto Const Mandatory

RefCollectionAlias Property InteriorLights Auto Const Mandatory

Int Property minLightOffInterval = 3 Auto Const
{Minimum number of consecutive lights in collection before one of them is off.}

Int Property maxLightOffInterval = 6 Auto Const
{Maximum number of consecutive lights in collection before one of them is off.}

Int Property maxConsecutiveLightsOff = 2 Auto Const
{Maximum number of consecutive lights off.}

Event OnQuestInit()
    ;Force spacesuit for this Location
    Location enemyShipInterior = EnemyShipInteriorLocation.GetLocation()
    enemyShipInterior.AddKeyword(LocTypeShowSpacesuit)
EndEvent

Function EmergencyMenu(float emergencyMenuChance)
    if (Utility.RandomFloat() <= emergencyMenuChance)
        BE_EC08_NoConnection.SetValue(0)
        LockableDoors.Lock()
    else
        BE_EC08_NoConnection.SetValue(1)
    endif
EndFunction

Function TurnOffLights()
    InteriorLights.RefillAlias()

    ;Turn off some of the interior lights
    int lightCount = InteriorLights.GetCount()
    ;Debug.Trace("Counted " + lightCount + " lights in total.")

    int lightOffInterval = Utility.RandomInt(minLightOffInterval,maxLightOffInterval)
    Debug.Trace("lightOffInterval value: " + lightOffInterval)
    int consecutiveLightOff = Utility.RandomInt(0,maxConsecutiveLightsOff)
    Debug.Trace("consecutiveLightOff value: " + consecutiveLightOff)
    int consecutiveCounter = consecutiveLightOff

    if (lightOffInterval > 0)
        while (lightCount > 0)
            InteriorLights.GetAt(lightCount - 1).Disable()
            if (consecutiveCounter > 0)
                lightCount -= 1
                consecutiveCounter -= 1
            else
                lightCount -= (lightOffInterval + 1)
                consecutiveCounter = consecutiveLightOff
            endif
        endwhile
    endif
EndFunction
