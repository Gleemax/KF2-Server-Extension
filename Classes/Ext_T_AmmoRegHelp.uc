Class Ext_T_AmmoRegHelp extends Info
	transient;

var Pawn PawnOwner;
var float RegCount;

function PostBeginPlay()
{
	PawnOwner = Pawn(Owner);
	if( PawnOwner==None )
		Destroy();
	else SetTimer(29.9+FRand()*0.2,true);
}
function Timer()
{
	local KFWeapon W;
	local byte i;

	if( PawnOwner==None || PawnOwner.Health<=0 || PawnOwner.InvManager==None )
		Destroy();
	else
	{
		foreach PawnOwner.InvManager.InventoryActors(class'KFWeapon',W)
		{
			for( i=0; i<2; ++i )
			{
				if( W.SpareAmmoCount[i]<W.SpareAmmoCapacity[i] )
				{
					W.SpareAmmoCount[i] = Min(W.SpareAmmoCount[i]+FMax(float(W.SpareAmmoCapacity[i])*RegCount,1.f),W.SpareAmmoCapacity[i]);
					W.bNetDirty = true;
				}
			}
			if ( KFWeap_AssaultRifle_M16M203(W) != none )
				KFWeap_AssaultRifle_M16M203(W).ServerTotalAltAmmo = W.SpareAmmoCount[1];
			if ( KFWeap_AssaultRifle_MedicRifleGrenadeLauncher(W) != none )
				KFWeap_AssaultRifle_MedicRifleGrenadeLauncher(W).ServerTotalAltAmmo = W.SpareAmmoCount[1];
		}
	}
}

defaultproperties
{
}