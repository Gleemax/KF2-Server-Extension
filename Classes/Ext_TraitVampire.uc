Class Ext_TraitVampire extends Ext_TraitBase;

var() array<float> RegenRate;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkBerserker(Perk).VampRegenAmount = Default.RegenRate[Level-1];
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkBerserker(Perk).VampRegenAmount = 0;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkBerserker'
	NumLevels=4
	DefLevelCosts(0)=20
	DefLevelCosts(1)=30
	DefLevelCosts(2)=35
	DefLevelCosts(3)=45
	RegenRate.Add(2)
	RegenRate.Add(3)
	RegenRate.Add(4)
	RegenRate.Add(5)
}