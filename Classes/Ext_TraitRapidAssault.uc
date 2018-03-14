Class Ext_TraitRapidAssault extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSWAT(Perk).bRapidAssault = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSWAT(Perk).bRapidAssault = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkSWAT'
	TraitGroup=class'Ext_TGroupZEDTime'
	TraitName="丧尸时间 - 急速突击"
	DefLevelCosts(0)=30
	Description="在丧尸时间中，使玩家的职业武器拥有无限弹药而且能够实时开火。"
}