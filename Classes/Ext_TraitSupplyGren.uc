Class Ext_TraitSupplyGren extends Ext_TraitSupply;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_TraitSupplyData(Data).SpawnSupplier(Player,true);
}
static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	if( Level > 1 )
	{
		Perk.ExtraGrenade += Default.CarryAdd;
		Perk.PerkManager.SetGrenadeCap(Perk.ExtraGrenade);
	}
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	if( Level > 1 )
	{
		Perk.ExtraGrenade -= Default.CarryAdd;
		Perk.PerkManager.SetGrenadeCap(Perk.ExtraGrenade);
	}
}

defaultproperties
{
	CarryAdd=3
	SupplyIcon=Texture2D'UI_World_TEX.Demolitionist_Supplier_HUD'
}