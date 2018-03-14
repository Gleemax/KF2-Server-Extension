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
	TraitName="反应装甲"
	DefLevelCosts(0)=25
	DefMinLevel=45
	Description="当你濒临死亡时你将会产生一次大爆炸并使你剩余5点生命值。"
}