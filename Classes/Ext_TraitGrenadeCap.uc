Class Ext_TraitGrenadeCap extends Ext_TraitCarryCap;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data );
static function CancelEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data );

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.PerkManager.SetGrenadeCap(Default.CarryAdds[Level-1]);
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.PerkManager.SetGrenadeCap(-Default.CarryAdds[Level-1]);
}

defaultproperties
{
	DefLevelCosts(0)=25
	DefLevelCosts(1)=40
	DefLevelCosts(2)=55
	DefLevelCosts(3)=75
	DefLevelCosts(4)=125
	CarryAdds(0)=1
	CarryAdds(1)=2
	CarryAdds(2)=3
	CarryAdds(3)=5
	CarryAdds(4)=7
}