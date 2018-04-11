Class Ext_PerkSurvivalist extends Ext_PerkBase;

function OnWaveEnded()
{
	bUsedSacrifice = false;
}

simulated function bool GetUsingTactialReload( KFWeapon KFW )
{
	return ( (bTacticalReload && IsWeaponOnPerkLight( KFW )) || bTacticalReload && IsWeaponOnPerkHeavy( KFW ));
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

defaultproperties
{
	PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Survivalist'
	DefTraitList.Add(class'Ext_TraitWPSurv')
	DefTraitList.Add(class'Ext_TraitCardiac')
	//DefTraitList.Add(class'Ext_TraitHeavyArmor')
	BasePerk=class'KFPerk_Survivalist'

	PrimaryMelee=class'KFWeap_Random'
	PrimaryWeapon=class'KFWeap_Knife_Support'
	PerkGrenade=class'KFProj_HEGrenade'

	PrimaryWeaponDef=class'KFWeapDef_Random'
	KnifeWeaponDef=class'KFweapDef_Knife_Support'
	GrenadeWeaponDef=class'KFWeapDef_Grenade_Commando'

	AutoBuyLoadOutPath=(class'KFWeapDef_DragonsBreath', class'KFWeapDef_M16M203', class'KFWeapDef_MedicRifle')
}