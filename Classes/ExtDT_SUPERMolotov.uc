class ExtDT_SUPERMolotov extends KFDT_Microwave
	abstract
	hidedropdown;

defaultproperties
{
	bShouldSpawnPersistentBlood=false

	// physics impact
	RadialDamageImpulse=0
	KDeathUpKick=0
	KDeathVel=0

	KnockdownPower=0
	StumblePower=300
	BurnPower=10

	// DOT
	DoT_Type=DOT_Fire
	DoT_Duration=6.0 //5.0
	DoT_Interval=0.5
	DoT_DamageScale=0.30 //0.2
	bIgnoreSelfInflictedScale=false

	KDamageImpulse=0
	EffectGroup=FXG_Fire
	GoreDamageGroup=DGT_Fire

	CameraLensEffectTemplate=class'KFCameraLensEmit_Fire'

	WeaponDef=class'KFWeapDef_Grenade_Firebug'
}