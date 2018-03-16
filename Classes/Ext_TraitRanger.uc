Class Ext_TraitRanger extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSharpshooter(Perk).ZEDTimeStunPower = 4.f;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSharpshooter(Perk).ZEDTimeStunPower = 0.f;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkSharpshooter'
	TraitGroup=class'Ext_TGroupZEDTime'
	DefLevelCosts(0)=40
}