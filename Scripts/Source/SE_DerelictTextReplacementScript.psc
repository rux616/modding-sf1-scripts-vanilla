Scriptname SE_DerelictTextReplacementScript extends TerminalMenu
{Script for generic derelicts - a terminal with random replacement text and numeric values}

Group Text_Properties
    {Arrays to use in various text replacement. Type differs depending on the terminal using the script}
    Form[] Property TextReplacement00 Auto Const
    Form[] Property TextReplacement01 Auto Const
    Form[] Property TextReplacement02 Auto Const
    Form[] Property TextReplacement03 Auto Const
    Form[] Property TextReplacement04 Auto Const
    Form[] Property TextReplacement05 Auto Const
EndGroup

Group Number_Properties
    {Integers - used to randomly select a form in the array. Properties allow individual users to edit the values to a desired range}
    int Property SmallIntMin Auto Const
    int Property SmallIntMax Auto Const
    int Property MediumIntMin Auto Const
    int Property MediumIntMax Auto Const
    int Property LargeIntMin Auto Const
    int Property LargeIntMax Auto Const
EndGroup

Group Variable_Properties
    {Determines if terminal values should be re-evaluated. Reset with each new space encounte}
    GlobalVariable Property SE_GenericDerelict_TerminalGlobal Auto Const Mandatory
EndGroup


;Text replacement function. Generate 6 random values for 6 text sections, and 6 random numbers for 6 number sections)

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    if SE_GenericDerelict_TerminalGlobal.GetValueInt() == 0

        ;Choose a number in an array for a text replacement form

        int ArrayValue00 = Utility.RandomInt(0, TextReplacement00.Length-1)
        int ArrayValue01 = Utility.RandomInt(0, TextReplacement01.Length-1)
        int ArrayValue02 = Utility.RandomInt(0, TextReplacement02.Length-1)
        int ArrayValue03 = Utility.RandomInt(0, TextReplacement03.Length-1)
        int ArrayValue04 = Utility.RandomInt(0, TextReplacement04.Length-1)
        int ArrayValue05 = Utility.RandomInt(0, TextReplacement05.Length-1)

        ;Generate random numbers that are used in text replacement - as in 5 hours and 40 minutes
        ;SmallDigit = smaller ranges, like say, 2 to 9 days 
        ;MediumDigit = slightly larger band, like 10 to 60 minutes
        ;LargeDigit = large number ranges, like 100 to 1000 tons

        int SmallDigit01 = Utility.RandomInt(SmallIntMin, SmallIntMax)
        int SmallDigit02 = Utility.RandomInt(SmallIntMin, SmallIntMax)
        int MediumDigit01 = Utility.RandomInt(MediumIntMin, MediumIntMax)
        int MediumDigit02  = Utility.RandomInt(MediumIntMin, MediumIntMax)
        int LargeDigit01  = Utility.RandomInt(LargeIntMin, LargeIntMax)
        int LargeDigit02  = Utility.RandomInt(LargeIntMin, LargeIntMax)

        ;Store randomly selected text for use in the terminal. Example: "I drank a <Token.Name=MiscText00> and ate a <Token.Name=MiscText01> for dinner because I hate myself"

        akTerminalRef.AddTextReplacementData("MiscText00", TextReplacement00[ArrayValue00])
        akTerminalRef.AddTextReplacementData("MiscText01", TextReplacement01[ArrayValue01])
        akTerminalRef.AddTextReplacementData("MiscText02", TextReplacement02[ArrayValue02])
        akTerminalRef.AddTextReplacementData("MiscText03", TextReplacement03[ArrayValue03])
        akTerminalRef.AddTextReplacementData("MiscText04", TextReplacement04[ArrayValue04])
        akTerminalRef.AddTextReplacementData("MiscText05", TextReplacement05[ArrayValue05])

        ;Store randomly selected numbers for use in the terminal. Example: "I need <Token.Value=RandomInt00> magic beans in <Token.Value=RandomInt01> weeks to buy Jack's cow"

        akTerminalRef.AddTextReplacementValue("RandomInt00", SmallDigit01)
        akTerminalRef.AddTextReplacementValue("RandomInt01", SmallDigit02)
        akTerminalRef.AddTextReplacementValue("RandomInt02", MediumDigit01)
        akTerminalRef.AddTextReplacementValue("RandomInt03", MediumDigit02)
        akTerminalRef.AddTextReplacementValue("RandomInt04", LargeDigit01)
        akTerminalRef.AddTextReplacementValue("RandomInt05", LargeDigit02)

        ;Set global so terminal values stay - this is reset when the player boards a different ship
        SE_GenericDerelict_TerminalGlobal.SetValue(1)
    endif
EndEvent