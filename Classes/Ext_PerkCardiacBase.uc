Class Ext_PerkCardiacBase extends Ext_PerkBase;

var byte Level,CurrentState,EndState;
var array<float> ModifierDuration,MoveSpdModifier,ResistModifier,ReloadSpdModifier,HealAmmount;

replication
{
	// Things the server should send to the client.
	if ( true )
		Level,CurrentState,Duration,MoveSpdModifier,ReloadSpdModifier;
}

simulated function ModifySpeed( out float Speed )
{
	if( Level> 0 )
		Speed *= MoveSpdModifier[CurrentState]
	super.ModifySpeed(Speed);
}
simulated function ModifyDamageTaken( out int InDamage, optional class<DamageType> DamageType, optional Controller InstigatedBy )
{	
	if( Level> 0 )
		Speed *= ResistModifier[CurrentState]
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
final function SetDuration( array<float> Duration )
{
	ModifierDuration = Duration;
}
final function SetMoveSpd( array<float> MoveSpd )
{
	MoveSpdModifier = MoveSpd;
}
final function SetResist( array<float> Resist )
{
	ResistModifier = Resist;
}
final function SetReloadSpd( array<float> ReloadSpd )
{
	ReloadSpdModifier = ReloadSpd;
}
final function SetHealAmmount( array<float> Ammount )
{
	HealAmmount = Ammount;
}

final function ResetCardiac()
{
	Level = 0;
	CurrentState = 0;
	ModifierDuration.Empty()
	MoveSpdModifier.Empty()
	ResistModifier.Empty()
	ReloadSpdModifier.Empty()
	HealAmmount.Empty()
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
	SetTimer(EffectRun, )
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