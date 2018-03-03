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
	TraitName="Rack 'em up"
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
	Description="Deals more damage to each consequtive headshot done to zeds up to 5 stacks.|For each level you can make a bigger combo and deal more damage and sustain in a rate of:|Lv1-5: +5%/1.5s, +7.5%/1.75s, +10%/2s, +12.5%/2.5s, +15%/3s"
}