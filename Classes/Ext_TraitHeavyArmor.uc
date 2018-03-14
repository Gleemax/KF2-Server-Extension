Class Ext_TraitHeavyArmor extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	if( Level >= 3 )
		Perk.bHeavyArmor = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bHeavyArmor = false;
}

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Level == 1 ? Player.AddArmor(100) : Player.AddArmor(Player.MaxArmor);
}

defaultproperties
{
	TraitName="重型护甲"
	NumLevels=3
	DefLevelCosts(0)=20
	DefLevelCosts(1)=30
	DefLevelCosts(2)=50
	DefMinLevel=50
	Description="使你重生时拥有100点护甲值。|Level 2 使你重生时拥有最大护甲。|Level 3 你的护甲会吸收尖叫和跌落外的所有伤害。"
}