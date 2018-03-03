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
	TraitName="Enemy Health Bar"
	NumLevels=4
	DefLevelCosts(0)=25
	DefLevelCosts(1)=20
	DefLevelCosts(2)=30
	DefLevelCosts(3)=45
	Description="This trait lets you see enemy health bars. The distance is increased by every level in:|Lv1-4: 12, 18, 32, 48"
}