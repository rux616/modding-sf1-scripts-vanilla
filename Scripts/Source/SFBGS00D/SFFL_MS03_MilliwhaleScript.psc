Scriptname SFBGS00D:SFFL_MS03_MilliwhaleScript extends Actor Const

Struct ColorDatum
    Int Color_Global
    Armor Color_Armor
EndStruct

ColorDatum[] Property ColorData Auto Const Mandatory
GlobalVariable Property SFFL_OutpostMilliwhaleSkin Auto Const Mandatory
Message Property SFFL_MS03_MilliwhaleActivationMessage Auto Const Mandatory

Event OnLoad()
    Debug.Trace(Self + "MILLI: OnLoad event fired. Color global = " + SFFL_OutpostMilliwhaleSkin.GetValue())
    AllowPCDialogue(True)
    SetActivateTextOverride(SFFL_MS03_MilliwhaleActivationMessage)

    Int i = ColorData.FindStruct("Color_Global", SFFL_OutpostMilliwhaleSkin.GetValueInt())
    EquipItem(ColorData[i].Color_Armor)

EndEvent