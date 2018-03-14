Class Ext_TraitWPSurv extends Ext_TraitWeapons;

defaultproperties
{
	TraitName="生存初始武器"
	Description="使你重生时携带特定生存专家职业武器。|Level 1: 龙息霰弹枪|Level 2: M16突击步枪|Level 3: 401突击步枪|Level 4: 以上全部3种"
	
	LevelEffects(0)=(LoadoutClasses=(class'KFWeap_Shotgun_DragonsBreath'))
	LevelEffects(1)=(LoadoutClasses=(class'KFWeap_AssaultRifle_M16M203'))
	LevelEffects(2)=(LoadoutClasses=(class'KFWeap_AssaultRifle_Medic'))
	LevelEffects(3)=(LoadoutClasses=(class'KFWeap_Shotgun_DragonsBreath',class'KFWeap_AssaultRifle_M16M203',class'KFWeap_AssaultRifle_Medic'))
}