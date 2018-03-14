Class Ext_TraitVampire extends Ext_TraitBase;

var() array<float> RegenRate;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkBerserker(Perk).VampRegenRate = Default.RegenRate[Level-1];
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkBerserker(Perk).VampRegenRate = 0;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkBerserker'
	TraitName="吸血鬼"
	NumLevels=4
	DefLevelCosts(0)=25
	DefLevelCosts(1)=15
	DefLevelCosts(2)=20
	DefLevelCosts(3)=25
	RegenRate.Add(0.02)
	RegenRate.Add(0.03)
	RegenRate.Add(0.04)
	RegenRate.Add(0.05)
	Description="该天赋会使你在使用近战武器击杀丧尸时按如下百分比恢复生命值：|Lv1-4: +2%, +3%, +4%, +5%"
}