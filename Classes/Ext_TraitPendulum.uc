Class Ext_TraitPendulum extends Ext_TraitBase;

var array<float> IntervallSize;
var array<byte> MaxStackSize;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkPendulumBase(Perk).SetIntervall(Default.IntervallSize[Level-1]);
	Ext_PerkPendulumBase(Perk).SetMaxStack(Default.MaxStackSize[Level-1]);
	Ext_PerkPendulumBase(Perk).EnableMetronome(true);
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkPendulumBase(Perk).EnableMetronome(false);
}
static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkPendulumBase(Perk).EnableUI(true);
}
static function PlayerDied( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkPendulumBase(Perk).EnableUI(false);
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkPendulumBase'
	DefLevelCosts(0)=25
	DefLevelCosts(1)=45
	DefLevelCosts(2)=35
	IntervallSize.Add(30)
	IntervallSize.Add(15)
	IntervallSize.Add(15)
	MaxStackSize.Add(1)
	MaxStackSize.Add(1)
	MaxStackSize.Add(2)
	NumLevels=3
}