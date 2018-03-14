Class Ext_TraitDemoCriticalHit extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkDemolition(Perk).bCriticalHit = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkDemolition(Perk).bCriticalHit = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkDemolition'
	TraitName="�Ƽ׵�ͷ"
	DefLevelCosts(0)=100
	DefMinLevel=50
	Description="����ְҵ���������ɥʬ������������50%�˺���"
}