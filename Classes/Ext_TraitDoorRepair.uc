Class Ext_TraitDoorRepair extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSupport(Perk).bCanRepairDoors = true;
}

static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSupport(Perk).bCanRepairDoors = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkSupport'
	NumLevels=1
	DefLevelCosts(0)=30
	DefMinLevel=25
}