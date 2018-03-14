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
	TraitName="救赎"
	DefLevelCosts(0)=30
	DefLevelCosts(1)=30
	DefMinLevel=30
	Description="该天赋会使你在死亡时转为一个幽灵并且随后在地图的另一个点复活。|Level 1: 50%几率生效，死亡前只会出现一次。|Level 2: 每三分钟必定生效一次。"
}