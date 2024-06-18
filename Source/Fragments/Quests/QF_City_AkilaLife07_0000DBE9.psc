;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_AkilaLife07_0000DBE9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE City_AkilaLife07_Script
Quest __temp = self as Quest
City_AkilaLife07_Script kmyQuest = __temp as City_AkilaLife07_Script
;END AUTOCAST
;BEGIN CODE
; Run through all the books and see if the player already has picked them up
if ( Game.GetPlayer().GetItemCount(Book01) > 0 )
  Debug.Trace("Got Book01")
  kmyQuest.GotObject(200)
endif

if ( Game.GetPlayer().GetItemCount(Book02) > 0 )
  kmyQuest.GotObject(300)
endif

if ( Game.GetPlayer().GetItemCount(Book03) > 0 )
  kmyQuest.GotObject(400)
endif

if ( Game.GetPlayer().GetItemCount(Book04) > 0 )
  kmyQuest.GotObject(500)
endif

if ( Game.GetPlayer().GetItemCount(Book05) > 0 )
  kmyQuest.GotObject(600)
endif

if ( Game.GetPlayer().GetItemCount(Book06) > 0 )
  kmyQuest.GotObject(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; See if the player already has some of the objects - then give objective
if ( GetStageDone(200) )
  SetObjectiveDisplayed(200)
endif
if ( GetStageDone(300) )
  SetObjectiveDisplayed(300)
endif
if ( GetStageDone(400) )
  SetObjectiveDisplayed(400)
endif
if ( GetStageDone(500) )
  SetObjectiveDisplayed(500)
endif
if ( GetStageDone(600) )
  SetObjectiveDisplayed(600)
endif
if ( GetStageDone(700) )
  SetObjectiveDisplayed(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE City_AkilaLife07_Script
Quest __temp = self as Quest
City_AkilaLife07_Script kmyQuest = __temp as City_AkilaLife07_Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.GotObject(200)

; Add the book to an alias
Book bBook = Book01
ObjectReference oPlayer = Game.GetPlayer()
oPlayer.RemoveItem(bBook, 1, TRUE)  ; Quietly destroy the old one
oPlayer.AddAliasedItem(bBook, Alias_Book01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)

; Remove the item
Game.GetPlayer().RemoveItem(Book01)

; Indicate at least one book has been found
SetStage(150)

; Enable the book on display
Alias_PlacedBook01.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE City_AkilaLife07_Script
Quest __temp = self as Quest
City_AkilaLife07_Script kmyQuest = __temp as City_AkilaLife07_Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.GotObject(300)

; Add the book to an alias
Book bBook = Book02
ObjectReference oPlayer = Game.GetPlayer()
oPlayer.RemoveItem(bBook, 1, TRUE)  ; Quietly destroy the old one
oPlayer.AddAliasedItem(bBook, Alias_Book02)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)

; Remove the item
Game.GetPlayer().RemoveItem(Book02)

; Indicate at least one book has been found
SetStage(150)

; Enable the book on display
Alias_PlacedBook02.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE City_AkilaLife07_Script
Quest __temp = self as Quest
City_AkilaLife07_Script kmyQuest = __temp as City_AkilaLife07_Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.GotObject(400)

; Add the book to an alias
Book bBook = Book03
ObjectReference oPlayer = Game.GetPlayer()
oPlayer.RemoveItem(bBook, 1, TRUE)  ; Quietly destroy the old one
oPlayer.AddAliasedItem(bBook, Alias_Book03)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)

; Remove the item
Game.GetPlayer().RemoveItem(Book03)

; Indicate at least one book has been found
SetStage(150)

; Enable the book on display
Alias_PlacedBook03.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE City_AkilaLife07_Script
Quest __temp = self as Quest
City_AkilaLife07_Script kmyQuest = __temp as City_AkilaLife07_Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.GotObject(500)

; Add the book to an alias
Book bBook = Book04
ObjectReference oPlayer = Game.GetPlayer()
oPlayer.RemoveItem(bBook, 1, TRUE)  ; Quietly destroy the old one
oPlayer.AddAliasedItem(bBook, Alias_Book04)

; Rhys makes a comment
City_AkilaLife07_500_RhysBark.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)

; Remove the item
Game.GetPlayer().RemoveItem(Book04)

; Indicate at least one book has been found
SetStage(150)

; Enable the book on display
Alias_PlacedBook04.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE City_AkilaLife07_Script
Quest __temp = self as Quest
City_AkilaLife07_Script kmyQuest = __temp as City_AkilaLife07_Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.GotObject(600)

; Add the book to an alias
Book bBook = Book05
ObjectReference oPlayer = Game.GetPlayer()
oPlayer.RemoveItem(bBook, 1, TRUE)  ; Quietly destroy the old one
oPlayer.AddAliasedItem(bBook, Alias_Book05)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)

; Remove the item
Game.GetPlayer().RemoveItem(Book05)

; Indicate at least one book has been found
SetStage(150)

; Enable the book on display
Alias_PlacedBook05.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN AUTOCAST TYPE City_AkilaLife07_Script
Quest __temp = self as Quest
City_AkilaLife07_Script kmyQuest = __temp as City_AkilaLife07_Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.GotObject(700)

; Add the book to an alias
Book bBook = Book06
ObjectReference oPlayer = Game.GetPlayer()
oPlayer.RemoveItem(bBook, 1, TRUE)  ; Quietly destroy the old one
oPlayer.AddAliasedItem(bBook, Alias_Book06)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)

; Remove the item
Game.GetPlayer().RemoveItem(Book06)

; Indicate at least one book has been found
SetStage(150)

; Enable the book on display
Alias_PlacedBook06.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property AkilaLife06_DocPending Auto Const Mandatory

ReferenceAlias Property Alias_Book01 Auto Const Mandatory
ReferenceAlias Property Alias_Book02 Auto Const Mandatory
ReferenceAlias Property Alias_Book03 Auto Const Mandatory
ReferenceAlias Property Alias_Book04 Auto Const Mandatory
ReferenceAlias Property Alias_Book05 Auto Const Mandatory
ReferenceAlias Property Alias_Book06 Auto Const Mandatory

Book Property Book01 Auto Const
Book Property Book02 Auto Const
Book Property Book03 Auto Const
Book Property Book04 Auto Const
Book Property Book05 Auto Const
Book Property Book06 Auto Const

Scene Property City_AkilaLife07_500_RhysBark Auto Const Mandatory

ReferenceAlias Property Alias_PlacedBook01 Auto Const Mandatory

ReferenceAlias Property Alias_PlacedBook02 Auto Const Mandatory

ReferenceAlias Property Alias_PlacedBook03 Auto Const Mandatory

ReferenceAlias Property Alias_PlacedBook04 Auto Const Mandatory

ReferenceAlias Property Alias_PlacedBook05 Auto Const Mandatory

ReferenceAlias Property Alias_PlacedBook06 Auto Const Mandatory
