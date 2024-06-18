Scriptname DialogueParadisoDirkRemoveDiscount extends TopicInfo

GlobalVariable Property PD_Hotel_RoomCost_Daily Mandatory Const Auto
GlobalVariable Property PD_Hotel_RoomCost_Daily_Default Mandatory Const Auto
GlobalVariable Property PD_Hotel_RoomCost_Weekly Mandatory Const Auto
GlobalVariable Property PD_Hotel_RoomCost_Weekly_Default Mandatory Const Auto
GlobalVariable Property PD_PlayerHasHotelRoomDiscount Mandatory Const Auto
Quest Property MS06 Mandatory Const Auto
Int Property MS06EndingCRewardStage = 3120 Const Auto

;Turns off the discount and returns the price to normal for next time.
Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
    If PD_PlayerHasHotelRoomDiscount.GetValue() > 0
        PD_PlayerHasHotelRoomDiscount.SetValue(0)
        If !MS06.GetStageDone(MS06EndingCRewardStage)
            PD_Hotel_RoomCost_Daily.SetValue(PD_Hotel_RoomCost_Daily_Default.GetValue())
            PD_Hotel_RoomCost_Weekly.SetValue(PD_Hotel_RoomCost_Weekly_Default.GetValue())
        EndIf
    EndIf
EndEvent