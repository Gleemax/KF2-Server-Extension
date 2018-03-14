Class Ext_TraitDemoAOE extends Ext_TraitBase;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkDemolition(Perk).AOEMult = 1 + (0.15 + (((float(Level) - 1.f) * 5.f) / 100.f));
}

static function CancelEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkDemolition(Perk).AOEMult = 1.0f;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkDemolition'
	TraitName="范围伤害"
	NumLevels=4
	DefLevelCosts(0)=25
	DefLevelCosts(1)=15
	DefLevelCosts(2)=30
	DefLevelCosts(3)=40
	DefMinLevel=15
	Description="增加你的爆破职业武器的伤害范围，其增加的伤害范围随每等级提升：|Lv1-4: 15%, 20%, 25%, 30%"
}