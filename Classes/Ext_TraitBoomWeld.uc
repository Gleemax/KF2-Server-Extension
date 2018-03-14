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
	TraitName="焊接陷阱"
	DefLevelCosts(0)=30
	Description="你焊接的自动门会在被丧尸破坏时爆炸，你对同一个门的焊接程度越高，爆炸就越强。"
}