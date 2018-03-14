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
	TraitName="丧尸弹片"
	DefLevelCosts(0)=50
	Description="使你烧死的丧尸有时会产生爆炸，击倒其他丧尸。"
}