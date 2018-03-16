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
	NumLevels=2
	DefLevelCosts(0)=5
	DefLevelCosts(1)=50
}