Class Ext_TraitWPSWAT extends Ext_TraitWeapons;

defaultproperties
{
	TraitName="�ؾ���ʼ����"
	Description="ʹ������ʱЯ���ض��ؾ�ְҵ������|Level 1: MP5���ǹ|Level 2: P90���ǹ|Level 3: Kriss���ǹ|Level 4: ����ȫ��3��"
	
	LevelEffects(0)=(LoadoutClasses=(class'KFWeap_SMG_MP5RAS'))
	LevelEffects(1)=(LoadoutClasses=(class'KFWeap_SMG_P90'))
	LevelEffects(2)=(LoadoutClasses=(class'KFWeap_SMG_Kriss'))
	LevelEffects(3)=(LoadoutClasses=(class'KFWeap_SMG_MP5RAS',class'KFWeap_SMG_P90',class'KFWeap_SMG_Kriss'))
}