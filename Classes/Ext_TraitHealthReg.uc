Class Ext_TraitHealthReg extends Ext_TraitBase;

var array<byte> RegenValues;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	local Ext_T_HealthRegHelp H;
	
	H = Player.Spawn(class'Ext_T_HealthRegHelp',Player);
	if( H!=None )
		H.RegCount = Default.RegenValues[Level-1];
}
static function CancelEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	local Ext_T_HealthRegHelp H;

	foreach Player.ChildActors(class'Ext_T_HealthRegHelp',H)
		H.Destroy();
}

defaultproperties
{
	TraitGroup=class'Ext_TGroupRegen'
	TraitName="生命再生"
	NumLevels=3
	DefLevelCosts(0)=10
	DefLevelCosts(1)=20
	DefLevelCosts(2)=40
	Description="该天赋会使你的生命值每十秒钟按以下效率恢复：|Lvl1-3: +5HP, +10HP, +20HP"
	RegenValues.Add(5)
	RegenValues.Add(10)
	RegenValues.Add(20)
}