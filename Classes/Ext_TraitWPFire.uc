Class Ext_TraitWPFire extends Ext_TraitWeapons;

defaultproperties
{
	TraitName="�ݻ��ʼ����"
	Description="ʹ������ʱЯ���ض��ݻ��ְҵ������|Level 1: ��Ϣ����ǹ|Level 2: ����������|Level 3: ΢��ǹ|Level 4: ����ȫ��3��"
	
	LevelEffects(0)=(LoadoutClasses=(class'KFWeap_Shotgun_DragonsBreath'))
	LevelEffects(1)=(LoadoutClasses=(class'KFWeap_Flame_Flamethrower'))
	LevelEffects(2)=(LoadoutClasses=(class'KFWeap_Beam_Microwave'))
	LevelEffects(3)=(LoadoutClasses=(class'KFWeap_Shotgun_DragonsBreath',class'KFWeap_Flame_Flamethrower',class'KFWeap_Beam_Microwave'))
}