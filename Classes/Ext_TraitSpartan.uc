Class Ext_TraitSpartan extends Ext_TraitBase;

var array<float> AtkRates;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	if( ExtHumanPawn(Player)!=None )
		ExtHumanPawn(Player).bMovesFastInZedTime = true;
	Ext_PerkBerserker(Perk).ZedTimeMeleeAtkRate = 1.f/Default.AtkRates[Level-1];
}
static function CancelEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	if( ExtHumanPawn(Player)!=None )
		ExtHumanPawn(Player).bMovesFastInZedTime = false;
	Ext_PerkBerserker(Perk).ZedTimeMeleeAtkRate = 1.f;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkBerserker'
	TraitGroup=class'Ext_TGroupZEDTime'
	TraitName="丧尸时间 - 斯巴达！"
	NumLevels=3
	DefLevelCosts(0)=50
	DefLevelCosts(1)=40
	DefLevelCosts(2)=80
	Description="在丧尸时间中，你可以实时移动并且会以更快速度进行攻击：|Lv1-3: +50,+120,+300% 攻击速度"
	AtkRates.Add(1.5)
	AtkRates.Add(2.2)
	AtkRates.Add(4.0)
	DefMinLevel=100
}