Class Ext_PerkParryBase extends Ext_PerkBase;

var bool bParryActive;
var float ParryDuration,HardAtkDmgModifier,HeadDmgModifier;

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
simulated function ModifyHardAttackDamage( out int InDamage )
{
    if( bParryActive )
        InDamage += InDamage*HeadDmgModifier;
}

final function SetDuration( float Duration )
{
	ParryDuration = Duration;
}
final function SetHardAtkDmg( float Modifier )
{
	HardAtkDmgModifier = Modifier;
}
final function SetHeadDmg( float Modifier )
{
	HeadDmgModifier = Modifier;
}

final function ResetParry()
{
	ParryDuration = 0;
	HardAtkDmgModifier = 0;
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