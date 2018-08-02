Class Ext_PerkCardiac extends Ext_PerkBase;

var bool bHasCardiac;
var float CardiacDuration,ResistModifier,MoveSpdModifier,ReloadSpdModifier,HealAmmount;

replication
{
	// Things the server should send to the client.
	if ( true )
		bParryActive,ParryDuration,HardAtkDmgModifier,HeadDmgModifier;
}

simulated function ModifyDamageGiven( out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx )
{
	Super.ModifyDamageGiven(InDamage,DamageCauser,MyKFPM,DamageInstigator,DamageType,HitZoneIdx);
    if( bParryActive && HeadDmgModifier>0 && HitZoneIdx == HZI_HEAD && ( BasePerk==None || (DamageType!=None && DamageType.Default.ModifierPerkList.Find(BasePerk)>=0) || IsWeaponOnPerk(KFWeapon(DamageCauser)) ) )
		InDamage *= (1.f+HeadDmgModifier);
}
simulated function ModifyDamageTaken( out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy )
{
	if( bParryActive )
		InDamage *= (1.f - ReductionModifier);
		
	super.ModifyDamageTaken(InDamage,DamageType,InstigatedBy);
}

final function SetDuration( float Duration )
{
	CardiacDuration = Duration;
}
final function SetResist( float Modifier )
{
	ResistModifier = Modifier;
}
final function SetHardAtkDmg( float Modifier )
{
	HardAtkDmgModifier = Modifier;
}
final function SetHeadDmg( float Modifier )
{
	HeadDmgModifier = Modifier;
}

final function ResetCardiac()
{
	CardiacDuration = 0;
	ResistModifier = 0;
	MoveSpdModifier = 0;
	ReloadSpdModifier = 0;
	HealAmmount = 0;

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