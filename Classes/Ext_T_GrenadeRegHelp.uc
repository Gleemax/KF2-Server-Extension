Class Ext_T_GrenadeRegHelp extends Info
	transient;

var Pawn PawnOwner;
var byte Count,RegInterval;

function PostBeginPlay()
{
	PawnOwner = Pawn(Owner);
	if( PawnOwner==None )
		Destroy();
	else SetTimer(4.9+FRand()*0.2,true);
}
function Timer()
{
	if( PawnOwner==None || PawnOwner.Health<=0 || PawnOwner.InvManager==None )
		Destroy();
	else 
	{
		Count++;
		if( Count>=RegInterval )
		{
			KFInventoryManager(PawnOwner.InvManager).AddGrenades(1);
			Count = 0;
		}
	}
		
}

defaultproperties
{
}