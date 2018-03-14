Class Ext_TraitGrenadeSUpg extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	if( Level==1 )
		Perk.GrenadeClass = Perk.SuperGrenade;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.GrenadeClass = Perk.Default.GrenadeClass;
}

defaultproperties
{
	TraitName="手雷升级"
	DefLevelCosts(0)=50
	Description="使用特定的超级职业手雷替换你的通用手雷。|Level 1: 超级手雷"
	DefMinLevel=50
}