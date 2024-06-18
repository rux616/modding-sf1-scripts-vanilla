;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestKurtQuest_0000188F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
int i = Alias_CreatedItems.GetCount()
ObjectReference theContainer =   Game.GetPlayer()
while i >= 0
  ObjectReference theRef = Alias_CreatedItems.GetAt(i)
  debug.trace(self + " i="+i+" removing ref " + theRef)
  theContainer.RemoveItem(theRef)
  i += -1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_NPC01 Auto Const Mandatory

RefCollectionAlias Property Alias_CreatedItems Auto Const Mandatory
