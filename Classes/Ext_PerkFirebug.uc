Class Ext_PerkFirebug extends Ext_PerkBase;

var bool bPyromaniac;

replication
{
	// Things the server should send to the client.
	if ( true )
		bPyromaniac;
}

simulated function bool GetIsUberAmmoActive( KFWeapon KFW )
{
	return bPyromaniac && IsWeaponOnPerk(KFW) && WorldInfo.TimeDilation < 1.f;
}

simulated function float GetZedTimeModifier( KFWeapon W )
{
	if( bPyromaniac && WorldInfo.TimeDilation<1.f && IsWeaponOnPerk(W) && BasePerk.Default.ZedTimeModifyingStates.Find(W.GetStateName()) != INDEX_NONE )
		return 0.9f;
	return 0.f;
}

defaultproperties
{
	PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Firebug'
	DefTraitList.Add(class'Ext_TraitWPFire')
	DefTraitList.Add(class'Ext_TraitNapalm')
	DefTraitList.Add(class'Ext_TraitFireExplode')
	DefTraitList.Add(class'Ext_TraitFireRange')
	DefTraitList.Add(class'Ext_TraitPyromaniac')
	BasePerk=class'KFPerk_Firebug'

	PrimaryMelee=class'KFWeap_Knife_Firebug'
	PrimaryWeapon=class'KFWeap_Flame_CaulkBurn'
	PerkGrenade=class'KFProj_MolotovGrenade'
	SuperGrenade=class'ExtProj_SUPERMolotov'

	PrimaryWeaponDef=class'KFWeapDef_CaulkBurn'
	KnifeWeaponDef=class'KFWeapDef_Knife_Firebug'
	GrenadeWeaponDef=class'KFWeapDef_Grenade_Firebug'
	
	AutoBuyLoadOutPath=(class'KFWeapDef_CaulkBurn', class'KFWeapDef_DragonsBreath', class'KFWeapDef_FlameThrower', class'KFWeapDef_MicrowaveGun')
	
	DefPerkStats(13)=(Progress=3,bHiddenConfig=false) // Self damage.
	DefPerkStats(17)=(bHiddenConfig=false) // Fire resistance
}