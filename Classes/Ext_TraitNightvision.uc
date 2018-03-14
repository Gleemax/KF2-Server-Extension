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
	TraitName="夜视仪"
	NumLevels=1
	DefLevelCosts(0)=25
	Description="使你重生的时候携带夜视仪。"
}