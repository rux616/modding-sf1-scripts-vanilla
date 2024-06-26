Scriptname Weather extends Form Native Hidden

; Turns on/off ambient particles in the sky
function EnableAmbientParticles( bool abEnable = true ) native global

; Finds a weather from the current region/climate whose classification matches the given one.
Weather function FindWeather( Keyword aKeyword ) native global

; Forces the active weather on the sky to be this weather.
function ForceActive( bool abOverride=false ) native

; Gets this weather's classification keywords
Keyword[] function GetClassification() native

; Gets the sky's current weather
Weather function GetCurrentWeather() native global

; Gets the transition percentage of the current weather
float function GetCurrentWeatherTransition() native global

; Gets the sky's outgoing weather
Weather function GetOutgoingWeather() native global

; Gets the sky's current mode
; 0 - No sky (SM_NONE)
; 1 - Interior (SM_INTERIOR)
; 2 - Skydome only (SM_SKYDOME_ONLY)
; 3 - Full sky (SM_FULL)
int function GetSkyMode() native global

; Tells the sky to release its overriding weather. 
function ReleaseOverride() native global

; Sets the active weather on the sky to be this weather.
function SetActive( bool abOverride=false, bool abAccelerate=false ) native