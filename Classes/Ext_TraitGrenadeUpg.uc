Class Ext_TraitGrenadeUpg extends Ext_TraitBase;

static function bool MeetsRequirements( byte Lvl, Ext_PerkBase Perk )
{
	if( Lvl>=1 && Perk.CurrentLevel<50 )
		return false;
	return Super.MeetsRequirements(Lvl,Perk);
}
static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	if( Level==1 )
		Perk.GrenadeClass = Perk.PerkGrenade;
	else if( Level==2 )
		Perk.GrenadeClass = Perk.SuperGrenade;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.GrenadeClass = Perk.Default.GrenadeClass;
}

defaultproperties
{
	TraitName="手雷升级"
	NumLevels=2
	DefLevelCosts(0)=5
	DefLevelCosts(1)=50
	Description="使用特定的职业手雷替换你的通用手雷。|Level 1: 普通职业手雷|Level 2: 超级职业手雷（需求：50级）"
}