Class Ext_TraitInvincible extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSurvivalist(Perk).bhasInvincible = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSurvivalist(Perk).bhasInvincible = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkSurvivalist'
	TraitGroup=class'Ext_TGroupZEDTime'
	DefLevelCosts(0)=25
    DefMinLevel=45
}