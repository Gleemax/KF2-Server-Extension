Class Ext_TraitSupplyGren extends Ext_TraitSupply;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_TraitSupplyData(Data).SpawnSupplier(Player,true);
}

defaultproperties
{
	SupplyIcon=Texture2D'UI_World_TEX.Demolitionist_Supplier_HUD'
}