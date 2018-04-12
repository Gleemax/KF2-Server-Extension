// Written by DeathAngle.
class ExtProj_SUPERFlashBang extends KFProj_FlashBangGrenade
	hidedropdown;

var class<KFProj_Grenade> ClusterNades;
var() byte NumClusters;

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	if( Other != Instigator && !Other.bWorldGeometry && Pawn(Other)!=None && Pawn(Other).GetTeamNum() != GetTeamNum() )
	{
		GetExplodeEffectLocation( HitLocation, HitNormal, Other );
        TriggerExplosion( HitLocation, HitNormal, Other );
	}
	else super.ProcessTouch( Other, HitLocation, HitNormal );
}

simulated function Disintegrate( rotator inDisintegrateEffectRotation ); // Nope!

simulated function TriggerExplosion(Vector HitLocation, Vector HitNormal, Actor HitActor)
{
	local byte i;
	local KFProj_Grenade P;

	if( bHasExploded )
		return;
	if( InstigatorController==None && WorldInfo.NetMode!=NM_Client ) // Prevent Team-Kill.
	{
		Destroy();
		return;
	}
	Super.TriggerExplosion(HitLocation,HitNormal,HitActor);
	if( WorldInfo.NetMode!=NM_Client )
	{
		for( i=0; i<NumClusters; ++i )
		{
			P = Spawn(ClusterNades,,,Location);
			if( P!=None )
			{
				P.InstigatorController = InstigatorController;
				P.Init(VRand());
			}
		}
	}
	bHasExploded = true;
}

simulated function Destroyed()
{
    local Actor HitActor;
    local vector HitLocation, HitNormal;

	// Final Failsafe check for explosion effect
	if( !bHasExploded && WorldInfo.NetMode==NM_Client )
	{
		GetExplodeEffectLocation(HitLocation, HitNormal, HitActor);
        TriggerExplosion(HitLocation, HitNormal, HitActor);
	}
}

defaultproperties
{
	bCanDisintegrate=false
	ClusterNades=class'KFProj_FlashBangGrenade'
	DrawScale=2
	NumClusters=4
	ProjFlightTemplate=ParticleSystem'ZED_Hans_EMIT.FX_Grenade_Explosive_01'

	Begin Object Name=ExploTemplate0
		Damage=125
		DamageRadius=900
		MyDamageType=class'KFDT_SUPERFlashBang'
	End Object
}