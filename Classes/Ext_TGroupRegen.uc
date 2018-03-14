class Ext_TGroupRegen extends Ext_TGroupBase;

static function string GetUIInfo( Ext_PerkBase Perk )
{
	return Default.GroupInfo$" (最大 "$GetMaxLimit(Perk)$")";
}
static function string GetUIDesc()
{
	return Super.GetUIDesc()$"|完成下列要求更买额外再生技能：|-一转 + 100级 = 最大两个技能|-五转 + 150级 = 最大三个技能";
}

static function bool GroupLimited( Ext_PerkBase Perk, class<Ext_TraitBase> Trait )
{
	local int i;
	local byte n;

	n = GetMaxLimit(Perk);
	for( i=0; i<Perk.PerkTraits.Length; ++i )
		if( Perk.PerkTraits[i].CurrentLevel>0 && Perk.PerkTraits[i].TraitType!=Trait && Perk.PerkTraits[i].TraitType.Default.TraitGroup==Default.Class && --n==0 )
			return true;
	return false;
}

static final function byte GetMaxLimit( Ext_PerkBase Perk )
{
	if( Perk.CurrentPrestige<1 || Perk.CurrentLevel<100 )
		return 1;
	return ((Perk.CurrentPrestige<5 || Perk.CurrentLevel<150) ? 2 : 3);
}

defaultproperties
{
	GroupInfo="再生"
}