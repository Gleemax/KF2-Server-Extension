Class Ext_TraitSuppress extends Ext_TraitBase;

var array<float> DamageMutSize;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
    Ext_PerkSWAT(Perk).bSuppression = true;
	Ext_PerkSWAT(Perk).SuppressModifier = Default.DamageMutSize[Level-1];
    Ext_PerkSWAT(Perk).SuppressTimer = 0.f;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
    Ext_PerkSWAT(Perk).bSuppression = false;
	Ext_PerkSWAT(Perk).SuppressModifier = 0.f;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkSWAT'
	NumLevels=3
	DefLevelCosts(0)=25
	DefLevelCosts(1)=30
	DefLevelCosts(2)=35
    DamageMutSize.Add(0.15);
    DamageMutSize.Add(0.25);
    DamageMutSize.Add(0.35);
}