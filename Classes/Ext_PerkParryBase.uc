Class Ext_PerkParryBase extends Ext_PerkBase;

var bool bParryActive;
var float ParryDuration,ReductionModifier,HardAtkDamageModifier,HeadDmgModifier;

replication
{
	// Things the server should send to the client.
	if ( true )
		bParryActive,ParryDuration,HardAtkDamageModifier,HeadDmgModifier;
}

simulated function ModifyDamageGiven( out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx )
{
	Super.ModifyDamageGiven(InDamage,DamageCauser,MyKFPM,DamageInstigator,DamageType,HitZoneIdx);
    if( bParryActive && ( BasePerk==None || (DamageType!=None && DamageType.Default.ModifierPerkList.Find(BasePerk)>=0) || IsWeaponOnPerk(KFWeapon(DamageCauser)) ) )
	{
		if( HitZoneIdx == HZI_HEAD  )
			InDamage *= (1.f+HeadDmgModifier);
	}
}
simulated function ModifyDamageTaken( out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy )
{
	if( bParryActive )
		InDamage = Min(1.f, InDamage * (1.f-ReductionModifier));
		
	super.ModifyDamageTaken(InDamage,DamageType,InstigatedBy);
}
simulated function ModifyHardAttackDamage( out int InDamage )
{
	if( bParryActive )
		InDamage *= (1.f+HardAtkDamageModifier);
}
final function SetDuration( float Duration )
{
	ParryDuration = Duration;
}
final function SetReduction( float Modifier )
{
	ReductionModifier = Modifier;
}
final function SetHardAtkDamage( float Modifier )
{
	HardAtkDamageModifier = Modifier;
}
final function SetHeadDmg( float Modifier )
{
	HeadDmgModifier = Modifier;
}

final function ResetParry()
{
	ParryDuration = 0;
	ReductionModifier = 0;
	HardAtkDamageModifier = 0;
	HeadDmgModifier = 0;
}

simulated function SetSuccessfullParry()
{
    local KFPlayerController PC;

    if( ParryDuration > 0 )
	{
		bParryActive = true;
		SetTimer( ParryDuration, false, nameOf( ParryTimer ));

        PC = KFPlayerController(PlayerOwner);
		if( PC != none )
		{
			PC.SetPerkEffect( true );
		}

		PC.PlaySoundBase( AkEvent'WW_GLO_Runtime.Play_Beserker_Parry_Mode', true );
		
	}
}

simulated function ParryTimer()
{
    local KFPlayerController PC;

	bParryActive = false;

    PC = KFPlayerController(PlayerOwner);
	if( PC != none )
	{
		PC.SetPerkEffect( false );
	}

	PC.PlaySoundBase( AkEvent'WW_GLO_Runtime.Stop_Beserker_Parry_Mode', true );
}

DefaultProperties
{

}