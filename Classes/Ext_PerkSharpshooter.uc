Class Ext_PerkSharpshooter extends Ext_PerkRhythmPerkBase;

var bool bHasDireReload,bHasSniping;
var float ZEDTimeStunPower,DireReloadSpeed,SnipingDamage,SnipingTimer;

replication
{
	// Things the server should send to the client.
	if ( true )
		bHasDireReload,bHasSniping;
}

simulated function ModifyDamageGiven( out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx )
{
	local float Distance;

	Super.ModifyDamageGiven(InDamage,DamageCauser,MyKFPM,DamageInstigator,DamageType,HitZoneIdx);
	if( BasePerk==None || (DamageType!=None && DamageType.Default.ModifierPerkList.Find(BasePerk)>=0) || IsWeaponOnPerk(KFWeapon(DamageCauser)) )
	{
		if( RhythmComboDmg>0 )
			InDamage *= (1.f+RhythmComboDmg);
		if( bHasSniping && SnipingTimer<WorldInfo.TimeSeconds && MyKFPM!=None && HitZoneIdx == HZI_HEAD )
		{
			SnipingTimer = WorldInfo.TimeSeconds + 1.f;
			Distance = VSize(MyKFPM.Location-PlayerOwner.Pawn.Location);
			if( Distance>1000.f )	
				InDamage *= 1.f+SnipingDamage*FClamp(Distance/5000.f,0.f,1.f);
		}
	}
	
}
simulated function float GetReloadRateScale(KFWeapon KFW)
{
	if( bHasDireReload && PlayerOwner.Pawn!=None && PlayerOwner.Pawn.Health<=50 )
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
	DefTraitList.Add(class'Ext_TraitFarAway')
	DefTraitList.Add(class'Ext_TraitDireReload')
	DefTraitList.Add(class'Ext_TraitEliteReload')
	BasePerk=class'KFPerk_Sharpshooter'

	AdditionalOnPerkWeaponNames(0)="KFWeap_Pistol_9mm"
   	AdditionalOnPerkWeaponNames(1)="KFWeap_Pistol_Dual9mm"
   	AdditionalOnPerkWeaponNames(2)="KFWeap_Revolver_Rem1858"
   	AdditionalOnPerkWeaponNames(3)="KFWeap_Revolver_SW500"
	AdditionalOnPerkDTNames(0)="KFDT_Ballistic_9mm"
	AdditionalOnPerkDTNames(1)="KFDT_Ballistic_SW500"
	AdditionalOnPerkDTNames(2)="KFDT_Ballistic_Rem1858"

	PrimaryMelee=class'KFWeap_Knife_Sharpshooter'
	PrimaryWeapon=class'KFWeap_Rifle_Winchester1894'
	PerkGrenade=class'KFProj_FreezeGrenade'
	SuperGrenade=class'ExtProj_SUPERFreezeGrenade'

	PrimaryWeaponDef=class'KFWeapDef_Winchester1894'
	KnifeWeaponDef=class'KFWeapDef_Knife_Sharpshooter'
	GrenadeWeaponDef=class'KFWeapDef_Grenade_Sharpshooter'
	
	AutoBuyLoadOutPath=(class'KFWeapDef_Winchester1894', class'KFWeapDef_Crossbow', class'KFWeapDef_M14EBR', class'KFWeapDef_RailGun')
	
	SnipingDamage=0.5f
	DireReloadSpeed=0.4f
}