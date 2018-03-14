Class Ext_TraitPenetrator extends Ext_TraitBase;

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
	
	for( i=0; i<Perk.PerkTraits.Length; ++i )
	{
		if( Perk.PerkTraits[i].TraitType==Class'Ext_TraitAPShots' )
		{
			if( Perk.PerkTraits[i].CurrentLevel <= 0 )
				return false;
			else break;
		}
	}
	
	return true;
}

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSupport(Perk).bUsePerforate = true;
}

static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSupport(Perk).bUsePerforate = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkSupport'
	TraitGroup=class'Ext_TGroupZEDTime'
	TraitName="丧尸时间 - 穿刺者"
	NumLevels=1
	DefLevelCosts(0)=50
	DefMinLevel=65
	Description="在丧尸时间中，你的职业武器将能够穿透任何击中的目标。||-需求：至少拥有1级穿甲弹技能"
}