Scriptname EliteCrew_StartQuestonLoadScript extends Actor

{Script to start Elite Crew quests on load}

Quest Property ECQuest Auto Const Mandatory

Auto State Waiting
    Event OnLoad()
        goToState("Done") 
        ECQuest.Start()
    endEvent
endState

State Done
endState