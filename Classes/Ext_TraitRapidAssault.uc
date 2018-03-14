Class Ext_TraitRapidAssault extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSWAT(Perk).bRapidAssault = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkSWAT(Perk).bRapidAssault = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkSWAT'
	TraitGroup=class'Ext_TGroupZEDTime'
	TraitName="ɥʬʱ�� - ����ͻ��"
	DefLevelCosts(0)=30
	Description="��ɥʬʱ���У�ʹ��ҵ�ְҵ����ӵ�����޵�ҩ�����ܹ�ʵʱ����"
}