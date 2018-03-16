Class Ext_TraitZED_Health extends Ext_TraitZEDBase
	abstract;

var array<float> HPList;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	local Ext_T_ZEDHelper H;

	foreach Player.ChildActors(class'Ext_T_ZEDHelper',H)
		H.SetHealthScale(Default.HPList[Level-1]);
}
static function CancelEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	local Ext_T_ZEDHelper H;

	foreach Player.ChildActors(class'Ext_T_ZEDHelper',H)
		H.SetHealthScale(1);
}

defaultproperties
{
	NumLevels=4
	bPostApplyEffect=true
	DefLevelCosts(0)=15
	DefLevelCosts(1)=25
	DefLevelCosts(2)=40
	DefLevelCosts(3)=60
	
	HPList.Add(1.25)
	HPList.Add(1.5)
	HPList.Add(1.75)
	HPList.Add(2)
}