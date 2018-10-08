Class Ext_PerkCardiacBase extends Ext_PerkBase;

var byte Level,CurrentState,EndState;
var float Duration[2],MoveSpdModifier[2],ResistModifier[2],ReloadSpdModifier[2],HealAmmount[2];

replication
{
	// Things the server should send to the client.
	if ( true )
		Level,CurrentState,Duration,MoveSpdModifier,ReloadSpdModifier;
}

simulated function ModifySpeed( out float Speed )
{
	if( Level> 0 )
		Speed *= MoveSpdModifier[CurrentState];
	super.ModifySpeed(Speed);
}
simulated function ModifyDamageTaken( out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy )
{	
	if( Level> 0 )
		InDamage *= ResistModifier[CurrentState];
	super.ModifyDamageTaken(InDamage,DamageType,InstigatedBy);
}
simulated function float GetReloadRateScale(KFWeapon KFW)
{
	if( Level> 0 )
		return Super.GetReloadRateScale(KFW)*ReloadSpdModifier[CurrentState];
	return Super.GetReloadRateScale(KFW);
}
final function SetLevel( byte lvl )
{
	Level = lvl;
}
final function SetEndState( byte state )
{
	EndState = state;
}

final function ResetCardiac()
{
	Level = 0;
	CurrentState = 0;
}

simulated function StateActive( byte state )
{
    local KFPlayerController PC;

    PC = KFPlayerController(PlayerOwner);
	if( PC != none )
	{
		PC.SetPerkEffect( false );
	}

	PC.PlaySoundBase( AkEvent'WW_GLO_Runtime.Stop_Beserker_Parry_Mode', true );
}

simulated function EffectRun()
{

}

simulated function PassiveDeactive()
{
	
}

simulated function InitiativeActive()
{
}

DefaultProperties
{

}