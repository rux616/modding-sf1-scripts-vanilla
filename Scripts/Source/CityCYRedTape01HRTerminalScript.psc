Scriptname CityCYRedTape01HRTerminalScript extends TerminalMenu

GlobalVariable Property City_CY_RedTape01_Experience Mandatory Const Auto
GlobalVariable Property City_CY_RedTape01_Education Mandatory Const Auto
GlobalVariable Property City_CY_RedTape01ApplicationTotal Mandatory Const Auto
GlobalVariable Property City_CY_RedTape01Quality01 Mandatory Const Auto
GlobalVariable Property City_CY_RedTape01Quality02 Mandatory Const Auto
GlobalVariable Property City_CY_RedTape01Quality03 Mandatory Const Auto

Keyword Property LinkCustom10 Mandatory Const Auto
Float Property fDistance = 16.0  Const Auto

;Terminal Property City_CY_RedTape01_HRTerminal Mandatory Const Auto
TerminalMenu Property City_CY_RedTape01_HRSubTerminal_Applications_Genesis Mandatory Const Auto
TerminalMenu Property City_CY_RedTape01_HRSubTerminal_Applications_Player_Genesis Mandatory Const Auto

Int Property PlayerNameBodyTextIndex = 0 Const Auto
Int Property ExperienceBodyTextIndex = 1 Const Auto
Int Property EducationBodyTextIndex = 2 Const Auto
Int Property QualityBodyTextIndex = 3 Const Auto


Struct ExpData
    GlobalVariable ExperienceValue
    {The value we set for the player's stated Executive Assistant Experience Level}
    Message ExperienceMSG
    {The Message to output associated with this level of experience}
EndStruct

Struct EdData
    GlobalVariable EducationValue
    {The value we set for the player's stated Education Level}
    Message EducationMSG
    {The Message to output associated with this level of Education}
EndStruct

Struct QualityData
    GlobalVariable QualityRangeValue
    {The range value based on the player's City_CY_RedTape01ApplicationTotal value}
    Message QualityMSG
    {The Message to output associated with this range value, based on how well the player answered the questions}
EndStruct

Message[] Property ExpMessage Auto Const Mandatory
Message[] Property EdMessage Auto Const Mandatory
Message[] Property QualityMessage Auto Const Mandatory

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    
    ;Checks to see if Tia is nearby when the player opens the menu. If so, then treat it as a trespass crime.
    Actor myPlayer = Game.GetPlayer()
    Actor myTia = akTerminalRef.GetLinkedRef(LinkCustom10) as Actor
    Float fTiaDistance = myTia.GetDistance(myPlayer)
    If fTiaDistance < fDistance
        myTia.SendTrespassAlarm(myPlayer)
    EndIf    
     
    TerminalScript myTerminalRef = akTerminalRef as TerminalScript
    Form[] textReplacementArray = New Form[0]
    textReplacementArray.Add(myPlayer)

    Int ExpIndex = City_CY_RedTape01_Experience.GetValue() as Int
    If ExpIndex >= 0 && ExpIndex <= (ExpMessage.Length -1)
        Message myExpMsg = ExpMessage[ExpIndex]
        textReplacementArray.Add(myExpMsg)
    EndIf

    Int EdIndex = City_CY_RedTape01_Education.GetValue() as Int
    If EdIndex >= 0 && EdIndex <= (EdMessage.Length - 1)
        Message myEdMsg = EdMessage[EdIndex]
        textReplacementArray.Add(myEdMsg)
    EndIf

    Int iTotal = City_CY_RedTape01ApplicationTotal.GetValue() as Int
    Int iQuality
    If iTotal < City_CY_RedTape01Quality01.GetValue()
        iQuality = 0
    ElseIf iTotal >= City_CY_RedTape01Quality01.GetValue() && iTotal < City_CY_RedTape01Quality02.GetValue()
        iQuality = 1
    ElseIf iTotal >= City_CY_RedTape01Quality02.GetValue() && iTotal < City_CY_RedTape01Quality03.GetValue()
        iQuality = 2
    ElseIf iTotal >= City_CY_RedTape01Quality03.GetValue()
        iQuality = 3
    Endif
    Message myQualityMsg = QualityMessage[iQuality]
    textReplacementArray.Add(myQualityMsg)
    
    akTerminalRef.AddTextReplacementData("PlayerLabel", Game.GetPlayer().GetBaseObject())
    ;DELETE the next line if the above text replacement ends up working after getting fixed: 
    ;myTerminalRef.AddDynamicTerminalMenuItem(City_CY_RedTape01_HRSubTerminal_Applications_Genesis, PlayerNameBodyTextIndex, 1, textReplacementArray)
    City_CY_RedTape01_HRSubTerminal_Applications_Player_Genesis.AddDynamicBodyTextItem(myTerminalRef, PlayerNameBodyTextIndex, 2, textReplacementArray)
    City_CY_RedTape01_HRSubTerminal_Applications_Player_Genesis.AddDynamicBodyTextItem(myTerminalRef, ExperienceBodyTextIndex, 3, textReplacementArray)
    City_CY_RedTape01_HRSubTerminal_Applications_Player_Genesis.AddDynamicBodyTextItem(myTerminalRef, EducationBodyTextIndex, 4, textReplacementArray)
    City_CY_RedTape01_HRSubTerminal_Applications_Player_Genesis.AddDynamicBodyTextItem(myTerminalRef, QualityBodyTextIndex, 5, textReplacementArray)
EndEvent

