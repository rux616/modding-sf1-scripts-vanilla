Scriptname SFBGS00D:CalculateVendorCredits extends Quest Conditional

Int Property TotalCredits=0 Auto Conditional        ;This is used to calculate how much credits was spent by the player with Vendors
Int Property MaxVendorTrust=1 Auto Const            ;This sets the highest "Trust Level" a Vendor has with player, with a minimum value of 1
Int Property MinTransactionAmount=1000 Auto Const   ;This is used to determine how much credits the player must spend with Vendors in order for the Trust Level to increase (up to the maximum value)
