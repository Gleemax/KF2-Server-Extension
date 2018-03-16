Class Ext_TraitGhost extends Ext_TraitBase;

static function bool PreventDeath( KFPawn_Human Player, Controller Instigator, Class<DamageType> DamType, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	local Controller C;

	if( (Instigator==None || Instigator==Player.Controller) && DamType==Class'DmgType_Suicided' )
		return false; // Allow normal suicide to go ahead.

	if( Ext_T_GhostHelper(Data).CanResPlayer(Player,Level) )
	{
		// Abort current special move
		if( Player.IsDoingSpecialMove() )
			Player.SpecialMoveHandler.EndSpecialMove();

		// Notify AI to stop hunting me.
		foreach Player.WorldInfo.AllControllers(class'Controller',C)
			C.NotifyKilled(Instigator,Player.Controller,Player,DamType);
		return true;
	}
	return false;
}

defaultproperties
{
	bHighPriorityDeath=true
	NumLevels=2
	TraitData=class'Ext_T_GhostHelper'
	DefLevelCosts(0)=30
	DefLevelCosts(1)=30
	DefMinLevel=30
}