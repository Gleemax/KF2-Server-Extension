Class Ext_TraitAirborneAgent extends Ext_TraitBase;

static function string GetPerkDescription()
{
	local string S;

	S = Super.GetPerkDescription();
	S $= "|特性需求转生等级: #{FF4000}1";
	return S;
}

static function bool MeetsRequirements( byte Lvl, Ext_PerkBase Perk )
{
	local int i;

	if( Perk.CurrentLevel<Default.MinLevel || Perk.CurrentPrestige<1 )
		return false;
		
	for( i=0; i<Perk.PerkTraits.Length; ++i )
	{
		if( Perk.PerkTraits[i].TraitType==Class'Ext_TraitGrenadeUpg' )
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
	Ext_PerkFieldMedic(Perk).bUseAirborneAgent = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkFieldMedic(Perk).bUseAirborneAgent = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkFieldMedic'
	TraitGroup=class'Ext_TGroupZEDTime'
	TraitName="丧尸时间 - 悬浮剂"
	NumLevels=1
	DefLevelCosts(0)=60
	DefMinLevel=75
	Description="在丧尸时间内，你会释放一股治疗气体，治疗接近你的队友. ||-需求：手雷升级天赋"
}