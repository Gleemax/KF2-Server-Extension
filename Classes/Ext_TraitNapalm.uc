Class Ext_TraitNapalm extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bNapalmFire = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bNapalmFire = false;
}

defaultproperties
{
	TraitName="凝固汽油"
	DefLevelCosts(0)=35
	Description="使得你点燃的丧尸能够点燃其他的丧尸。"
}