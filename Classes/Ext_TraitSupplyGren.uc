Class Ext_TraitSupplyGren extends Ext_TraitSupply;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_TraitSupplyData(Data).SpawnSupplier(Player,true);
}

defaultproperties
{
	TraitName="手雷补给"
	Description="你可以每隔一段时间为你的队友提供手雷，每次提供都会使你获得少量的经验值。"
	
	SupplyIcon=Texture2D'UI_World_TEX.Demolitionist_Supplier_HUD'
}