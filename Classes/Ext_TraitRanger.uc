Class Ext_TraitRanger extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSharpshooter(Perk).ZEDTimeStunPower = 4.f;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSharpshooter(Perk).ZEDTimeStunPower = 0.f;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkSharpshooter'
	TraitGroup=class'Ext_TGroupZEDTime'
	TraitName="丧尸时间 - 精准射手"
	DefLevelCosts(0)=40
	Description="在丧尸时间中，你对丧尸爆头将会造成非常有效的击晕效果。"
}