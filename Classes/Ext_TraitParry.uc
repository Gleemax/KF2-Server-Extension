Class Ext_TraitParry extends Ext_TraitBase;

var array<float> DurationSize;
var array<float> MeleeSpeedSize;
var array<float> HardAtkDmgSize;
var array<float> HeadDmgSize;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkParryBase(Perk).SetDuration(Default.DurationSize[Level-1]);
	Ext_PerkParryBase(Perk).SetMeleeSpeed(Default.MeleeSpeedSize[Level-1]);
    Ext_PerkParryBase(Perk).SetHardAtkDmg(Default.HardAtkDmgSize[Level-1]);
	Ext_PerkParryBase(Perk).SetHeadDmg(Default.HeadDmgSize[Level-1]);
	Ext_PerkParryBase(Perk).EnableParry(true);
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkParryBase(Perk).EnableParry(false);
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkParryBase'
	DefLevelCosts(0)=35
	DefLevelCosts(1)=40
	DefLevelCosts(2)=55
	DurationSize.Add(1.0)
	DurationSize.Add(1.0)
	DurationSize.Add(1.0)
	MeleeSpeedSize.Add(0.5)
	MeleeSpeedSize.Add(0.5)
	MeleeSpeedSize.Add(0.5)
    HardAtkDmgSize.Add(0.5)
	HardAtkDmgSize.Add(1.0)
	HardAtkDmgSize.Add(1.0)
    HeadDmgSize.Add(0)
	HeadDmgSize.Add(0)
	HeadDmgSize.Add(0.5)
	NumLevels=3
}