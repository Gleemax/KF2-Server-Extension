Class Ext_TraitWPComm extends Ext_TraitWeapons;

defaultproperties
{
	TraitName="ͻ����ʼ����"
	Description="ʹ������ʱЯ���ض�ͻ����ְҵ������|Level 1: Сţʽ��ǹ|Level 2: AK12|Level 3: SCAR|Level 4: ����ȫ��3��"
	
	LevelEffects(0)=(LoadoutClasses=(class'KFWeap_AssaultRifle_Bullpup'))
	LevelEffects(1)=(LoadoutClasses=(class'KFWeap_AssaultRifle_AK12'))
	LevelEffects(2)=(LoadoutClasses=(class'KFWeap_AssaultRifle_SCAR'))
	LevelEffects(3)=(LoadoutClasses=(class'KFWeap_AssaultRifle_Bullpup',class'KFWeap_AssaultRifle_AK12',class'KFWeap_AssaultRifle_SCAR'))
}