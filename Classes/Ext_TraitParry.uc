Class Ext_TraitParry extends Ext_TraitBase;

var float Duration,Reduction,MeleeDamage,HeadshotDamage;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkParryBase(Perk).SetDuration(Default.Duration);
	Ext_PerkParryBase(Perk).SetReduction(Default.Reduction);
	if( Level>1 )
    	Ext_PerkParryBase(Perk).SetMeleeDmg(Default.MeleeDamage);
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
	DefLevelCosts(0)=25
	DefLevelCosts(1)=20
	DefLevelCosts(2)=50
	Duration=5.0
	Reduction=0.3
    MeleeDamage=0.5
    HeadshotDamage=1.0
	NumLevels=3
}