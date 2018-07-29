Class Ext_TraitSniping extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSharpshooter(Perk).bHasSniping = true;
	Ext_PerkSharpshooter(Perk).SnipingTimer = 0.f;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSharpshooter(Perk).bHasSniping = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkSharpshooter'
	DefLevelCosts(0)=45
}