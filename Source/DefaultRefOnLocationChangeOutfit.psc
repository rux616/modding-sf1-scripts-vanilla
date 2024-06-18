Scriptname DefaultRefOnLocationChangeOutfit extends Actor Const Default
{change outfits on location change}

struct OutfitChange
	Location NewLocation
	{ change outfit when moving TO this location}
	Location OldLocation
	{ change outfit when moving FROM this location}
	Outfit ChangeToOutfit
	{ outfit to change into }
endStruct

OutfitChange[] Property OutfitChangeList auto const
{ list of location/outfit combinations }

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    int i = 0
    while i < outfitChangeList.Length
    	OutfitChange theOutfitChange = outfitChangeList[i]
    	if theOutfitChange.NewLocation == akNewLoc
    		SetOutfit(theOutfitChange.changeToOutfit)
    	elseif theOutfitChange.OldLocation == akOldLoc
    		SetOutfit(theOutfitChange.changeToOutfit)
    	endif
    	i += 1
    endWhile
EndEvent