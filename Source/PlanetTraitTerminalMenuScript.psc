Scriptname PlanetTraitTerminalMenuScript extends TerminalMenu
{award planet trait discovery data, optionally set a quest stage}

SQ_ParentScript property SQ_Parent auto const mandatory
{ used to get planet traits }

int property DiscoverTraitMenuItemID = 1 auto const
{ the ID of the menu item that should discover the planet trait }

bool property DiscoverTraitCompletely = true auto Const
{   TRUE = player fully discovers the trait
    FALSE = player increments discovery as if they had fully explored a trait overlay
}

TerminalMenu property SQ_PlanetTraitTerminalSubmenu auto const mandatory
{ autofill }

int property DiscoverTraitBodyTextIndex = 0 auto const
int property NoTraitBodyTextIndex = 1 auto const

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    ; initialize planet trait to award
    PlanetTraitTerminalScript myTerminalRef = akTerminalRef as PlanetTraitTerminalScript
    if myTerminalRef && myTerminalRef.planetToCheck == None
        Form[] textReplacementArray = None
        int bodyTextIndex = NoTraitBodyTextIndex

        ; get planet trait data
        myTerminalRef.planetToCheck = akTerminalRef.GetCurrentPlanet()
        Planet planetToCheck = myTerminalRef.planetToCheck

        Keyword[] matchingKeywords = planetToCheck.GetKeywordTypeList(SQ_Parent.KeywordType_PlanetTrait)
        debug.trace(self + " OnTerminalMenuEnter: " + " " + planetToCheck + " " + matchingKeywords)
        if matchingKeywords.Length > 0
            ; find a trait that isn't known, if possible
            int i = matchingKeywords.Length - 1
            while i > -1 
                if planetToCheck.IsTraitKnown(matchingKeywords[i])
                    matchingKeywords.Remove(i)
                endif
                i += -1
            EndWhile
            if matchingKeywords.Length == 0
                ; all known, just pick one to "discover"
                matchingKeywords = planetToCheck.GetKeywordTypeList(SQ_Parent.KeywordType_PlanetTrait)            
            endif
            int randomKeyword = Utility.RandomInt(0, matchingKeywords.Length-1)
            myTerminalRef.traitKeywordToDiscover = matchingKeywords[randomKeyword]
			textReplacementArray = GetTextReplacementArray(myTerminalRef)
            bodyTextIndex = DiscoverTraitBodyTextIndex
        Else

        endif
		SQ_PlanetTraitTerminalSubmenu.ClearDynamicBodyTextItems(myTerminalRef)
        SQ_PlanetTraitTerminalSubmenu.AddDynamicBodyTextItem(myTerminalRef, bodyTextIndex, 1, textReplacementArray)

        debug.trace(self + " traitKeywordToDiscover=" + myTerminalRef.traitKeywordToDiscover)
    endif
EndEvent

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuItemRun auiMenuItemID=" + auiMenuItemID)
    PlanetTraitTerminalScript myTerminalRef = akTerminalRef as PlanetTraitTerminalScript
    if myTerminalRef
        Keyword traitKeywordToDiscover = myTerminalRef.traitKeywordToDiscover
        Planet planetToCheck = myTerminalRef.planetToCheck

        if auiMenuItemID == DiscoverTraitMenuItemID && traitKeywordToDiscover && myTerminalRef.traitDataAwarded == false && planetToCheck.IsTraitKnown(traitKeywordToDiscover) == false
            SQ_ParentScript:PlanetTraitData theData = SQ_Parent.FindMatchingPlanetTraitForKeyword(traitKeywordToDiscover, planetToCheck)
            myTerminalRef.traitDataAwarded = true
            int traitScansToAward = 1
            if DiscoverTraitCompletely
                traitScansToAward = 99
            endif
            SQ_Parent.UpdatePlanetTraitDiscovery(akTerminalRef, theData, traitScansToAward)
        endif
    endif
EndEvent

Form[] function GetTextReplacementArray(PlanetTraitTerminalScript myTerminalRef)
	debug.trace(self + " GetTextReplacementArray")
	Form[] textReplacementArray = new Form[0]

	;/
	Downloading data for <0.Name>...
	/;
	textReplacementArray.Add(myTerminalRef.traitKeywordToDiscover)

	return textReplacementArray
endFunction