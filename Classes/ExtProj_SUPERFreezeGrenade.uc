// Written by DeathAngle.
class ExtProj_SUPERFreezeGrenade extends KFProj_FreezeGrenade;

defaultproperties
{
	FuseTime=0.25

	bCanDisintegrate=false
	DrawScale=2.5
	ProjFlightTemplate=ParticleSystem'ZED_Hans_EMIT.FX_Grenade_Explosive_01'

	Begin Object Name=ExploTemplate0
		Radius=2500.f
	End Object

	Begin Object Name=ExploTemplate0
		Damage=125
		DamageRadius=1500
		MyDamageType=class'KFDT_SUPERFreezeGrenade'
		CamShakeInnerRadius=300
		CamShakeOuterRadius=1500
	End Object
}