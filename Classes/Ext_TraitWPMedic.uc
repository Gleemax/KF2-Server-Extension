Class Ext_TraitWPMedic extends Ext_TraitWeapons;

defaultproperties
{
	TraitName="医疗初始武器"
	Description="使你重生时携带特定医疗职业武器。|Level 1: 201冲锋枪|Level 2: 301霰弹枪|Level 3: 401突击步枪|Level 4: 以上全部3种"
	
	LevelEffects(0)=(LoadoutClasses=(class'KFWeap_SMG_Medic'))
	LevelEffects(1)=(LoadoutClasses=(class'KFWeap_Shotgun_Medic'))
	LevelEffects(2)=(LoadoutClasses=(class'KFWeap_AssaultRifle_Medic'))
	LevelEffects(3)=(LoadoutClasses=(class'KFWeap_SMG_Medic',class'KFWeap_Shotgun_Medic',class'KFWeap_AssaultRifle_Medic'))
}