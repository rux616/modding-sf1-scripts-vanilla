Scriptname SQ_TrafficManagerSettingsScript extends ObjectReference
{Settings for Traffic Manager}

Quest Property TrafficManagerQuest Auto Const Mandatory
{Quest that handles this system}

float Property MinRefreshTime Auto Const Mandatory
float Property MaxRefreshTime Auto Const Mandatory
{how often the system checks to see if ships need to be spawned or despawned}

Formlist Property TrafficShiplist Auto Const Mandatory
{List of Ships that will appear at this location}

int Property MaxShips Auto Const
{Maximum number of ships that can be in this cell}