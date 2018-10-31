Class Ext_TraitPreparation extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSharpshooter(Perk).bHasPreparation = true;
	Ext_PerkSharpshooter(Perk).PrepareTimer = 0.f;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSharpshooter(Perk).bHasPreparation = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkSharpshooter'
	DefLevelCosts(0)=45
}