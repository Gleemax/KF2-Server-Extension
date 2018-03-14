Class Ext_TraitAmmoReg extends Ext_TraitBase;

var array<float> RegenValues;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	local Ext_T_AmmoRegHelp H;
	
	H = Player.Spawn(class'Ext_T_AmmoRegHelp',Player);
	if( H!=None )
		H.RegCount = Default.RegenValues[Level-1];
}
static function CancelEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	local Ext_T_AmmoRegHelp H;

	foreach Player.ChildActors(class'Ext_T_AmmoRegHelp',H)
		H.Destroy();
}

defaultproperties
{
	TraitGroup=class'Ext_TGroupRegen'
	TraitName="弹药再生"
	NumLevels=3
	DefLevelCosts(0)=10
	DefLevelCosts(1)=20
	DefLevelCosts(2)=40
	Description="该天赋会使你所有武器的弹药（除手榴弹）每半分钟按以下效率恢复：|Lv1-3: 2%, 5%, 10% 的总弹药"
	RegenValues.Add(0.02)
	RegenValues.Add(0.05)
	RegenValues.Add(0.1)
}