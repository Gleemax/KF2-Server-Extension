Class Ext_TraitEliteReload extends Ext_TraitBase;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bTacticalReload = true;
}
static function CancelEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bTacticalReload = false;
}

defaultproperties
{
	TraitName="战术装填"
	DefLevelCosts(0)=50
	Description="该天赋会使你的职业武器拥有额外的战术装填动作和装填速度。"
	DefMinLevel=50
}