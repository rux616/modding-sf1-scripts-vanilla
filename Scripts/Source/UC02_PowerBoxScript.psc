Scriptname UC02_PowerBoxScript extends RefCollectionAlias

RefCollectionAlias Property LinkedDefenses Mandatory Const Auto
{The defenses you want to turn on when the power is thrown}

Keyword Property TopicToPlay Mandatory Const Auto
{Topic to play when all the power boxes are activated}

Keyword Property AdditionalBreakerTopic Mandatory Const Auto
{Topic to play if there are additional breakers to throw still}

Keyword Property UC02_SystemOffline_Keyword Mandatory Const Auto
{Keyword to trigger topic if the player gets here early}

Quest Property UC02 Mandatory Const Auto
{UC02 quest}

int Property PreReqStage = 601 Const Auto
{If the player attempts to activate these objects before this stage is set, they'll fail}

ReferenceAlias Property DefenseSystem Mandatory Const Auto
{Actor alias for the defense system}

ReferenceAlias Property LightAlias Mandatory Const Auto
{Alias for the enable marker that manages each group of lights}

WwiseEvent Property QST_UC02_Turret_Power_Half Mandatory Const Auto
{Sound to play if the player's partially restored power to the system}

WwiseEvent Property QST_UC02_Turret_Power_Full Mandatory Const Auto
{Sound to play if the player's fully restored power to the system}

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
    trace(self, "Activation event: Sender: " + akSenderRef + ". Activator: " + akActionRef + ". Linked defenses: " + LinkedDefenses)
    if UC02.GetStageDone(PreReqStage)
        RemoveRef(akSenderRef)

        trace(self, "How many items still in coll: " + GetCount())
        if GetCount() <= 0
            int i = 0
            int iCount = LinkedDefenses.GetCount()
            bool bAnyAlive

            while i < iCount
                Actor currAct = LinkedDefenses.GetAt(i) as Actor
                trace(self, "Waking up actor: " + currAct)

                if currAct.IsUnconscious() && !currAct.IsDead()
                    bAnyAlive = true
                    LightAlias.GetRef().Enable()
                    currAct.SetUnconscious(false)
                    currAct.IgnoreFriendlyHits()
                    trace(self, "Actor is now conscious: " + !currAct.IsUnconscious())
                endif

                i += 1
            endwhile

            if bAnyAlive
                trace(self, "All breakers activated. If there are turrets left, say a line:" + TopicToPlay + " from source: " + akSenderRef + " as actor: " + DefenseSystem.GetActorRef())
                QST_UC02_Turret_Power_Full.Play(Game.GetPlayer())
                akSenderRef.SayCustom(TopicToPlay, DefenseSystem.GetActorRef())
            endif
        else
            trace(self, "Still breakers lef to activate. Say a line with keyword: " + AdditionalBreakerTopic)
            QST_UC02_Turret_Power_Half.Play(Game.GetPlayer())
            akSenderRef.SayCustom(AdditionalBreakerTopic, DefenseSystem.GetActorRef())
        endif
    else
        trace(self, "Player got here early. Tell 'em to take a hike with keyword: " + UC02_SystemOffline_Keyword)
        akSenderRef.SayCustom(UC02_SystemOffline_Keyword, DefenseSystem.GetActorRef())
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC02", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction