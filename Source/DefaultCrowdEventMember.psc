Scriptname DefaultCrowdEventMember extends Actor Default
{Data for how this actor should respond to events sent by a DefaultCrowdEventManager}

Struct EventDatum
	keyword EventKeyword
	{Keyword representing the event to respond to}

	keyword EventTopicSubType
	{Topic SubType keyword to say when responding to the event}

	int EventChanceToRespond = 75
	{0-100, chance to respond to this event}

	float MinResponseDelay = 0.0
	{In seconds, minimum amount of time to wait before responding to event}

	float MaxResponseDelay = 3.0
	{In seconds, maximum amount of time to wait before responding to event}

	float CoolDown = 3.0
	{In seconds, the time to wait before responding to any event after this event has been responded to}

	bool RequireToFaceEitherEventRef = true
	{Does the actor need to be facing one of the EventRefs to respond?
	Note: this does NOT cause the actor to face the EventRefs, just ignores the event if not facing}


EndStruct

Group Data

DefaultCrowdEventManager[] Property CrowdEventManagers const auto
{Pointer to quests whose CrowdEvent you are going to listen to. Quest must have a DefaultCrowdEventManager script attached.}

EventDatum[] Property EventData const auto
{Add keywords and correspond topics to say.
Note: You can define multiple responses to the same event, but they will stop processing after responding to the first event the pass for, until the cool down.
}

EndGroup

Group Quest_Properties
Quest Property ControllingQuest Auto const
int Property DisableOnStage Auto Const
EndGroup 

bool coolingDown = false

;/
Event OnInit()

	int i = 0
	while (i < CrowdEventManagers.length)
			RegisterForCustomEvent(CrowdEventManagers[i], "CrowdEvent")	
		i += 1
	endwhile
	
EndEvent
/;

Event OnLoad()

	int i = 0
	while (i < CrowdEventManagers.length)
			RegisterForCustomEvent(CrowdEventManagers[i], "CrowdEvent")	
		i += 1
	endwhile
	
EndEvent


Event DefaultCrowdEventManager.CrowdEvent(DefaultCrowdEventManager akSender, Var[] akArgs)
	;WE ASSUME that akSender is CrowdEventManager, since that's the only thing this script registers for
	;first element in akArgs array is a keyword representing the event being sent

	if !ControllingQuest.GetStageDone(DisableOnStage)

		if coolingDown
			debug.trace(self + "CoolingDown, RETURNING without responding")
			RETURN
		endif


		coolingDown = true

		float coolDown = 0.0

		DefaultCrowdEventManager:CrowdEventData myCrowdEventData = (akArgs[0] as DefaultCrowdEventManager:CrowdEventData)

		keyword eventKeyword =  myCrowdEventData.EventKeyword
		ObjectReference EventRef1 =  myCrowdEventData.EventRef1
		ObjectReference EventRef2 =  myCrowdEventData.EventRef2

		debug.trace(self + "CrowdEvent() incoming EventKeyword" + eventKeyword)
		debug.trace(self + "CrowdEvent() incoming EventRef1" + EventRef1)
		debug.trace(self + "CrowdEvent() incoming EventRef2" + EventRef2)

		float HeadingAngleToRef1
		float HeadingAngleToRef2
		
		if EventRef1
			HeadingAngleToRef1 = math.abs(GetHeadingAngle(EventRef1))
		endif

		if EventRef2
			HeadingAngleToRef2 = math.abs(GetHeadingAngle(EventRef2))
		endif


		debug.trace(self + "CrowdEvent() HeadingAngleToRef1" + HeadingAngleToRef1)
		debug.trace(self + "CrowdEvent() HeadingAngleToRef2" + HeadingAngleToRef2)

		float FacingAngle = 45.0

		float delay= 0.0
		int chanceRoll = 0

		;loop through event data array on the actor, and respond to ONE AND ONLY ONE event 
		int i = 0
		while (i < EventData.length && coolDown == 0)

			if EventData[i].RequireToFaceEitherEventRef && HeadingAngleToRef1 > FacingAngle && HeadingAngleToRef2 > FacingAngle
				debug.trace(self + "CrowdEvent() HeadingAngles to both EventRefs are too big to respond to event.")
				
			else
				debug.trace(self + "Checking EventData[i].EventKeyword: " + EventData[i].EventKeyword)
				if EventData[i].EventKeyword == eventKeyword
					chanceRoll = utility.RandomInt(0, 100)
					debug.trace(self + "EventChanceToRespond: " + EventData[i].EventChanceToRespond + " ROLLED: " + chanceRoll)

					if chanceRoll < EventData[i].EventChanceToRespond
						delay = utility.RandomFloat(EventData[i].MinResponseDelay, EventData[i].MaxResponseDelay)
						debug.trace(self + "Will wait to say line for " + delay)

						utility.wait(delay)

						debug.trace(self + " will say: " + EventData[i].EventTopicSubType)
						SayCustom(EventData[i].EventTopicSubType)

						coolDown = EventData[i].coolDown
					
					endif

				endif
			endif

			i += 1
		endwhile

		if coolDown > 0
			debug.trace(self + "waiting for coolDown: " + coolDown)
			utility.wait(coolDown)
		endif

		CoolingDown = false

	endif

EndEvent
