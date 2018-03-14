Class Ext_TraitEnemyHP extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.EnemyHealthRange = Level;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.EnemyHealthRange = 0;
}

defaultproperties
{
	TraitName="生命值探测"
	NumLevels=4
	DefLevelCosts(0)=25
	DefLevelCosts(1)=20
	DefLevelCosts(2)=30
	DefLevelCosts(3)=45
	Description="让你能够探测敌人的生命值，探测距离随等级上升：|Lv1-4: 12, 18, 32, 48"
}