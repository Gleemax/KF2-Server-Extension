Class Ext_TraitWPDemo extends Ext_TraitWeapons;

defaultproperties
{
	TraitName="���Ƴ�ʼ����"
	Description="ʹ������ʱЯ���ض�������ְҵ������|Level 1: C4|Level 2: M79�񵯷�����|Level 3: RPG���������|Level 4: ����ȫ��3��"
	
	LevelEffects(0)=(LoadoutClasses=(class'KFWeap_Thrown_C4'))
	LevelEffects(1)=(LoadoutClasses=(class'KFWeap_GrenadeLauncher_M79'))
	LevelEffects(2)=(LoadoutClasses=(class'KFWeap_RocketLauncher_RPG7'))
	LevelEffects(3)=(LoadoutClasses=(class'KFWeap_Thrown_C4',class'KFWeap_GrenadeLauncher_M79',class'KFWeap_RocketLauncher_RPG7'))
}