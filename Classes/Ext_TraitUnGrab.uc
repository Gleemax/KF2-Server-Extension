Class Ext_TraitUnGrab extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bCanBeGrabbed = false;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bCanBeGrabbed = true;
}

defaultproperties
{
	TraitName="欺诈"
	DefLevelCosts(0)=30
	Description="该天赋会使你无法被丧尸抓取。"
}