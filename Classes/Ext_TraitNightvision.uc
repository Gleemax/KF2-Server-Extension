Class Ext_TraitNightvision extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bHasNightVision = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bHasNightVision = false;
}

defaultproperties
{
	NumLevels=1
	DefLevelCosts(0)=25
}