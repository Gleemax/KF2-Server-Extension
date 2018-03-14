Class Ext_TraitBunnyHop extends Ext_TraitBase;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	if( ExtHumanPawn(Player)!=None )
		ExtHumanPawn(Player).bHasBunnyHop = true;
}
static function CancelEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	if( ExtHumanPawn(Player)!=None )
		ExtHumanPawn(Player).bHasBunnyHop = false;
}

defaultproperties
{
	TraitName="兔子跳"
	DefLevelCosts(0)=50
	DefMinLevel=100
	Description="允许玩家进行兔子跳，使得你在向前移动时能通过连续的向前跳跃使移动速度不断增加。"
}