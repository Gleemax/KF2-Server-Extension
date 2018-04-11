Class Ext_PerkBerserker extends Ext_PerkParryBase;

var float VampRegenAmount,ZedTimeMeleeAtkRate;

replication
{
	// Things the server should send to the client.
	if ( true )
		ZedTimeMeleeAtkRate;
}

simulated function ModifyMeleeAttackSpeed( out float InDuration )
{
	InDuration *= Modifiers[4];
	if( ZedTimeMeleeAtkRate<1.f && WorldInfo.TimeDilation<1.f )
		InDuration *= ZedTimeMeleeAtkRate;

	super.ModifyMeleeAttackSpeed(InDuration);
}
simulated function ModifyDamageTaken( out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy )
{
	if ( (InstigatedBy.GetTeamNum()==255 && InstigatedBy!=PlayerOwner ) && class<KFDamageType>(DamageType)!=None )
		InDamage *= 0.5f;
		
	super.ModifyDamageTaken(InDamage,DamageType,InstigatedBy);
}
simulated function ModifyRateOfFire( out float InRate, KFWeapon KFW )
{
	if( IsWeaponOnPerk(KFW) )
	{
		InRate *= Modifiers[4];
		if( ZedTimeMeleeAtkRate<1.f && WorldInfo.TimeDilation<1.f )
			InRate *= ZedTimeMeleeAtkRate;
	}
}

function PlayerKilled( KFPawn_Monster Victim, class<DamageType> DT )
{
	if( VampRegenAmount>0 && PlayerOwner.Pawn!=None && PlayerOwner.Pawn.Health>0 && class<KFDamageType>(DT)!=None && class<KFDamageType>(DT).Default.ModifierPerkList.Find(BasePerk)>=0 )
		PlayerOwner.Pawn.HealDamage( VampRegenAmount, PlayerOwner, class'KFDT_Healing', false, false);
}

defaultproperties
{
	PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Berserker'
	DefTraitList.Add(class'Ext_TraitWPBers')
	DefTraitList.Add(class'Ext_TraitUnGrab')
	DefTraitList.Add(class'Ext_TraitVampire')
	DefTraitList.Add(class'Ext_TraitSpartan')
	DefTraitList.Add(class'Ext_TraitParry')
	DefPerkStats(15)=(bHiddenConfig=false) // Poison damage.
	BasePerk=class'KFPerk_Berserker'

	PrimaryMelee=class'KFWeap_Knife_Berserker'
	PrimaryWeapon=class'KFWeap_Blunt_Crovel'
	PerkGrenade=class'KFProj_EMPGrenade'
	
	PrimaryWeaponDef=class'KFWeapDef_Crovel'
	KnifeWeaponDef=class'KFweapDef_Knife_Berserker'
	GrenadeWeaponDef=class'KFWeapDef_Grenade_Berserker'
	
	AutoBuyLoadOutPath=(class'KFWeapDef_Crovel', class'KFWeapDef_Nailgun', class'KFWeapDef_Pulverizer', class'KFWeapDef_Eviscerator')
	
	ZedTimeMeleeAtkRate=1.0
}