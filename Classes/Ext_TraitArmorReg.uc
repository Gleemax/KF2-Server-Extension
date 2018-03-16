Class Ext_TraitArmorReg extends Ext_TraitHealthReg;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	local Ext_T_ArmorRegHelp H;
	
	H = Player.Spawn(class'Ext_T_ArmorRegHelp',Player);
	if( H!=None )
		H.RegCount = Default.RegenValues[Level-1];
}
static function CancelEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	local Ext_T_ArmorRegHelp H;

	foreach Player.ChildActors(class'Ext_T_ArmorRegHelp',H)
		H.Destroy();
}

defaultproperties
{
	TraitGroup=class'Ext_TGroupRegen'
	RegenValues.Empty()
	RegenValues.Add(7)
	RegenValues.Add(12)
	RegenValues.Add(25)
}