Class Ext_TraitDemoCriticalHit extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkDemolition(Perk).bCriticalHit = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkDemolition(Perk).bCriticalHit = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkDemolition'
	TraitName="破甲弹头"
	DefLevelCosts(0)=100
	DefMinLevel=50
	Description="爆破职业武器将会对丧尸的弱点额外造成50%伤害。"
}