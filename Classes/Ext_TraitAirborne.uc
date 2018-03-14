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
	TraitName="扩散药剂"
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
	Description="使你的治疗针在子弹时间中获得额外的医疗速率，并且会获得范围治疗能力。|每级会获得额外的治疗速度加成：|Lv 1-3: +5%, +10%, +20%|Lv 4: +15%, 在丧失时间外同样生效"
}