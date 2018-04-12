// Written by DeathAngle.
class ExtProj_SUPEREmpGrenade extends KFProj_EMPGrenade
	hidedropdown;

var() byte RemainClusters;
var() float ClusterInterval;

simulated function Disintegrate( rotator inDisintegrateEffectRotation ); // Nope!

simulated function SpawnClusterByTime()
{
	local KFProj_EMPGrenade P;

	if ( bHasExploded || RemainClusters <= 0 )
	{
		ClearTimer(nameof(SpawnClusterByTime));
		return;
	}

	P = Spawn(class'KFProj_EMPGrenade',,,Location);
	if( P!=None )
		P.InstigatorController = InstigatorController;
	
	RemainClusters--;
}

simulated event GrenadeIsAtRest()
{
	super.GrenadeIsAtRest();

	if (Role == ROLE_Authority)
	{
		SetTimer(ClusterInterval, true, nameof(SpawnClusterByTime));
		SpawnClusterByTime();
	}
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
		ClearTimer(nameof(SpawnClusterByTime));
	}
}

defaultproperties
{
	FuseTime=2.75 //0.5

	bCanDisintegrate=false
	DrawScale=2
	RemainClusters=5
	ClusterInterval=0.5
	ProjFlightTemplate=ParticleSystem'ZED_Hans_EMIT.FX_Grenade_Explosive_01'

	Begin Object Name=ExploTemplate0
		Damage=50
		DamageRadius=1200
	End Object
}