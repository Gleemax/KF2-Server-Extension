Class Ext_PerkSharpshooter extends Ext_PerkRhythmPerkBase;

var bool bHasDireReload,bHasPreparation;
var float ZEDTimeStunPower,DireReloadSpeed,PrepareDamage,PrepareTimer;

replication
{
	// Things the server should send to the client.
	if ( true )
		bHasDireReload,bHasPreparation;
}

simulated function ModifyDamageGiven( out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx )
{
	local float interval;

	Super.ModifyDamageGiven(InDamage,DamageCauser,MyKFPM,DamageInstigator,DamageType,HitZoneIdx);

	if( !bHasPreparation )
		retrun;
	if( BasePerk==None || (DamageType!=None && DamageType.Default.ModifierPerkList.Find(BasePerk)>=0) || IsWeaponOnPerk(KFWeapon(DamageCauser)) )
	{
		if( PrepareTimer+1<WorldInfo.TimeSeconds && MyKFPM!=none )
		{
			interval = WorldInfo.TimeSeconds-PrepareTimer;
			InDamage *= 1.f+PrepareDamage*(FClamp(interval/6.f,0.f,1.5));
		}
		PrepareTimer = WorldInfo.TimeSeconds;
	}
	
}
simulated function float GetReloadRateScale(KFWeapon KFW)
{
	if( bHasDireReload && PlayerOwner.Pawn!=None && PlayerOwner.Pawn.Health<=40 )
		return Super.GetReloadRateScale(KFW)*DireReloadSpeed;
	return Super.GetReloadRateScale(KFW);
}
function float GetStunPowerModifier( optional class<DamageType> DamageType, optional byte HitZoneIdx )
{
	if( ZEDTimeStunPower>0 && HitZoneIdx==HZI_Head && WorldInfo.TimeDilation<1.f && IsDamageTypeOnPerk(DamageType, BasePerk) )
		return Super.GetStunPowerModifier(DamageType,HitZoneIdx) + ZEDTimeStunPower;
	return Super.GetStunPowerModifier(DamageType,HitZoneIdx);
}

defaultproperties
{
	PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Sharpshooter'
	DefTraitList.Add(class'Ext_TraitWPSharp')
	DefTraitList.Add(class'Ext_TraitRackEmUp')
	DefTraitList.Add(class'Ext_TraitRanger')
	DefTraitList.Add(class'Ext_TraitPreparation')
	DefTraitList.Add(class'Ext_TraitDireReload')
	DefTraitList.Add(class'Ext_TraitEliteReload')
	BasePerk=class'KFPerk_Sharpshooter'
	
	AdditionalOnPerkWeapon(0)="ExtWeap_Pistol_9mm"
   	AdditionalOnPerkWeapon(1)="KFWeap_Revolver_Rem1858"
   	AdditionalOnPerkWeapon(2)="KFWeap_Revolver_SW500"
	AdditionalOnPerkDT(0)="KFDT_Ballistic_9mm"
	AdditionalOnPerkDT(1)="KFDT_Ballistic_Rem1858"
	AdditionalOnPerkDT(2)="KFDT_Ballistic_SW500"

	PrimaryMelee=class'KFWeap_Knife_Sharpshooter'
	PrimaryWeapon=class'KFWeap_Rifle_Winchester1894'
	PerkGrenade=class'KFProj_FreezeGrenade'
	SuperGrenade=class'ExtProj_SUPERFreezeGrenade'

	PrimaryWeaponDef=class'KFWeapDef_Winchester1894'
	KnifeWeaponDef=class'KFWeapDef_Knife_Sharpshooter'
	GrenadeWeaponDef=class'KFWeapDef_Grenade_Sharpshooter'
	
	AutoBuyLoadOutPath=(class'KFWeapDef_Winchester1894', class'KFWeapDef_Crossbow', class'KFWeapDef_M14EBR', class'KFWeapDef_RailGun')
	
	PrepareDamage=1.0f
	DireReloadSpeed=0.3f
}