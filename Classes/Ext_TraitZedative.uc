Class Ext_TraitZedative extends Ext_TraitBase;

static function string GetPerkDescription()
{
	local string S;

	S = Super.GetPerkDescription();
	S $= "|天赋需要转生等级： #{FF4000}2";
	return S;
}

static function bool MeetsRequirements( byte Lvl, Ext_PerkBase Perk )
{
	local int i;

	if( Perk.CurrentLevel<Default.MinLevel || Perk.CurrentPrestige<2 )
		return false;
	
	if( Lvl==0 )
	{
		i = Perk.PerkStats.Find('StatType','Heal');
		if( i>=0 )
			return (Perk.PerkStats[i].CurrentValue>=25);
	}
	
	return true;
}

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkFieldMedic(Perk).bUseSlug = true;
}

static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkFieldMedic(Perk).bUseSlug = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkFieldMedic'
	TraitGroup=class'Ext_TGroupZEDTime'
	TraitName="丧尸时间 - 丧尸狂"
	NumLevels=1
	DefLevelCosts(0)=50
	DefMinLevel=65
	Description="在丧尸时间中，使用医疗职业武器伤害丧尸会使其减速30%并且造成大量毒素伤害。||-需求：拥有至少30点治疗速率属性"
}