Class Ext_PerkSurvivalist extends Ext_PerkBase;

var bool bHasMadman,bhasInvincible;
var() byte GrenadeLevel;
var() array<class<KFProj_Grenade> > PGrenadeList,SGrenadeList;

replication
{
	// Things the server should send to the client.
	if ( true )
		bHasMadman;
}

simulated function ModifyMeleeAttackSpeed( out float InDuration )
{
	InDuration *= Modifiers[4];
	
	super.ModifyMeleeAttackSpeed(InDuration);
}
simulated function ModifyDamageTaken( out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy )
{
	if( InDamage>0 && class<KFDamageType>(DamageType)!=None )
	{
		if( bhasInvincible && WorldInfo.TimeDilation < 1.f )
			InDamage = 0;
	}
		
	super.ModifyDamageTaken(InDamage,DamageType,InstigatedBy);
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	SetTimer(0.25,true,nameof(SetRandomGrenade));
}

function OnWaveEnded()
{
	bUsedSacrifice = false;
}

simulated function ModifyHealerRechargeTime( out float RechargeRate )
{
	RechargeRate /= Clamp(Modifiers[9] , 1.f, 2.f);
}

simulated function bool GetUsingTactialReload( KFWeapon KFW )
{
	return ( (bTacticalReload && IsWeaponOnPerkLight( KFW )) || bTacticalReload && IsWeaponOnPerkHeavy( KFW ));
}

simulated function float GetZedTimeModifier( KFWeapon W )
{
	local name StateName;
	
	if( bHasMadman && IsWeaponOnPerk( W ) )
	{
		StateName = W.GetStateName();
		if( BasePerk.Default.ZedTimeModifyingStates.Find( StateName ) != INDEX_NONE )
			return 0.5f;
	}

	return 0.f;
}

simulated function bool IsWeaponOnPerkLight( KFWeapon KFW )
{
	if( KFW != none )
	{
		return (class'KFPerk_Commando'.static.IsWeaponOnPerk( KFW,, class'KFPerk_Commando' ) ||
				class'KFPerk_Gunslinger'.static.IsWeaponOnPerk( KFW,, class'KFPerk_Gunslinger' ) ||
				class'KFPerk_SWAT'.static.IsWeaponOnPerk( KFW,, class'KFPerk_SWAT' ));
	}

	return false;
}

simulated function bool IsWeaponOnPerkHeavy( KFWeapon KFW )
{
	if( KFW != none )
	{
		return (class'KFPerk_Demolitionist'.static.IsWeaponOnPerk( KFW,, class'KFPerk_Demolitionist' ) ||
				class'KFPerk_Support'.static.IsWeaponOnPerk( KFW,, class'KFPerk_Support' ) ||
				class'KFPerk_Sharpshooter'.static.IsWeaponOnPerk( KFW,, class'KFPerk_Sharpshooter' ) ||
				KFW.IsA('KFPerk_Survivalist') ||
				(KFW.IsHeavyWeapon() && IsWeaponOnPerk(KFW)) );
	}

	return false;
}

simulated function SetRandomGrenade()
{
	local int index;

	if( GrenadeLevel>0 )
	{	
		index = Rand(Default.PGrenadeList.Length);
		PerkGrenade = Default.PGrenadeList[index];
		if( GrenadeLevel>1 )
		{
			index = Rand(Default.SGrenadeList.Length);
			SuperGrenade = Default.SGrenadeList[index];
			GrenadeClass = SuperGrenade;
		} else
			GrenadeClass = PerkGrenade;
	}
}

simulated function Destroyed()
{
	ClearTimer(nameof(SetRandomGrenade));
	super.Destroyed();
}

defaultproperties
{
	PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Survivalist'
	DefTraitList.Add(class'Ext_TraitWPSurv')
	DefTraitList.Add(class'Ext_TraitCardiac')
	DefTraitList.Add(class'Ext_TraitEliteReload')
	DefTraitList.Add(class'Ext_TraitMadman')
	DefTraitList.Add(class'Ext_TraitInvincible')
	BasePerk=class'KFPerk_Survivalist'

	PrimaryMelee=class'KFWeap_Knife_Survivalist'
	PrimaryWeapon=class'KFWeap_Ice_FreezeThrower'
	PerkGrenade=class'KFProj_HEGrenade'

	PrimaryWeaponDef=class'KFWeapDef_FreezeThrower'
	KnifeWeaponDef=class'KFWeapDef_Knife_Survivalist'
	GrenadeWeaponDef=class'KFWeapDef_Grenade_Commando'

	GrenadeLevel=0

	PGrenadeList.Add(class'KFProj_FragGrenade')
	PGrenadeList.Add(class'KFProj_HEGrenade')
	PGrenadeList.Add(class'KFProj_DynamiteGrenade')
	PGrenadeList.Add(class'KFProj_NailBombGrenade')
	PGrenadeList.Add(class'KFProj_FlashBangGrenade')
	PGrenadeList.Add(class'KFProj_EMPGrenade')
	PGrenadeList.Add(class'KFProj_MedicGrenade')
	PGrenadeList.Add(class'KFProj_FreezeGrenade')
	PGrenadeList.Add(class'KFProj_MolotovGrenade')

	SGrenadeList.Add(class'ExtProj_SUPERGrenade')
	SGrenadeList.Add(class'ExtProj_SUPERGrenade')
	SGrenadeList.Add(class'ExtProj_SUPERFlashBang')
	SGrenadeList.Add(class'ExtProj_SUPEREmpGrenade')
	SGrenadeList.Add(class'ExtProj_SUPERMedGrenade')
	SGrenadeList.Add(class'ExtProj_SUPERFreezeGrenade')

	AutoBuyLoadOutPath=(class'KFWeapDef_DragonsBreath', class'KFWeapDef_M16M203', class'KFWeapDef_MedicRifle')
}