Scriptname SE_RaidScript extends Quest conditional
{Script attached to SE_Raid that handles spawning ships and getting information on the player}

Group Settings

Formlist Property RaidersShipList Auto Const Mandatory
{Formlist containing the ships that can spawn for this encounter}

MiscObject Property Credits Mandatory Const Auto
{Credits Miscobject}

int property maxShips Auto Const Mandatory
{max random number of ships that can spawn.}

int property offsetDistance Auto Const Mandatory
{how far apart the ships are when they spawn}

int property StageToSet = 50 auto const
{ stage to set on QuestToSetStage }

GlobalVariable Property SE_Raid_SmallCredits Mandatory Const Auto
GlobalVariable Property SE_Raid_MediumCredits Mandatory Const Auto
GlobalVariable Property SE_Raid_LargeCredits Mandatory Const Auto

EndGroup

Group QuestAliases
RefCollectionAlias property Alias_AttackersRC Auto Const Mandatory
{RefcollectionAlias that holds all of the enemy ships}

ReferenceAlias property Alias_PlayerShip Auto Const Mandatory
{ReferenceAlias that points to the player's ship}

ReferenceAlias property Alias_Ship01 Auto Const Mandatory
{The enemy ship that hails the player}
EndGroup


int numCredits conditional
int randomAsk = 1 conditional


Event OnQuestInit()

        UpdatePlayerInfo()
        SpawnShips(RaidersShipList, Alias_AttackersRC)

EndEvent

Function UpdatePlayerInfo()

        numCredits = Game.GetPlayer().GetItemCount(Credits)

EndFunction

Function SpawnShips(FormList akCurrentGroup, RefCollectionAlias akRefColToAddTo)

        int i=0
        int GroupSize = Utility.RandomInt(1,maxships)
        
        SpaceshipReference playership = Alias_PlayerShip.GetShipRef()

        while i<GroupSize
            Utility.wait(1)
            
            SpaceshipReference newShip = PlayerShip.PlaceShipAtMeOffset(akCurrentGroup.GetAt(Utility.RandomInt(0,akCurrentGroup.GetSize()-1)),i-1 * offsetDistance, 800, 0, akAliasToFill = akRefColToAddTo, abInitiallyDisabled = true)
         
            newShip.EnableWithGravJump()

            if (i == 0)
                Alias_Ship01.ForceRefTo(newShip)
                Utility.wait(5)
                self.SetStage(StageToSet)
            endif          
            

            i=i+1
        EndWhile
        
EndFunction

Function RemoveItems(int item)
    {Called from Topic Info for each possible response on the Respond scene}

    UpdatePlayerInfo()

    if (item == 4)
        Game.GetPlayer().RemoveItem(Credits, SE_Raid_LargeCredits.GetValueInt())
    elseif (item == 5)
        Game.GetPlayer().RemoveItem(Credits, SE_Raid_MediumCredits.GetValueInt())
    elseif (item == 6)
        Game.GetPlayer().RemoveItem(Credits, SE_Raid_SmallCredits.GetValueInt())
    endif


EndFunction