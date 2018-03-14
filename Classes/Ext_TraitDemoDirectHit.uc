Class Ext_TraitDemoDirectHit extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkDemolition(Perk).bDirectHit = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkDemolition(Perk).bDirectHit = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkDemolition'
	TraitName="强烈冲击"
	DefLevelCosts(0)=65
	DefMinLevel=35
	Description="爆破职业武器直击将会额外造成25%的伤害。"
}