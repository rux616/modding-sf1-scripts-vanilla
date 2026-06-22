Scriptname SFBGS00D:SFFL_SE_MG02_Container_Log extends ObjectReference Const
{This containter will add a user defined variables for logs.}

Book Property LogRef = None  Auto Const
{This variable is the log that will be spawned into the container on launch. Defaults to a generic log}

Event OnLoad()

SpaceshipReference playerShip = Game.GetPlayer().GetSpaceship()


if (Game.GetPlayer().GetItemCount(LogRef ) == 0 && playerShip.GetItemCount(LogRef ) == 0 )
        self.AddItem(LogRef , 1, 1)
endif

EndEvent


