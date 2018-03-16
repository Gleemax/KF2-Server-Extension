Class Ext_TraitMetronome extends Ext_TraitBase;

var array<byte> IntervallSize;
var array<byte> MaxStackSize;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkMetronomeBase(Perk).SetIntervall(Default.IntervallSize[Level-1]);
	Ext_PerkMetronomeBase(Perk).SetMaxStack(Default.MaxStackSize[Level-1]);
	Ext_PerkMetronomeBase(Perk).EnableMetronome(true);
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkMetronomeBase(Perk).EnableMetronome(false);
}
static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkMetronomeBase(Perk).EnableUI(true);
}
static function PlayerDied( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkMetronomeBase(Perk).EnableUI(false);
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkMetronomeBase'
	DefLevelCosts(0)=25
	DefLevelCosts(1)=30
	DefLevelCosts(2)=40
	DefLevelCosts(3)=75
	IntervallSize.Add(30)
	IntervallSize.Add(20)
	IntervallSize.Add(15)
	IntervallSize.Add(15)
	MaxStackSize.Add(1)
	MaxStackSize.Add(1)
	MaxStackSize.Add(1)
	MaxStackSize.Add(2)
	NumLevels=4
}