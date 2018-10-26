Class Ext_TraitParry extends Ext_TraitBase;

var float Duration,Reduction,HardAtkDamage,HeadshotDamage;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkParryBase(Perk).SetDuration(Default.Duration);
	Ext_PerkParryBase(Perk).SetReduction(Default.Reduction);
	if( Level>1 )
    	Ext_PerkParryBase(Perk).SetHardAtkDamage(Default.HardAtkDamage);
	if( Level>2 )
		Ext_PerkParryBase(Perk).SetHeadDmg(Default.HeadshotDamage);
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkParryBase(Perk).ResetParry();
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkParryBase'
	DefLevelCosts(0)=30
	DefLevelCosts(1)=15
	DefLevelCosts(2)=60
	Duration=5.0
	Reduction=0.3
    HardAtkDamage=0.5
    HeadshotDamage=1.0
	NumLevels=3
}