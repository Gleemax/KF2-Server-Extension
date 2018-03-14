Class Ext_TraitSWATEnforcer extends Ext_TraitBase;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	if( ExtHumanPawn(Player)!=None )
		ExtHumanPawn(Player).bMovesFastInZedTime = true;
}
static function CancelEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	if( ExtHumanPawn(Player)!=None )
		ExtHumanPawn(Player).bMovesFastInZedTime = false;
}
static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bHasSWATEnforcer = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bHasSWATEnforcer = false;
}

defaultproperties
{
	TraitName="丧尸时间 - 执法者"
	TraitGroup=class'Ext_TGroupZEDTime'
	DefLevelCosts(0)=50
	Description="在丧尸时间内，你可以实时移动并且可以撞倒移动路径上的丧尸。"
}