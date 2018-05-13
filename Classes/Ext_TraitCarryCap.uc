Class Ext_TraitCarryCap extends Ext_TraitBase;

var array<byte> CarryAdds;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	local KFInventoryManager M;

	M = KFInventoryManager(Player.InvManager);
	if( M!=None )
		M.MaxCarryBlocks += Default.CarryAdds[Level-1];
}
static function CancelEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	local KFInventoryManager M;

	M = KFInventoryManager(Player.InvManager);
	if( M!=None )
		M.MaxCarryBlocks -= Default.CarryAdds[Level-1];
}

defaultproperties
{
	NumLevels=5
	DefLevelCosts(0)=10
	DefLevelCosts(1)=15
	DefLevelCosts(2)=20
	DefLevelCosts(3)=25
	DefLevelCosts(4)=50
	CarryAdds.Add(2)
	CarryAdds.Add(4)
	CarryAdds.Add(6)
	CarryAdds.Add(8)
	CarryAdds.Add(15)
}