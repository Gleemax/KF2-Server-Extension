Class Ext_TraitArmorRep extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkFieldMedic(Perk).RepairArmorRate = float(Level)*0.05f;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkFieldMedic(Perk).RepairArmorRate = 0;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkFieldMedic'
	TraitName="�����޸�"
	NumLevels=5
	DefLevelCosts(0)=10
	DefLevelCosts(1)=15
	DefLevelCosts(2)=20
	DefLevelCosts(3)=25
	DefLevelCosts(4)=35
	Description="���ܹ��������Ʊ���ʱ�޸��令�ף�ÿ�����ӵ�и��ߵĻ����޸�������|Lv1-5: +5%, +10%, +15%, +20%, +25%"
}