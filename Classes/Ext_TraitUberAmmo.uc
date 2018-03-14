Class Ext_TraitUberAmmo extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkGunslinger(Perk).bHasUberAmmo = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkGunslinger(Perk).bHasUberAmmo = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkGunslinger'
	TraitGroup=class'Ext_TGroupZEDTime'
	TraitName="丧尸时间 - 子弹风暴"
	DefLevelCosts(0)=30
	Description="在丧尸时间中，你的枪手职业武器有无限弹药。"
}