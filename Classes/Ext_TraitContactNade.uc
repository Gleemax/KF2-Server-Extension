Class Ext_TraitContactNade extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bExplodeOnContact = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bExplodeOnContact = false;
}

defaultproperties
{
	TraitName="接触式引线"
	DefLevelCosts(0)=25
	Description="使你的1/2炸药在接触丧尸时能够立刻爆炸。"
}