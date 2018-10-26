Class Ext_PerkBerserker extends Ext_PerkParryBase;

var float VampRegenAmount;
var bool bSpartanAttack;

replication
{
	// Things the server should send to the client.
	if ( true )
		bSpartanAttack;
}

simulated function ModifyMeleeAttackSpeed( out float InDuration )
{
	InDuration *= Modifiers[4];
	
	super.ModifyMeleeAttackSpeed(InDuration);
}
simulated function ModifyDamageTaken( out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy )
{
	if( InDamage>0 )
	{
		if( (!PerkManager.bUseBounty) && (InstigatedBy.GetTeamNum()==0 && InstigatedBy!=PlayerOwner ) && class<KFDamageType>(DamageType)!=None )
			InDamage = Max(Indamage*0.5f, 1);
	}
		
	super.ModifyDamageTaken(InDamage,DamageType,InstigatedBy);
}
simulated function ModifyRateOfFire( out float InRate, KFWeapon KFW )
{
	if( IsWeaponOnPerk(KFW) )
	{
		InRate *= Modifiers[4];
	}
}

function PlayerKilled( KFPawn_Monster Victim, class<DamageType> DT )
{
	if( VampRegenAmount>0 && PlayerOwner.Pawn!=None && PlayerOwner.Pawn.Health>0 && class<KFDamageType>(DT)!=None && class<KFDamageType>(DT).Default.ModifierPerkList.Find(BasePerk)>=0 )
		PlayerOwner.Pawn.HealDamage( VampRegenAmount, PlayerOwner, class'KFDT_Healing', false, false);
}

simulated function float GetZedTimeModifier( KFWeapon W )
{
	if( bSpartanAttack && IsWeaponOnPerk(W) && BasePerk.Default.ZedTimeModifyingStates.Find(W.GetStateName()) != INDEX_NONE )
		return 1.f;
	return 0.f;
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	SetTimer(0.99+FRand()*0.02,true,nameof(HealthRegen));
}

simulated function HealthRegen()
{
	if( PlayerOwner.Pawn.Health>0 && PlayerOwner.Pawn.Health<PlayerOwner.Pawn.HealthMax )
		PlayerOwner.Pawn.Health = Min(PlayerOwner.Pawn.HealthMax, PlayerOwner.Pawn.Health + 1);
}

simulated function Destroyed()
{
	ClearTimer(nameof(HealthRegen));
	super.Destroyed();
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
	SuperGrenade=class'ExtProj_SUPEREmpGrenade'
	
	PrimaryWeaponDef=class'KFWeapDef_Crovel'
	KnifeWeaponDef=class'KFweapDef_Knife_Berserker'
	GrenadeWeaponDef=class'KFWeapDef_Grenade_Berserker'
	
	AutoBuyLoadOutPath=(class'KFWeapDef_Crovel', class'KFWeapDef_Nailgun', class'KFWeapDef_Pulverizer', class'KFWeapDef_Eviscerator')
	
	bSpartanAttack=false
}