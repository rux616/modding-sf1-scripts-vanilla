Scriptname TestSpeechChallengeScript extends Quest Conditional

Event OnSpeechChallengeCompletion(SpeechChallengeObject akSpeechChallenge, bool abSuccess)
	debug.trace(self + " OnSpeechChallengeCompletion: " + akSpeechChallenge + " abSuccess=" + abSuccess)
EndEvent
