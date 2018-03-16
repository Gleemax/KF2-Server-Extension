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
	DefLevelCosts(0)=50
	DefMinLevel=50
}