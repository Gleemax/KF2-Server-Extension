Class Ext_TraitGrenadeReg extends Ext_TraitBase;

var array<float> RegenIntervals;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	local Ext_T_GrenadeRegHelp H;
	
	H = Player.Spawn(class'Ext_T_GrenadeRegHelp',Player);
	if( H!=None )
		H.RegInterval = Default.RegenIntervals[Level-1];
}
static function CancelEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	local Ext_T_GrenadeRegHelp H;

	foreach Player.ChildActors(class'Ext_T_GrenadeRegHelp',H)
		H.Destroy();
}

defaultproperties
{
	TraitGroup=class'Ext_TGroupRegen'
	NumLevels=3
	DefLevelCosts(0)=10
	DefLevelCosts(1)=20
	DefLevelCosts(2)=40
	RegenIntervals.Add(15)
	RegenIntervals.Add(9)
	RegenIntervals.Add(5)
}