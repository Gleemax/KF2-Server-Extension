Class Ext_TraitFireExplode extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bFireExplode = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bFireExplode = false;
}

defaultproperties
{
	DefLevelCosts(0)=50
}