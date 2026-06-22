Scriptname CrowdActors_AnimFlavorChange extends Actor Const

Keyword[] Property AnimFlavors Auto Const
{ array of anim flavor keywords }

GlobalVariable Property CrowdAnimFlavorChance Auto Const Mandatory

Event OnLoad()
    int ChanceForAnim = Utility.RandomInt()
    if ChanceForAnim > (CrowdAnimFlavorChance.GetValue())
        int AnimType = Utility.RandomInt(0,AnimFlavors.Length-1)
        ChangeAnimFlavor(AnimFlavors[AnimType])
    endif
EndEvent


