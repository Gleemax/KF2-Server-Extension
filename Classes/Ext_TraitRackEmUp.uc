Class Ext_TraitRackEmUp extends Ext_TraitBase;

var array<byte> ComboSize;
var array<float> IntervallSize;
var array<float> MultiplierSize;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkRhythmPerkBase(Perk).SetMaxRhythm(Default.ComboSize[Level-1]);
	Ext_PerkRhythmPerkBase(Perk).SetIntervall(Default.IntervallSize[Level-1]);
	Ext_PerkRhythmPerkBase(Perk).SetMultiplier(Default.MultiplierSize[Level-1]);
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkRhythmPerkBase(Perk).ResetRhythm();
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkRhythmPerkBase'
	DefLevelCosts(0)=15
	DefLevelCosts(1)=20
	DefLevelCosts(2)=25
	DefLevelCosts(3)=45
	DefLevelCosts(4)=75
	ComboSize.Add(5)
	ComboSize.Add(5)
	ComboSize.Add(5)
	ComboSize.Add(5)
	ComboSize.Add(5)
	IntervallSize.Add(1.5)
	IntervallSize.Add(1.75)
	IntervallSize.Add(2)
	IntervallSize.Add(2.5)
	IntervallSize.Add(3)
	MultiplierSize.Add(0.05)
	MultiplierSize.Add(0.075)
	MultiplierSize.Add(0.1)
	MultiplierSize.Add(0.125)
	MultiplierSize.Add(0.15)
	NumLevels=5
}