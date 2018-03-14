Class Ext_TraitTactician extends Ext_TraitBase;

static function string GetPerkDescription()
{
	local string S;

	S = Super.GetPerkDescription();
	S $= "|天赋需要转生等级： #{FF4000}1";
	return S;
}

static function bool MeetsRequirements( byte Lvl, Ext_PerkBase Perk )
{
	local int i;

	if( Perk.CurrentLevel<Default.MinLevel)
		return false;
	
	if( Lvl==0 )
	{
		i = Perk.PerkStats.Find('StatType','Damage');
		if( i>=0 )
			return (Perk.PerkStats[i].CurrentValue>=30);
	}
	
	return true;
}

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkCommando(Perk).bUseProfessional = true;
}

static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkCommando(Perk).bUseProfessional = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkCommando'
	TraitGroup=class'Ext_TGroupZEDTime'
	TraitName="丧尸时间 - 战术家"
	NumLevels=1
	DefLevelCosts(0)=30
	DefMinLevel=35
	Description="在丧失时间中。你可以实时装填你的职业武器并且能够以两倍速度切换武器！||-需求：拥有至少30点职业伤害属性"
}