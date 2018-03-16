Class Ext_TraitSupply extends Ext_TraitBase;

var() Texture2D SupplyIcon;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_TraitSupplyData(Data).SpawnSupplier(Player);
}
static function CancelEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_TraitSupplyData(Data).RemoveSupplier();
}
static function PlayerDied( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_TraitSupplyData(Data).RemoveSupplier();
}

defaultproperties
{
	DefLevelCosts(0)=50
	TraitData=class'Ext_TraitSupplyData'
	
	SupplyIcon=Texture2D'UI_World_TEX.Support_Supplier_HUD'
}