Class Ext_TraitContactNade extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bExplodeOnContact = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bExplodeOnContact = false;
}

defaultproperties
{
	TraitName="�Ӵ�ʽ����"
	DefLevelCosts(0)=25
	Description="ʹ���1/2ըҩ�ڽӴ�ɥʬʱ�ܹ����̱�ը��"
}