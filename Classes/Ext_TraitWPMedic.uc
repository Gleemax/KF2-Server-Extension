Class Ext_TraitWPMedic extends Ext_TraitWeapons;

defaultproperties
{
	TraitName="ҽ�Ƴ�ʼ����"
	Description="ʹ������ʱЯ���ض�ҽ��ְҵ������|Level 1: 201���ǹ|Level 2: 301����ǹ|Level 3: 401ͻ����ǹ|Level 4: ����ȫ��3��"
	
	LevelEffects(0)=(LoadoutClasses=(class'KFWeap_SMG_Medic'))
	LevelEffects(1)=(LoadoutClasses=(class'KFWeap_Shotgun_Medic'))
	LevelEffects(2)=(LoadoutClasses=(class'KFWeap_AssaultRifle_Medic'))
	LevelEffects(3)=(LoadoutClasses=(class'KFWeap_SMG_Medic',class'KFWeap_Shotgun_Medic',class'KFWeap_AssaultRifle_Medic'))
}