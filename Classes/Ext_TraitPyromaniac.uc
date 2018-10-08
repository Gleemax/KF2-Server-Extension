Class Ext_TraitPyromaniac extends Ext_TraitBase;

static function string GetPerkDescription()
{
	local string S;

	S = Super.GetPerkDescription();
	S $= Default.ExtraDesc;
	return S;
}

static function bool MeetsRequirements( byte Lvl, Ext_PerkBase Perk )
{
	if( Perk.CurrentLevel<Default.MinLevel || Perk.CurrentPrestige<2 )
		return false;
	
	return true;
}

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkFirebug(Perk).bPyromaniac = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkFirebug(Perk).bPyromaniac = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkFirebug'
	TraitGroup=class'Ext_TGroupZEDTime'
	DefLevelCosts(0)=70
    DefMinLevel=75
}