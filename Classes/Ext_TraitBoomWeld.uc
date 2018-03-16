Class Ext_TraitBoomWeld extends Ext_TraitBase
	abstract;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bExplosiveWeld = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bExplosiveWeld = false;
}

defaultproperties
{
	DefLevelCosts(0)=30
}