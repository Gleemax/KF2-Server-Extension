Class Ext_TraitDemoReactiveArmor extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkDemolition(Perk).bCanUseSacrifice = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkDemolition(Perk).bCanUseSacrifice = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkDemolition'
	DefLevelCosts(0)=25
	DefMinLevel=45
}