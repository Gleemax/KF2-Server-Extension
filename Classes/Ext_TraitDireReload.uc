Class Ext_TraitDireReload extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSharpshooter(Perk).bHasDireReload = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSharpshooter(Perk).bHasDireReload = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkSharpshooter'
	TraitName="急迫装填"
	DefLevelCosts(0)=35
	Description="当你的生命值低于40点时你将会极大的增加你的装填速度。"
}