Class Ext_TraitToxicDart extends Ext_TraitBase;

var array<int> DartDamages;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.ToxicDartDamage = Default.DartDamages[Level-1];
	Perk.bToxicDart = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Perk.bToxicDart = false;
}

defaultproperties
{
	TraitName="��Һע��"
	DefLevelCosts(0)=25
	DefLevelCosts(1)=25
	DefLevelCosts(2)=30
	DartDamages(0)=15
	DartDamages(1)=35
	DartDamages(2)=70
	NumLevels=3
	Description="ʹ������Ʒ����ܹ���ɥʬ��ɶ����˺����˺���ȼ����ӣ�:|Lv 1-3: 15, 35, 70���˺�"
}