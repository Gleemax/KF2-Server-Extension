Class Ext_TraitMadman extends Ext_TraitBase;

static function string GetPerkDescription()
{
	local string S;

	S = Super.GetPerkDescription();
	S $= Default.ExtraDesc;
	return S;
}

static function bool MeetsRequirements( byte Lvl, Ext_PerkBase Perk )
{
	if( Perk.CurrentLevel<Default.MinLevel || Perk.CurrentPrestige<3 )
		return false;
	
	return true;
}

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSurvivalist(Perk).bHasMadman = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSurvivalist(Perk).bHasMadman = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkSurvivalist'
	TraitGroup=class'Ext_TGroupZEDTime'
	DefLevelCosts(0)=45
    DefMinLevel=75
}