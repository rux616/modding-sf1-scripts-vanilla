Scriptname ActorBase extends Form Native Hidden

; Returns this actor's class
Class Function GetClass() native

; Gets the number of actors of this type that have been killed
int Function GetDeadCount() native

; Returns this actor's gift filter formlist
FormList Function GetGiftFilter() native

; Returns this actor's race
Race Function GetRace() native

; Obtains this actor's level
int Function GetLevel() native

; Obtains this actor's level, unmodified by matching the player's level
int Function GetLevelExact() native

; Returns this actor's sex. Values for sex are:
; -1 - None
; 0 - Male
; 1 - Female
int Function GetSex() native

; Returns this actor's pronoun.
; 0 - Unselected
; 1 - He_Him
; 2 - She_Her
; 3 - They_Them
int Function GetPronoun() native

; Copy some genetic parent appearance related information from another npc to the calling npc
Function DeriveGeneticParentAppearance(ActorBase akChildSourceToDeriveFrom) native

; Gets the actor for this UniqueNPC
Actor Function GetUniqueActor() native

; Is this actor essential?
bool Function IsEssential() native

; Is this actor protected (can only be killed by player)?
bool Function IsProtected() native

; Is this actor base unique?
bool Function IsUnique() native

; Sets this actor as essential or not - if set as essential, will UNSET protected
Function SetEssential(bool abEssential = true) native

; Sets this actor as protected or not - if set as protected, will UNSET essential
Function SetProtected(bool abProtected = true) native

; Sets the actors outfit
Function SetOutfit( Outfit akOutfit, bool abSleepOutfit = false ) native
