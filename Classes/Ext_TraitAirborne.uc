Class Ext_TraitAirborne extends Ext_TraitBase;

var array<float> HealRates;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkFieldMedic(Perk).AirborneAgentHealRate = Default.HealRates[Level-1];
	Ext_PerkFieldMedic(Perk).AirborneAgentLevel = (Level<4 ? 1 : 2);
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkFieldMedic(Perk).AirborneAgentLevel = 0;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkFieldMedic'
	DefLevelCosts(0)=20
	DefLevelCosts(1)=10
	DefLevelCosts(2)=10
	DefLevelCosts(3)=60
	HealRates(0)=0.05
	HealRates(1)=0.1
	HealRates(2)=0.2
	HealRates(3)=0.15
	NumLevels=4
	DefMinLevel=50
}