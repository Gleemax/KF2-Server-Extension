Class Ext_TraitWPSurv extends Ext_TraitWeapons;

defaultproperties
{
	TraitName="�����ʼ����"
	Description="ʹ������ʱЯ���ض�����ר��ְҵ������|Level 1: ��Ϣ����ǹ|Level 2: M16ͻ����ǹ|Level 3: 401ͻ����ǹ|Level 4: ����ȫ��3��"
	
	LevelEffects(0)=(LoadoutClasses=(class'KFWeap_Shotgun_DragonsBreath'))
	LevelEffects(1)=(LoadoutClasses=(class'KFWeap_AssaultRifle_M16M203'))
	LevelEffects(2)=(LoadoutClasses=(class'KFWeap_AssaultRifle_Medic'))
	LevelEffects(3)=(LoadoutClasses=(class'KFWeap_Shotgun_DragonsBreath',class'KFWeap_AssaultRifle_M16M203',class'KFWeap_AssaultRifle_Medic'))
}