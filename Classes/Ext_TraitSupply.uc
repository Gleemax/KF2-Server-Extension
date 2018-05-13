Class Ext_TraitSupply extends Ext_TraitBase;

var() Texture2D SupplyIcon;
var byte CarryAdd;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	local KFInventoryManager M;

	if( Level > 1 )
	{
		M = KFInventoryManager(Player.InvManager);
		if( M!=None )
			M.MaxCarryBlocks += Default.CarryAdd;
	}

	Ext_TraitSupplyData(Data).SpawnSupplier(Player);
}
static function CancelEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	local KFInventoryManager M;

	if( Level > 1 )
	{
		M = KFInventoryManager(Player.InvManager);
		if( M!=None )
			M.MaxCarryBlocks -= Default.CarryAdd;
	}

	Ext_TraitSupplyData(Data).RemoveSupplier();
}
static function PlayerDied( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_TraitSupplyData(Data).RemoveSupplier();
}

defaultproperties
{
	NumLevels=2
	DefLevelCosts(0)=50
	DefLevelCosts(1)=50
	CarryAdd=5
	TraitData=class'Ext_TraitSupplyData'
	
	SupplyIcon=Texture2D'UI_World_TEX.Support_Supplier_HUD'
}