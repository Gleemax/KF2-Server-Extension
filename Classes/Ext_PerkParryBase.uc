Class Ext_PerkParryBase extends Ext_PerkBase;

var bool bParryEnabled,bParryActive;
var float ParryDuration,MeleeSpdModifier,HardAtkDmgModifier,HeadDmgModifier;

simulated function ModifyDamageGiven( out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx )
{
	Super.ModifyDamageGiven(InDamage,DamageCauser,MyKFPM,DamageInstigator,DamageType,HitZoneIdx);
    if( bParryActive && HeadDmgModifier>0 && HitZoneIdx == HZI_HEAD && BasePerk==None || (DamageType!=None && DamageType.Default.ModifierPerkList.Find(BasePerk)>=0) || IsWeaponOnPerk(KFWeapon(DamageCauser))  )
		InDamage += InDamage*HeadDmgModifier;
}
simulated function ModifyHardAttackDamage( out int InDamage )
{
    if( bParryActive )
        InDamage += InDamage*HeadDmgModifier;
}
simulated function ModifyMeleeAttackSpeed( out float InDuration )
{
    if( bParryActive && HardAtkDmgModifier>0 )
        InDuration *= MeleeSpdModifier;
}

final function SetDuration( float Duration )
{
	ParryDuration = Duration;
}
final function SetMeleeSpeed( float Speed )
{
	MeleeSpdModifier = Speed;
}
final function SetHardAtkDmg( float Modifier )
{
	HardAtkDmgModifier = Modifier;
}
final function SetHeadDmg( float Modifier )
{
	HeadDmgModifier = Modifier;
}

final function EnableParry( bool bEnabled )
{
	if (!bEnabled) 
	{
		bParryEnabled = false;
		ParryDuration = 1.0;
		MeleeSpdModifier = 0;
		HardAtkDmgModifier = 0;
		HeadDmgModifier = 0;
	} else 
    {
        bParryEnabled = true;
    }
}

simulated function SetSuccessfullParry()
{
    local KFPlayerController PC;

    if( bParryEnabled )
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