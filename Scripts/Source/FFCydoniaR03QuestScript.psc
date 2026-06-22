Scriptname FFCydoniaR03QuestScript extends Quest

ReferenceAlias Property BookAlias Auto
ReferenceAlias Property BookMarker Mandatory Const Auto
ReferenceAlias Property Vendor Mandatory Const Auto
GlobalVariable Property FFCydoniaR03_BookNumber Mandatory Const Auto
FormList Property FFCydoniaR03_BookList Mandatory Const Auto

;Remove the book from the player's inventory.
Function RemoveBook()
    ObjectReference myBook = BookAlias.GetRef()
    Actor myPlayer = Game.GetPlayer()
    If myPlayer.GetItemCount(myBook) >= 1
        myPlayer.RemoveItem(myBook)
    EndIf
EndFunction


;Give the player a copy of the book as a reward
Function BookReward()
    Game.GetPlayer().AddItem(FFCydoniaR03_BookList.GetAt((FFCydoniaR03_BookNumber.GetValue() as Int) - 1))
EndFunction


;Create the correct book based on the FFCydoniaR03_BookNumber value and place it in the holding cell, then transfer it to the Vendor.
Event OnQuestInit()
    debug.trace(self + " OnQuestInit")
    Int iBookNumberValue = FFCydoniaR03_BookNumber.GetValue() as Int
    Form myBook = FFCydoniaR03_BookList.GetAt(iBookNumberValue - 1)
    ObjectReference myBookRef = BookMarker.GetRef().PlaceAtMe(myBook, akAliasToFill = BookAlias)
    Vendor.GetRef().AddItem(myBookRef)
EndEvent
