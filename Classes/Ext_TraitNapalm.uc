Class Ext_TraitNapalm extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bNapalmFire = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bNapalmFire = false;
}

defaultproperties
{
	TraitName="��������"
	DefLevelCosts(0)=35
	Description="ʹ�����ȼ��ɥʬ�ܹ���ȼ������ɥʬ��"
}